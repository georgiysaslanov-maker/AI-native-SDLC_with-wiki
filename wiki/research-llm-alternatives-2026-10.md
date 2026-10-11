# Ресёрч: альтернативы фронтир-моделям для Фазы 0 (октябрь 2026)

> Веб-ресёрч агента от 2026-10-11 по запросу владельца: что есть в России и Китае вместо закрытых фронтир-моделей для организационного доступа в Фазе 0 и сколько GPU нужно, чтобы развернуть модель у себя на ~150 человек.

## Содержание

### Постановка
Для Фазы 0 ([[phase-0-foundation]]) ключевое — организационный (Enterprise) доступ к модели по API ([[organizational-model-access]]). Доступ к закрытым фронтирам из РФ проблемный и рискованный (R-14). Вопросы владельца:
1. Есть ли в России что-то сопоставимое с фронтирами и подходящее под наши задачи?
2. Есть ли приличные китайские модели, доступные по API?
3. Можно ли развернуть сопоставимую модель у себя: какие модели и сколько GPU нужно на ~15 команд / ~150 человек?

### Выводы
- Российский вариант на деле — **китайские открытые модели, развёрнутые в российском облаке**. Лучший кандидат — свой, внутригрупповой [[mws-gpt-model-hub]].
- Собственные российские модели (GigaChat 3.5 Ultra) отстают от китайских открытых примерно на поколение.
- Прямые китайские API как основа не рекомендуются: мешают оплата и юрисдикция данных.
- Своё железо реально, но для модели GLM-класса это 3 узла 8×H200 на 150 человек. Подробности — [[self-hosted-llm-sizing]].
- Разбор вариантов — [[llm-provider-options-russia]], сравнение моделей — [[open-weight-coding-models]].

### Как проводился и ограничения
- Использовался только веб-поиск. Загрузка первичных страниц (WebFetch) в среде агента была заблокирована, поэтому цифры взяты из поисковой выдачи и вторичных обзоров, не проверены по карточкам моделей.
- Бенчмарки в основном заявлены вендорами. Значения зависят от харнесса: по одному из источников, разброс достигает 10–20 п.п.
- Многие источники противоречат друг другу (параметры, лицензии, цены) — см. «Противоречия» на страницах-темах.
- Расчёты нагрузки и стоимости — оценки агента на явных допущениях, не данные.

### Использованные источники (URL)
- MWS: habr.com/ru/companies/mws/news/1078530, itweek.ru (GLM-5.3 в MWS Cloud, 2026-09-04), mws.ru/docs/cloud-platform/_includes/pricing/gpt.html, servernews.ru/1138807, ixbt.pro (Kimi в MWS, 2026-03-24), comnews.ru/content/246888 (переход компаний РФ на китайские LLM)
- Cloud.ru и Yandex: cloud.ru/products/evolution-ai-factory/catalog-foundation-models, pawetta.com/servisy/yandex-ai-studio, habr.com/ru/articles/1088108
- Сбер и MTS AI: huggingface.co/ai-sage/GigaChat3.5-432B-A28B-Reasoning, docs.sglang.io (GigaChat 3.5), github.com/ai-forever/harness-bench-fast/pull/44, dev.to (критика бенчмарков GigaChat 3.5), ai.cnews.ru (GigaCode CLI, 2026-06-05), cnews.ru (GigaCode Desktop, 2026-07-15), mts.ai/product/kodify
- Китайские модели: morphllm.com/glm-5-2, datanorth.ai (GLM-5.3), huggingface.co/deepseek-ai/DeepSeek-V4-Flash, morphllm.com/deepseek-v4, github.com/MoonshotAI/Kimi-K3, morphllm.com/kimi-k3, morphllm.com/minimax-m3, qwen.ai/blog?id=qwen3.6-27b, huggingface.co/Qwen/Qwen3.6-35B-A3B, morphllm.com/swe-bench-pro, digitalapplied.com (SWE-bench vs scaffolding), thundercompute.com/blog/best-open-source-llms
- Прямой доступ из РФ: vc.ru/ai/3068138-oplata-deepseek-api-iz-rossii, vc.ru/services/2990079
- Закон об ИИ: kommersant.ru/doc/8761518, alrf.ru (закон принят в окончательном чтении), habr.com/ru/articles/1050642
- Железо и инференс: helix.ml/blog/glm53-on-8x-h200, recipes.vllm.ai/zai-org/GLM-5.3, gist.github.com/BenHamm (GLM-5 8×B200 vs 8×H200), phala.com (GLM-5.2 на 8×H200), millstoneai.com (V4 Flash на 2×RTX PRO 6000), codersera.com (V4 Flash на 4×RTX PRO 6000), servermall.ru и serverflow.ru (цены серверов в РФ)
- Расход токенов: morphllm.com/ai-coding-costs, vantage.sh/blog/agentic-coding-costs, infercom.ai/blog/agentic-coding-speed

## Связано с

- [[llm-provider-options-russia]] — главный вывод ресёрча
- [[open-weight-coding-models]] — кандидаты-модели
- [[self-hosted-llm-sizing]] — расчёт GPU и стоимости
- [[mws-gpt-model-hub]] — рекомендованный провайдер

## Источник

- Веб-поиск агента 2026-10-11 (URL выше)
- [[methodology-ai-native-sdlc-exolve]] / `raw/METHODOLOGY-ai-native-sdlc.md` — §0.2, §0.3, §2.2, §2.5, §5.3, ч. 9, ч. 11, R-14 (постановка)
- [[meetup-dpr-2026-10-08]] / `raw/Митап_ДПР_08.10.26_транскрипт.md` — текущая практика использования моделей (постановка)
