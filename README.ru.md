# 🎨 mj-agent

[English](./README.md) · **Русский**

**Превращает один промпт для Midjourney в 10 готовых вариаций для Discord.**
Skill для Claude Code, который умеет в батчевую генерацию промптов и упаковывает их в `{}`-пермутации для запуска через одну команду `/imagine`.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-D97757?logo=anthropic)](https://claude.com/claude-code)
[![Midjourney](https://img.shields.io/badge/Midjourney-v6%2Fv7%2Fv8.1-000?logo=midjourney)](https://midjourney.com)
[![Star on GitHub](https://img.shields.io/github/stars/georgespelllens/mj-agent?style=social)](https://github.com/georgespelllens/mj-agent)

---

## 🚀 Что делает

Кидаешь Claude **один** промпт:

```
A surreal pop-art portrait of a woman in cornflowers, sapphire gown, --ar 9:16 --raw --stylize 1000
```

Получаешь **10 вариаций** в двух форматах:

**1. Raw — построчно** (для построчной автоматизации)

```
A surreal pop-art portrait of a woman in scarlet poppies, crimson gown… --ar 9:16 --raw --stylize 1000
A surreal pop-art portrait of a woman in golden sunflowers, amber gown… --ar 9:16 --raw --stylize 1000
… ещё 8
```

**2. Permutation — одна `/imagine` для всех 10 заданий**

```
A surreal pop-art portrait of a woman in {scarlet poppies\, crimson gown…, golden sunflowers\, amber gown…, …}, --ar 9:16 --raw --stylize 1000
```

Вставляешь в Discord MJ, жмёшь Yes на подтверждении — 10 заданий запускаются разом.

> ⚡ **Главная идея:** перестать писать промпты по одному. Думать партиями по 10 — и ловить случайные находки, которые мозг сам бы не сложил.

---

## ⚙️ Установка (60 секунд)

### 1. Поставь Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Полный гайд: [claude.com/claude-code](https://claude.com/claude-code)

### 2. Положи скилл на место

```bash
mkdir -p ~/.claude/skills/mj-agent
curl -o ~/.claude/skills/mj-agent/SKILL.md \
  https://raw.githubusercontent.com/georgespelllens/mj-agent/main/SKILL.md
```

### 3. Используй

```bash
claude
```

В любой сессии:

```
[вставь свой MJ-промпт]
сделай вариации
```

Скилл срабатывает автоматически. Работает в любой рабочей папке — он установлен глобально.

---

## 🎯 Сценарии использования

### Сделать 10 вариаций одного промпта

```
A close-up of a minotaur and a fae kissing in a mystical forest, --ar 16:9 --stylize 750
сделай 10 вариаций
```

→ 10 пар мифических существ в разных биомах (оборотень + нимфа в пещере, кентавр + дриада в дубовой роще, …)

### Упаковать готовый список в пермутации

```
[10 промптов списком]
упакуй в пермутации
```

→ Одна-две команды `/imagine` готовые для Discord, с правильным экранированием `\,` внутри `{}`.

### Разбить слишком длинную пермутацию

```
[твоя длинная команда с {}]
слишком длинная, разбей на части
```

→ 2-3 короткие команды, которые влезают в лимит Discord 2000 символов.

### Сравнить версии Midjourney

```
[твой промпт]
сравни v7 и v8.1
```

→ `<prompt> --v {7, 8.1}` — тот же промпт, обе модели, мгновенный А/Б тест.

В папке [`examples/`](./examples) лежит **6 готовых батчей**, которые можно вставить в Discord прямо сейчас (cinematic постеры, surreal портреты, антропоморфные селфи в городах, mannequin-серии и больше).

---

## 🧠 Почему батчи > одиночных промптов

Один вылизанный промпт даёт один результат.
Десять кривых вариаций дают **открытие**.

Снежный барс в харадзюку-стайле в Рейкьявике звучит как бред — но именно из таких бредов и вылетают самые интересные кадры. Когда видишь 10 вариаций одной идеи рядом, мгновенно понимаешь что работает, куда стоит копать дальше, а что вообще не твоё.

Поэтому этот скилл и существует. Не ради скорости. Ради того чтобы находить вещи, которые ты сам бы не написал.

---

## 🔥 Триггеры

Скилл реагирует на эти фразы (RU + EN):

| Фраза | Что происходит |
|-------|----------------|
| `сделай вариации` / `make variations` | 10 вариаций твоего промпта |
| `сделай батч` / `batch of 10` | Тематический батч из 10 промптов |
| `упакуй в пермутации` / `pack into permutations` | Оборачивает твой список в `{}` для Discord |
| `разбей на части` / `split` | Режет слишком большие команды на куски |
| `сравни v7 и v8.1` / `compare versions` | Multi-version A/B промпт |

---

## 🧩 Лимиты Midjourney permutations

| Тариф | Макс. jobs за `{}` |
|-------|-------------------:|
| Basic | 4 |
| Standard | 10 |
| Pro / Mega | 40 |

Discord ограничивает длину сообщения примерно 2000 символов — скилл сам разбивает длинные батчи.
Permutations работают **только в Fast mode**. Не работают вместе с `--repeat`.

---

## 📁 Структура репозитория

```
mj-agent/
├── SKILL.md           # сам скилл (положи в ~/.claude/skills/mj-agent/)
├── README.md          # English version
├── README.ru.md       # ты здесь
├── LICENSE            # MIT
├── CONTRIBUTING.md    # как контрибутить
└── examples/          # готовые к копированию батчи
    ├── 01-floral-portraits.md
    ├── 02-band-posters.md
    ├── 03-mythical-pairings.md
    ├── 04-anime-girls-aesthetics.md
    ├── 05-mannequin-heads.md
    └── 06-anthropomorphic-selfies.md
```

---

## 🛠 Собрано на

- [Claude Code](https://claude.com/claude-code) — CLI Anthropic для Claude
- [Claude Code Skills](https://claude.com/claude-code) — система глобальных скиллов

---

## 🤝 Contributing

Нашёл баг? Хочешь новый workflow? Хочешь добавить язык?

Смотри [CONTRIBUTING.md](./CONTRIBUTING.md). PR'ы приветствуются — особенно:

- Новые триггеры (другие языки)
- Лучший парсер структуры промптов
- Больше примеров батчей
- Workflows для других AI-инструментов (Krea, Imagen, Flux)

---

## ⭐ Понравилось?

Звезда репе мотивирует добавлять новые workflows.
Форкни и подкрути под свой творческий пайплайн.

---

## 👤 Автор

**Лев Бахарев** — дизайнер, юзаю MJ ежедневно.

- 💬 Telegram: [@aidalev](https://t.me/aidalev) — посты про AI design workflows на русском
- 🐦 X / Twitter: [@lionopus](https://x.com/lionopus)
- 🐙 GitHub: [@georgespelllens](https://github.com/georgespelllens)

---

## 📜 Лицензия

MIT — делай что хочешь, только меня не вини.
