# 🪿 Axel's Goose — Emergency AI Agent Recovery

> *When your AI agent is dead and only SSH works — Goose brings it back.*

[🇷🇺 Читать на русском](README.ru.md)

[![Hermes Agent](https://img.shields.io/badge/hermes--agent-recovery-blue)](https://github.com/NousResearch/hermes-agent)
[![Goose AI](https://img.shields.io/badge/goose--ai-rescue-orange)](https://block.github.io/goose/)
[![Emergency Fix](https://img.shields.io/badge/emergency--fix-red)]()

**Two-Agent Architecture:** Goose (Block's AI agent) acts as a rescue vehicle for Hermes Agent (Nous Research). When Hermes gateway crashes, Telegram goes silent, and all you have is an SSH connection — one command restores everything.

---

## The Problem

You run [Hermes Agent](https://github.com/NousResearch/hermes-agent) 24/7 as your AI assistant. One day it stops responding:

- Telegram bot is silent
- Gateway is down
- Logs show cryptic errors
- You SSH into the server and... now what?

Manually debugging gateway state, checking ports, parsing YAML configs, restarting systemd services — all while your assistant (who normally does this) is the one that's broken.

---

## The Solution

**Axel's Goose** is a pre-configured rescue agent. It already knows:

- Where Hermes lives (`hermes-coder.service`)
- Where the logs are (`gateway.log`, `errors.log`, `agent.log`)
- How to restart it (`systemctl restart`)
- How to diagnose (port conflicts, API key issues, config errors)
- Common failure patterns and their fixes

```bash
ssh your-server
axels-goose
> fix hermes, gateway is down
```

Goose reads the logs, finds the issue, restarts the service, and verifies it's back online. **Less than 60 seconds.**

---

## How It Works

```
┌─────────────────────────────────────────────┐
│                 YOUR SERVER                  │
│                                             │
│  ┌──────────┐  crashed   ┌──────────────┐  │
│  │  Hermes  │◄──────────►│   Gateway    │  │
│  │  Agent   │            │   (dead)     │  │
│  └──────────┘            └──────────────┘  │
│       ▲                                     │
│       │ rescues                             │
│       │                                     │
│  ┌────┴─────┐                               │
│  │  Goose   │  ← you SSH in and run         │
│  │  + Qwen  │    `axels-goose`              │
│  └──────────┘                               │
│                                             │
│  Goose has:                                 │
│  • Terminal access (systemctl, tail, curl)  │
│  • Hermes knowledge (paths, configs, fixes) │
│  • Free model (Qwen 3.7 Plus / OpenRouter)  │
└─────────────────────────────────────────────┘
```

---

## Quick Start

### One-command install

```bash
curl -fsSL https://raw.githubusercontent.com/axelfreeman/axels-goose/main/install.sh | bash
```

This installs:
1. [Goose CLI](https://block.github.io/goose/) (if not present)
2. Developer extension (terminal access)
3. MCP servers (memory, computer controller, autovisualiser)
4. Qwen 3.7 Plus model (free, via OpenRouter)
5. The `axels-goose` command

### Emergency Use

```bash
axels-goose                    # interactive rescue session
axels-goose run -c "fix it"   # one-shot command
```

---

## Features

| Feature | Description |
|---------|-------------|
| 🔍 **Auto-diagnosis** | Reads Hermes logs, finds root cause |
| 🔧 **One-click fix** | Restarts services, kills stale ports, validates config |
| 🆓 **Zero cost** | Uses Qwen 3.7 Plus — free on OpenRouter |
| 🧠 **Pre-loaded context** | Goose knows Hermes paths, commands, and failure patterns |
| 🔌 **MCP-ready** | Memory, Computer Controller, Autovisualiser servers pre-configured |
| 📦 **Single binary** | Just `axels-goose` — no dependencies beyond Goose |

---

## Requirements

- Linux server running Hermes Agent (systemd)
- SSH access (root or sudo)
- OpenRouter API key (same one Hermes uses)

---

## Commands

```bash
axels-goose                              # start rescue session
axels-goose run -c "restart hermes"     # one-shot command
axels-goose run instructions.md         # run from file
axels-goose session                     # explicit session mode
```

---

## Common Scenarios

| Symptom | Fix |
|---------|-----|
| "bot doesn't respond" | `axels-goose` → "fix hermes" |
| "gateway is dead" | Goose restarts `hermes-coder.service` |
| "OpenRouter 403" | Goose checks VPN (`wg show`) |
| "port conflict" | Goose finds and kills stale process |
| "everything broken, help" | `axels-goose` → "diagnose whats wrong" |

---

## Tags / Topics

`hermes-agent` `goose-ai` `ai-agent-recovery` `emergency-fix` `devops` `ai-ops` `self-healing` `gateway-repair` `systemd` `ai-tools` `agent-rescue` `hermes-doctor` `two-agent-architecture`

---

## Related

- [Hermes Agent](https://github.com/NousResearch/hermes-agent) — The agent that grows with you
- [Goose](https://block.github.io/goose/) — On-machine AI agent by Block
- [Hermes System Doctor](https://github.com/AlekseiUL/hermes-system-doctor) — Diagnostic tool for Hermes
- [Hermeneutic](https://github.com/hermes-labs-ai/hermeneutic) — Evidence-first drift gate for AI agents

---

## License

MIT

---

*Built for Hermes Agent users who've been burned by a midnight gateway crash. When your AI assistant is the one that needs assistance — Goose has your back.*
