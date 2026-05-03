# 🎨 mj-agent

**English** · [Русский](./README.ru.md)

**Turn one Midjourney prompt into 10 Discord-ready variations.**
A Claude Code skill that knows how to batch-generate prompts and pack them into `{}` permutations for one-shot `/imagine` runs.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-D97757?logo=anthropic)](https://claude.com/claude-code)
[![Midjourney](https://img.shields.io/badge/Midjourney-v6%2Fv7%2Fv8.1-000?logo=midjourney)](https://midjourney.com)
[![Star on GitHub](https://img.shields.io/github/stars/georgespelllens/mj-agent?style=social)](https://github.com/georgespelllens/mj-agent)

---

## 🚀 What it does

You drop **one** Midjourney prompt:

```
A surreal pop-art portrait of a woman in cornflowers, sapphire gown, --ar 9:16 --raw --stylize 1000
```

You get **10 variations** in two formats:

**1. Raw — line per prompt** (for line-by-line automators)

```
A surreal pop-art portrait of a woman in scarlet poppies, crimson gown… --ar 9:16 --raw --stylize 1000
A surreal pop-art portrait of a woman in golden sunflowers, amber gown… --ar 9:16 --raw --stylize 1000
… 8 more
```

**2. Permutation — one `/imagine` for all 10 jobs**

```
A surreal pop-art portrait of a woman in {scarlet poppies\, crimson gown…, golden sunflowers\, amber gown…, …}, --ar 9:16 --raw --stylize 1000
```

Paste into Discord MJ, hit Yes on confirmation — 10 jobs run at once.

> ⚡ **The whole point:** stop writing prompts one at a time. Think in batches of 10 and let serendipity surface ideas your brain wouldn't compose alone.

---

## ⚙️ Install (60 seconds)

### 1. Get Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Full guide: [claude.com/claude-code](https://claude.com/claude-code)

### 2. Drop the skill in place

```bash
mkdir -p ~/.claude/skills/mj-agent
curl -o ~/.claude/skills/mj-agent/SKILL.md \
  https://raw.githubusercontent.com/georgespelllens/mj-agent/main/SKILL.md
```

### 3. Use it

```bash
claude
```

Then in any session:

```
[paste your MJ prompt]
сделай вариации
```

The skill triggers automatically. Works in any working directory — it's globally installed.

---

## 🎯 Use cases

### Generate variations of a prompt

```
A close-up of a minotaur and a fae kissing in a mystical forest, --ar 16:9 --stylize 750
сделай 10 вариаций
```

→ 10 mythical-creature pairings in different biomes (werewolf+nymph in shore cave, centaur+dryad in oak grove, …)

### Pack a list of prompts into permutations

```
[10 prompts pasted]
упакуй в пермутации
```

→ One or two `/imagine` commands ready for Discord, with proper `\,` escaping inside `{}`.

### Split too-long permutation

```
[your massive {} command Discord rejected]
разбей на части
```

→ 2-3 shorter commands that fit Discord's 2000-char limit.

### Compare model versions side-by-side

```
[your prompt]
сравни v7 и v8.1
```

→ `<prompt> --v {7, 8.1}` — same prompt, both engines, instant A/B.

See [`examples/`](./examples) for **50+ pre-built batches** you can paste into Discord right now (cinematic posters, surreal portraits, anthropomorphic city selfies, mannequin head series, and more).

---

## 🧠 Why batches > single prompts

A polished one-shot prompt gives you one result.
Ten messy variations give you **discovery**.

Snow leopard in harajuku style in Reykjavik sounds absurd — but exactly out of those weird combos come the most interesting frames. When you see 10 takes of the same idea side-by-side, you instantly know what works, where to dig deeper, and what's not yours.

That's why this skill exists. Not for speed. For finding things you wouldn't have written.

---

## 🔥 Triggers

The skill responds to these (RU + EN):

| Phrase | What happens |
|--------|--------------|
| `сделай вариации` / `make variations` | 10 variations of your prompt |
| `сделай батч` / `batch of 10` | 10-prompt themed batch |
| `упакуй в пермутации` / `pack into permutations` | Wraps your list in `{}` for Discord |
| `разбей на части` / `split` | Breaks oversized commands into chunks |
| `сравни v7 и v8.1` / `compare versions` | Multi-version A/B prompt |

---

## 🧩 Midjourney permutation limits

| Plan | Max jobs per `{}` |
|------|------------------:|
| Basic | 4 |
| Standard | 10 |
| Pro / Mega | 40 |

Discord caps message length around 2000 chars — the skill auto-splits long batches.
Permutations require **Fast mode**. Don't combine with `--repeat`.

---

## 📁 Repo structure

```
mj-agent/
├── SKILL.md           # the skill itself (drop into ~/.claude/skills/mj-agent/)
├── README.md          # you are here
├── LICENSE            # MIT
├── CONTRIBUTING.md    # how to contribute
└── examples/          # ready-to-paste batches
    ├── 01-floral-portraits.md
    ├── 02-band-posters.md
    ├── 03-mythical-pairings.md
    ├── 04-anime-girls-cities.md
    ├── 05-mannequin-heads.md
    └── 06-anthropomorphic-selfies.md
```

---

## 🛠 Built with

- [Claude Code](https://claude.com/claude-code) — Anthropic's CLI for Claude
- [Claude Code Skills](https://claude.com/claude-code) — global skills system

---

## 🤝 Contributing

Found a bug? Want a new workflow? Want to add language support?

See [CONTRIBUTING.md](./CONTRIBUTING.md). PRs welcome — especially:

- New triggers (more languages)
- Better prompt structure parsers
- More example batches
- Workflows for other AI image tools (Krea, Imagen, Flux)

---

## ⭐ Like it?

Star the repo to keep me motivated to add more workflows.
Fork it and tune it for your own creative pipeline.

---

## 👤 Author

**Lev Bakharev** — designer, MJ daily user.

- 💬 Telegram: [@aidalev](https://t.me/aidalev) — RU posts about AI design workflows
- 🐦 X / Twitter: [@lionopus](https://x.com/lionopus)
- 🐙 GitHub: [@georgespelllens](https://github.com/georgespelllens)

---

## 📜 License

MIT — do whatever, just don't blame me.
