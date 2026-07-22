# 🪿 Axel's Goose — Экстренное восстановление AI-агента

> *Когда твой AI-агент мёртв и работает только SSH — Goose возвращает его к жизни.*

[![Hermes Agent](https://img.shields.io/badge/hermes--agent-recovery-blue)](https://github.com/NousResearch/hermes-agent)
[![Goose AI](https://img.shields.io/badge/goose--ai-rescue-orange)](https://block.github.io/goose/)
[![Emergency Fix](https://img.shields.io/badge/emergency--fix-red)]()

**Двухагентная архитектура:** Goose (AI-агент от Block) — спасательная машина для Hermes Agent (Nous Research). Когда gateway падает, Telegram молчит, и у вас есть только SSH — одна команда восстанавливает всё.

---

## Проблема

Вы держите [Hermes Agent](https://github.com/NousResearch/hermes-agent) 24/7 как AI-ассистента. В один день он перестаёт отвечать:

- Telegram-бот молчит
- Gateway упал
- В логах непонятные ошибки
- Вы заходите по SSH и... что дальше?

Ручная отладка: проверка портов, парсинг YAML-конфигов, перезапуск systemd-сервисов. И всё это в момент когда ваш ассистент (который обычно это делает) — и есть тот кто сломался.

---

## Решение

**Axel's Goose** — предварительно настроенный агент-спасатель. Он уже знает:

- Где живёт Hermes (`hermes-coder.service`)
- Где логи (`gateway.log`, `errors.log`, `agent.log`)
- Как перезапустить (`systemctl restart`)
- Как диагностировать (конфликты портов, проблемы с API-ключами, ошибки конфигурации)
- Типовые паттерны отказов и их исправления

```bash
ssh your-server
axels-goose
> почини hermes, gateway упал
```

Goose читает логи, находит проблему, перезапускает сервис и проверяет что всё работает. **Меньше 60 секунд.**

---

## Как это работает

```
┌─────────────────────────────────────────────┐
│                  ВАШ СЕРВЕР                  │
│                                             │
│  ┌──────────┐   упал     ┌──────────────┐  │
│  │  Hermes  │◄──────────►│   Gateway    │  │
│  │  Agent   │            │   (мёртв)    │  │
│  └──────────┘            └──────────────┘  │
│       ▲                                     │
│       │ спасает                             │
│       │                                     │
│  ┌────┴─────┐                               │
│  │  Goose   │  ← заходишь по SSH и         │
│  │  + Qwen  │    запускаешь `axels-goose`  │
│  └──────────┘                               │
│                                             │
│  У Goose есть:                              │
│  • Доступ к терминалу (systemctl, tail)    │
│  • Знание Hermes (пути, конфиги, фиксы)    │
│  • Модель: Qwen 3.7 Plus)       │
└─────────────────────────────────────────────┘
```

---

## Быстрый старт

### Установка одной командой

```bash
curl -fsSL https://raw.githubusercontent.com/axelfreeman/axels-goose/main/install.sh | bash
```

Устанавливает:
1. [Goose CLI](https://block.github.io/goose/) (если не установлен)
2. Developer extension (доступ к терминалу)
3. MCP-серверы (memory, computer controller, autovisualiser)
4. Qwen 3.7 Plus (через OpenRouter)
5. Команду `axels-goose`

### Экстренное использование

```bash
axels-goose                    # интерактивная сессия спасения
axels-goose run -c "почини"   # одноразовая команда
```

---

## Возможности

| Возможность | Описание |
|-------------|----------|
| 🔍 **Авто-диагностика** | Читает логи Hermes, находит причину |
| 🔧 **Починка в один клик** | Перезапуск сервисов, убийство зависших портов, валидация конфига |
| 🆓 **Нулевая стоимость** | Qwen 3.7 Plus — через OpenRouter |
| 🧠 **Предзагруженный контекст** | Goose знает пути, команды и типовые ошибки Hermes |
| 🔌 **MCP-ready** | Memory, Computer Controller, Autovisualiser — предварительно настроены |
| 📦 **Один бинарник** | Только `axels-goose` — никаких зависимостей кроме Goose |

---

## Требования

- Linux-сервер с Hermes Agent (systemd)
- SSH-доступ (root или sudo)
- Ключ OpenRouter API (тот же что использует Hermes)

---

## Команды

```bash
axels-goose                                # запустить сессию спасения
axels-goose run -c "перезапусти hermes"   # одноразовая команда
axels-goose run instructions.md           # запуск из файла
axels-goose session                       # явный режим сессии
```

---

## Типовые сценарии

| Симптом | Исправление |
|---------|-------------|
| «бот не отвечает» | `axels-goose` → «почини hermes» |
| «gateway мёртв» | Goose перезапускает `hermes-coder.service` |
| «OpenRouter 403» | Goose проверяет VPN (`wg show`) |
| «конфликт портов» | Goose находит и убивает зависший процесс |
| «всё сломано, помоги» | `axels-goose` → «продиагностируй что не так» |

---

## Связанные проекты

- [Hermes Agent](https://github.com/NousResearch/hermes-agent) — Агент который растёт вместе с тобой
- [Goose](https://block.github.io/goose/) — AI-агент на твоей машине от Block
- [Hermes System Doctor](https://github.com/AlekseiUL/hermes-system-doctor) — Инструмент диагностики Hermes
- [Hermeneutic](https://github.com/hermes-labs-ai/hermeneutic) — Evidence-first drift gate для AI-агентов

---

## Лицензия

MIT

---

*Создано для пользователей Hermes Agent которых подвел ночной сбой gateway. Когда твой AI-ассистент — тот кому нужна помощь, Goose прикроет спину.*
