---
name: mj-agent
description: Midjourney prompt builder. Use when user asks to generate variations of an MJ prompt, build themed batches of 10 prompts, pack lists into Discord-ready permutation `{}` commands, split too-long permutations, or compare model versions side-by-side. Triggers in Russian and English. EN triggers - "make variations", "batch of 10", "midjourney prompts", "pack into permutations", "split this", "compare versions". RU triggers - "сделай вариации", "сделай батч", "промпты для midjourney", "промпты для миджорни", "разбей на части", "пермутации", "MJ-промпты", "упакуй в пермутации", "сравни v7 и v8.1".
---

# MJ-agent — Midjourney prompt builder

## Context

A skill-helper for designers and AI artists who work with Midjourney through Discord and want to:
1. Quickly generate 10+ variations from a single prompt
2. Pack batches of prompts into `{}`-permutations for one-shot `/imagine` runs
3. Split overlong permutations that don't fit Discord's character limit

## Language behavior

- **Detect the user's input language and respond in that language** (Russian input → Russian response, English input → English response)
- **The MJ prompts themselves should always be in English** (Midjourney's training is English-dominant, English prompts produce better results regardless of user's chat language)
- The skill triggers on phrases in either language — see `description:` above

## Workflow 1: Generate Variations

**Trigger:** user drops a full prompt + asks for "make variations" / "сделай 10 вариаций" / "batch from this".

**Steps:**
1. Parse the prompt into: `core` (subject + idea), `details` (clothing, pose, lighting, background), `suffix` (--ar, --v, --profile, --stylize, --raw)
2. Preserve **structure and suffix exactly** as in the original
3. By default vary along: **environment / color palette / subject archetype / pose / lighting / artist references**. If user specified an axis to vary — vary only that.
4. Generate **10 variations** matching the original's length and stylistic density
5. Output in **two formats** in a single response:
   - **RAW:** 10 lines in one code block, one full prompt with suffix per line (for line-by-line automators)
   - **PERMUTATION:** one or more `/imagine` commands with `{}`-permutations. Escape commas inside variants with `\,`. Choose batch size by length (see Workflow 3 sizing rules).

**Don't ask** what to vary if the user didn't specify — just pick a reasonable axis.

## Workflow 2: Themed Batch

**Trigger:** user names a theme/direction ("make a batch of women in boudoir aesthetic", "what about architecture") without giving a specific prompt.

**Steps:**
1. Generate **5 batches × 10 permutations** in `{a, b, c, d, e} × {x, y}` format, or 5 groups of 10 raw lines.
2. Use the user's profile/parameters if they were specified earlier in the session.

## Workflow 3: Pack into Permutation Commands

**Trigger:** user drops a list of ready prompts and asks "pack into permutations" / "упакуй в пермутации" / "make it work via `{}`".

**Steps:**
1. Group prompts by **shared MJ suffix** (matching `--ar`, `--v`, `--profile`, `--stylize`).
2. Inside each group, escape all commas in the text with `\,`
3. Join with `, ` outside: `{prompt1\, with\, commas, prompt2\, also\, with\, commas} --suffix`
4. Respect **batch size by length:**
   - **Heavy cinematic prompts (>100 words)** — 2 per command
   - **Medium prompts (50-100 words)** — 4-5 per command
   - **Short prompts (<50 words)** — up to 10 per command
   - Discord message limit is ~2000 characters, escaping with `\,` inflates the text
5. Whenever possible use the **shared prefix/suffix trick**: if all prompts have an identical text segment (e.g. style soup `art by X, Y, Z`), move it OUTSIDE `{}` — this dramatically shortens the command and lets you fit more jobs per `/imagine`.

## Workflow 4: Split Too-Long Permutation

**Trigger:** user shares their permutation command and says "too long" / "слишком длинная" / "split this".

**Steps:**
1. Parse `{a, b, c, d, e}` back into an array of prompts
2. Split in half (or into 3-4 chunks) thematically — group close concepts together
3. Apply the same shared suffix to each chunk
4. Return as multiple `{}` commands

## Workflow 5: Version A/B Compare

**Trigger:** "compare v7 and v8.1" / "сравни v7 и v8.1" / "model A/B test".

**Action:** wrap `--v` in a permutation: `<prompt> --v {7, 8.1}` or `<prompt> --v {6.1, 7, 8.1}`. This is a model-agnostic feature of MJ permutations.

---

## Rules

- **Don't ask confirmation questions** — just do the work
- **Don't echo the user's original prompt back** if they just shared it — they already have it
- **Preserve the suffix exactly** — don't swap `--v` / `--profile` / `--stylize` without an explicit request
- **Permutation limits in Discord:** Basic 4 jobs / Standard 10 / Pro/Mega 40 — but this counts **jobs**, not characters. Discord's per-message length limit (~2000 chars) is a separate constraint.
- **`"quoted text"`** — v8.1 syntax for legible text inside scenes. Use when typography matters (signage, posters, packaging).
- **Escape commas inside `{}`-permutations with `\,`** — critical, otherwise MJ interprets them as variant separators.
- **Bilingual fluency** — respond in user's input language, but always write MJ prompts in English.

## Example invocations

### English user

```
User: "make 10 variations of this:
A portrait of a woman in red dress, golden hour, --ar 4:5"

Response:
1. RAW — 10 variations as separate lines with the same suffix
2. PERMUTATION — one or two {} commands for Discord
```

### Russian user

```
User: "сделай вариации этого промпта:
A portrait of a woman in red dress, golden hour, --ar 4:5"

Response (in Russian, but MJ prompts in English):
1. RAW — 10 строк с тем же суффиксом
2. PERMUTATION — одна-две {} команды для Discord
```

Each variation changes one or more dimensions (dress color, time of day, light type, artist style, location, model archetype) while preserving the original's structure and suffix.
