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
- Синхронизация: работа по разбору raw лежала на ветке `claude/pensive-archimedes-9y6kf1`, не влитой в ветку по умолчанию; следующая сессия стартовала без неё и ошибочно сочла wiki пустой. Ветка влита. Добавлены: §0 в `AGENTS.md` (проверка веток в начале сессии, влитие в ветку по умолчанию в конце) и SessionStart-хук `.claude/hooks/session-start.sh` (предупреждает о неучтённых ветках и о рассинхроне счётчика в `index.md`).
- Веб-ресёрч по запросу владельца: альтернативы закрытым фронтир-моделям для Фазы 0 (Россия, Китай, своё железо).
- Создана страница-источник: [[research-llm-alternatives-2026-10]]
- Созданы страницы-темы: [[llm-provider-options-russia]], [[open-weight-coding-models]], [[self-hosted-llm-sizing]]; страница-сущность: [[mws-gpt-model-hub]]; в индексе — новая категория «Модели и провайдеры LLM»
- Обновлены страницы (связи): [[organizational-model-access]], [[phase-0-foundation]], [[vendor-neutral-agent-architecture]], [[data-perimeter]], [[ai-risk-register]], [[agent-evals]], [[model-cost-routing]], [[opencode]], [[mts-exolve]], [[case-ai-load-test-analysis]], [[reverse-spec]], [[ai-platform-team]]
- Новые связи: [[llm-provider-options-russia]] ↔ [[organizational-model-access]] / [[mws-gpt-model-hub]] / [[data-perimeter]] / [[ai-risk-register]]; [[self-hosted-llm-sizing]] ↔ [[model-cost-routing]] / [[ai-platform-team]]; [[mws-gpt-model-hub]] ↔ [[mts-exolve]] / [[opencode]] / [[case-ai-load-test-analysis]]
- Найдены противоречия между источниками ресёрча:
  - тариф MWS на GLM-5.3 (70,76/283 ₽ против 178/747 ₽) и число моделей в хабе — [[mws-gpt-model-hub]], [[self-hosted-llm-sizing]];
  - параметры и лицензия GLM-5.3, размер MiniMax M3, контекст и Verified у DeepSeek V4 Flash, SWE-bench у закрытых моделей — [[open-weight-coding-models]];
  - насколько открытые модели отстают от закрытого фронтира — [[llm-provider-options-russia]];
  - расход на разработчика в день у закрытых агентов — [[self-hosted-llm-sizing]].
- Замечание: первичные страницы недоступны (WebFetch заблокирован в среде), цифры из поисковой выдачи и вторичных обзоров; расчёты нагрузки и стоимости помечены как оценки агента.
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
- Система «второго мозга» развёрнута: созданы папки `raw/` и `wiki/`, файлы `AGENTS.md`, `index.md`, `CHANGELOG.md`.
