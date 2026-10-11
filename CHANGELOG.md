# CHANGELOG — журнал изменений

> Записи добавляются агентом после каждой рабочей сессии. Новые записи — сверху.
>
> Формат:
> ```
> ## YYYY-MM-DD
> - что обработано из raw
> - какие страницы wiki созданы или обновлены
> - какие новые связи установлены
> ```

## 2026-10-11
- Обработано из raw: `raw/METHODOLOGY-ai-native-sdlc.md`, `raw/Митап_ДПР_08.10.26_транскрипт.md`
- Созданы страницы-источники: [[methodology-ai-native-sdlc-exolve]], [[meetup-dpr-2026-10-08]]
- Созданы страницы-темы: [[ai-native-sdlc]], [[intent-and-acceptance]], [[human-gates]], [[spec-driven-development]], [[ears-notation]], [[reverse-spec]], [[traceability-matrix]], [[cross-service-changes]], [[vendor-neutral-agent-architecture]], [[agent-harness]], [[control-layers]], [[agent-skills]], [[agent-hooks]], [[model-cost-routing]], [[context-management]], [[repo-context]], [[product-context]], [[single-source-of-truth]], [[team-knowledge-repository]], [[self-verification-loop]], [[independent-acceptance-layer]], [[agent-evals]], [[bidirectional-code-review]], [[branch-protection-and-codeowners]], [[organizational-model-access]], [[data-perimeter]], [[ai-governance]], [[ai-risk-register]], [[phase-0-foundation]], [[ai-platform-team]], [[ai-sdlc-metrics]], [[ai-change-management]], [[developer-skill-erosion]], [[case-exolve-saas-pet-project]], [[case-ai-load-test-analysis]], [[case-autotest-run-triage]]
- Созданы страницы-сущности: [[mts-exolve]], [[openspec]], [[opencode]], [[orca-ide]], [[qa-agent]], [[igor-rumyantsev]], [[nikolay-kozlov]], [[nikita-tokarev]], [[aleksandr-zakhvatov]], [[georgiy-lebedev]]
- Новые связи (ключевые): [[ai-native-sdlc]] ↔ [[spec-driven-development]] ↔ [[openspec]]; [[control-layers]] ↔ [[agent-skills]] ↔ [[agent-hooks]]; [[self-verification-loop]] ↔ [[independent-acceptance-layer]]; [[organizational-model-access]] ↔ [[data-perimeter]]; кейсы ↔ авторы ↔ [[meetup-dpr-2026-10-08]]. Все связи двусторонние (проверено скриптом), битых ссылок нет.
- Найдены противоречия между методикой и митапом (зафиксированы в секциях «Противоречия»):
  - является ли код чувствительными данными — [[data-perimeter]];
  - один источник истины (git) или два со ссылками (git + TestIT) — [[single-source-of-truth]];
  - достаточно ли агенту самому писать тесты на свой код — [[self-verification-loop]];
  - определение харнесса и сменяемый харнесс vs один инструмент на команду — [[agent-harness]];
  - skill как «подсказка» или «ограничитель» — [[agent-skills]];
  - можно ли сегодня честно измерить эффект агентов — [[ai-sdlc-metrics]].
- Замечания: транскрипт — автораспознавание без разметки спикеров (имена, числа и названия инструментов помечены как ненадёжные, где это важно); транскрипт обрывается на старте доклада Антона Лагутина о RAG — содержания нет, отдельная страница не создавалась.

## 2026-10-11 (развёртывание)
- Система «второго мозга» развёрнута: созданы папки `raw/` и `wiki/`, файлы `AGENTS.md`, `index.md`, `CHANGELOG.md`.
- Из raw ничего не обработано, страниц wiki пока нет, связей пока нет.
