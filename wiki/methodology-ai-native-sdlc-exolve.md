# Методика внедрения LLM-агентов в SDLC (МТС Exolve)

> Страница-источник: черновик методики (draft, 2026-09-30), перестраивающей разработку в [[mts-exolve]] в AI-native конвейер из 5 стадий с человеческими гейтами. Главный нормативный документ базы по теме.

## Содержание

**Тип:** внутренний методический документ, статус draft, дата 2026-09-30. Вендор-нейтрален: описывает роли, контракты и контроль, а не продукт.

**Краткий пересказ.**
- SDLC превращается в конвейер Plan → Design → Build → Test → Deploy; каждая стадия оставляет версионируемый артефакт (`intent.md → spec → tasks.md → diff+tests → PR`), агент делает черновую работу, человек утверждает на гейтах.
- Узкое место смещается с написания кода на проверку и приёмку — отсюда упор на верификацию, управление контекстом и governance.
- Ядро — Spec-Driven Development на фреймворке OpenSpec с нотацией EARS + Given/When/Then; источник истины требований — репозиторий.
- Автономия расширяется по мере созревания контроля (rules → skills → hooks → evals) и по метрикам, а не по дате.
- Ключевые решения: (1) доступ к модели — организационный, не персональный; (2) порядок трансформации — рекомендован greenfield-first.
- Успех мерится в двух слоях: бизнес-метрики сверху, DORA и AI-специфичные — операционные.
- Детально проработана только Фаза 0 (фундамент); дальнейший роадмап — после выбора пути на данных.
- Открытые вопросы: выбор LLM отложен намеренно, стоимость обращений неизвестна, классификация репозиториев не сделана, перевод продукта на «требование живёт в спеке».

**Структура:** 11 частей + приложения A–H (шаблоны `intent.md`, `spec.md`, раздела «План реализации», `REVIEW.md`; таблица «данные → правило»; чек-лист Фазы 0; глоссарий; примеры контекстных файлов).

**Страницы, выросшие из источника:**
- Концепции: [[ai-native-sdlc]], [[intent-and-acceptance]], [[spec-driven-development]], [[ears-notation]], [[human-gates]], [[control-layers]], [[agent-hooks]], [[agent-skills]], [[agent-harness]], [[vendor-neutral-agent-architecture]], [[organizational-model-access]], [[data-perimeter]], [[context-management]], [[repo-context]], [[product-context]], [[single-source-of-truth]], [[reverse-spec]], [[traceability-matrix]], [[self-verification-loop]], [[independent-acceptance-layer]], [[agent-evals]], [[bidirectional-code-review]], [[branch-protection-and-codeowners]], [[cross-service-changes]], [[model-cost-routing]]
- Организация программы: [[ai-governance]], [[ai-sdlc-metrics]], [[ai-risk-register]], [[ai-platform-team]], [[phase-0-foundation]], [[ai-change-management]], [[developer-skill-erosion]]
- Сущности: [[mts-exolve]], [[openspec]], [[opencode]], [[qa-agent]]

## Связано с

- [[meetup-dpr-2026-10-08]] — митап, где практики рассказывали о том же подходе «снизу»; во многом совпадает с методикой, местами расходится (см. «Противоречия» на тематических страницах)

## Источник

- `raw/METHODOLOGY-ai-native-sdlc.md` — документ целиком
