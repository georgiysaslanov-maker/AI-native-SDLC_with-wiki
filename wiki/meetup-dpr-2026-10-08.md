# Митап ДПР 08.10.2026 «AI в разработке»

> Страница-источник: автотранскрипт внутреннего митапа (2 ч 35 мин), где сотрудники [[mts-exolve]] делились практическим опытом агентной разработки — от pet-проекта до SDD и скиллов.

## Содержание

**Тип:** автотранскрипция (faster-whisper `medium`) без разметки спикеров; возможны ошибки в терминах и именах. Дата митапа — 2026-10-08. Ведущий — [[igor-rumyantsev]]. Аудитория — до ~168 человек.

**Доклады (по порядку):**
1. [[igor-rumyantsev]] — как меняется разработка (узкое место — намерение и приёмка) и личный опыт: сервис на базе Exolve, написанный агентом за два дня → [[intent-and-acceptance]], [[case-exolve-saas-pet-project]].
2. [[nikolay-kozlov]] — несколько кварталов агентной работы в команде: выбор стека, доступы, общий контекст в git-репозитории, формализация рутины, тесты как гейт → [[team-knowledge-repository]].
3. [[nikita-tokarev]] — ИИ-анализ нагрузочного тестирования всей платформы Exolve → [[case-ai-load-test-analysis]].
4. [[aleksandr-zakhvatov]] — Spec-Driven Development на OpenSpec, контекстное окно, IDE Orca → [[spec-driven-development]], [[openspec]], [[orca-ide]].
5. [[georgiy-lebedev]] — что такое harness и как устроены скиллы; скилл разбора прогонов автотестов → [[agent-harness]], [[agent-skills]], [[case-autotest-run-triage]].
6. Антон Лагутин — «создание своего RAG с нуля: подходы, ограничения, результаты». **Транскрипт обрывается на старте доклада — содержания нет.**

**Сквозные темы Q&A:** какие LLM используются (внешние, через [[opencode]]), что считать чувствительными данными ([[data-perimeter]]), доступ через VPN и блокировки аккаунтов ([[organizational-model-access]]), деградация навыков разработчиков ([[developer-skill-erosion]]), единый источник истины ([[single-source-of-truth]]), аудиторский след при работе MCP под личными токенами ([[ai-governance]]).

**Страницы, выросшие из источника:** [[ai-native-sdlc]], [[intent-and-acceptance]], [[spec-driven-development]], [[human-gates]], [[control-layers]], [[context-management]], [[agent-harness]], [[agent-skills]], [[agent-hooks]], [[repo-context]], [[single-source-of-truth]], [[self-verification-loop]], [[independent-acceptance-layer]], [[agent-evals]], [[bidirectional-code-review]], [[branch-protection-and-codeowners]], [[data-perimeter]], [[organizational-model-access]], [[model-cost-routing]], [[ai-governance]], [[ai-sdlc-metrics]], [[ai-risk-register]], [[ai-change-management]], [[developer-skill-erosion]], [[team-knowledge-repository]], [[case-exolve-saas-pet-project]], [[case-ai-load-test-analysis]], [[case-autotest-run-triage]], [[mts-exolve]], [[openspec]], [[opencode]], [[orca-ide]], [[qa-agent]], [[igor-rumyantsev]], [[nikolay-kozlov]], [[nikita-tokarev]], [[aleksandr-zakhvatov]], [[georgiy-lebedev]].

## Связано с

- [[methodology-ai-native-sdlc-exolve]] — нормативная методика той же организации; митап показывает практику, которая её подпитывает и местами с ней расходится

## Источник

- `raw/Митап_ДПР_08.10.26_транскрипт.md` — транскрипт целиком
