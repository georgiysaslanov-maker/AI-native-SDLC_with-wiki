#!/bin/bash
# SessionStart: проверка, что сессия видит всю базу знаний.
# Сессия стартует с одной ветки; работа прошлых сессий может лежать на других
# ветках, не влитых в неё. Хук находит такие ветки и сообщает агенту в контекст.
# Никогда не роняет старт сессии: любые ошибки — только предупреждение.
set -uo pipefail

cd "${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}" || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0

KB_PATHS=(wiki index.md CHANGELOG.md raw AGENTS.md)
out=()

if ! timeout 30 git fetch --quiet --prune origin '+refs/heads/*:refs/remotes/origin/*' 2>/dev/null; then
  out+=("⚠️ git fetch origin не удался — проверка веток ниже может быть неполной.")
fi

current=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo HEAD)
unmerged=()
while read -r ref; do
  [ "$ref" = "origin/HEAD" ] && continue
  [ "$ref" = "origin/$current" ] && continue
  n=$(git rev-list --count "HEAD..$ref" -- "${KB_PATHS[@]}" 2>/dev/null || echo 0)
  if [ "${n:-0}" -gt 0 ]; then
    last=$(git log -1 --format='%cs «%s»' "$ref" -- "${KB_PATHS[@]}" 2>/dev/null)
    unmerged+=("  - $ref: $n коммит(ов) с изменениями базы знаний, последний $last")
  fi
done < <(git for-each-ref --format='%(refname:short)' refs/remotes/origin)

if [ ${#unmerged[@]} -gt 0 ]; then
  out+=("⚠️ РАССИНХРОН БАЗЫ ЗНАНИЙ: на других ветках есть изменения wiki/index/CHANGELOG/raw, которых нет в текущей ветке ($current):")
  out+=("${unmerged[@]}")
  out+=("Прежде чем отвечать на вопросы или работать с wiki — следуй AGENTS.md §0: просмотри эти ветки (git log HEAD..<ветка>), влей нужные (git merge) и сообщи владельцу. Не делай выводов о состоянии wiki по текущей ветке, пока рассинхрон не устранён.")
fi

# Санити-чек: счётчик в index.md против фактического числа страниц.
if [ -f index.md ] && [ -d wiki ]; then
  declared=$(grep -oE 'Страниц в wiki: [0-9]+' index.md | grep -oE '[0-9]+' | head -1)
  actual=$(find wiki -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')
  if [ -n "${declared:-}" ] && [ "$declared" != "$actual" ]; then
    out+=("⚠️ index.md заявляет $declared страниц, а в wiki/ лежит $actual — индекс рассинхронизирован (AGENTS.md §6).")
  fi
fi

if [ ${#out[@]} -gt 0 ]; then
  printf '%s\n' "${out[@]}"
else
  echo "База знаний синхронна: других веток с неучтёнными изменениями wiki нет (текущая ветка: $current)."
fi
exit 0
