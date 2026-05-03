# Contributing to mj-agent

PRs, issues, ideas — all welcome.

## What I'm specifically looking for

### 🌍 More language triggers

Currently the skill triggers in **RU + EN**. If you want to add ES / ZH / JP / DE / FR / etc — open a PR adding triggers to the `description:` block in `SKILL.md`.

### 🎨 More example batches in `examples/`

Got a good batch you've been running? Drop it as a new `examples/NN-your-theme.md`. Format:

- Title + 1-line description
- `--ar` and stylistic anchors used
- Final permutation command(s) ready to paste into Discord

### 🔧 Better prompt structure parsing

The skill's variation logic relies on the model's understanding of prompt structure. If you find the variations break consistently on a certain prompt shape — open an issue with the input + what went wrong, or PR a clarification to the workflow rules in `SKILL.md`.

### 🌉 Workflows for other AI image tools

The same `{}` permutation idea (or batch-of-10 mindset) applies to:

- Krea
- Stable Diffusion / ComfyUI  
- Imagen / Flux

If you build sister-skills (`krea-agent`, `flux-agent`, etc.) — let me know, I'll link them here.

## Style guide

- Skill instructions in `SKILL.md` should be **concise and actionable**, not theory
- Examples should be **paste-ready**, not pseudo-code
- Comments in code should explain *why*, not *what*

## How to PR

1. Fork the repo
2. Branch off `main`
3. Make your change
4. Open a PR with a clear description of what changes and why

If unsure — open an **issue first** to discuss before investing time.

## Forks I want to know about

If you fork and customize for your specific creative pipeline (NSFW art, architectural viz, character design, fashion editorial, etc.) — drop a comment in [Discussions](https://github.com/georgespelllens/mj-agent/discussions). I'll cross-link cool forks in the README.
