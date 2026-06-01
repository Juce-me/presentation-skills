---
name: slide-gif-picker
description: >-
  Adds themed GIFs to selected slides in an existing deck. Use when a deck
  draft exists and the user wants to inject humor or energy with GIFs — picks
  a deck-wide theme (e.g. Matrix, Pixar, Office), lets the user choose which
  slides get a GIF, searches Giphy, and offers 3 options per slide.
---

# Slide GIF picker

Use this skill after a deck draft exists and the user wants to sprinkle in GIFs — not everywhere, only where they add energy or humor. The job here is to run a short targeted flow: **which slides → which theme → which GIF**, then embed the chosen GIFs into the deck.

**Skip when:** there is no deck draft yet (go through `brief-to-presentation-plan` → `presentation-plan-to-deck` first), or the audience/tone is wrong for GIFs (board meeting, compliance review, etc.).

**Momentum rule:** GIFs are continuous loop motion. Loop motion competes with the deck's reveal-driven forward motion (see `../_shared/slide-philosophy.md`, pillar 4). A GIF works only on slides whose forward motion is *not already* carried by step reveals — title slides, outros, transition beats, deadpan punchlines. Do not park a looping GIF on a slide that has its own reveal sequence carrying the audience forward; the loop will pull attention sideways instead of ahead.

---

## Prerequisites

- A deck draft exists in the working directory.
- `GIPHY_API_KEY` is set in the environment. Free keys: <https://developers.giphy.com/>. If missing, ask the user to export it before proceeding — do not hardcode keys, do not commit them.

---

## Workflow

### 1. Scan the deck and propose candidate slides

Read the deck file(s). Build a short list of slides that are *plausible* GIF candidates. Good candidates:

- Intro / title / "hello" slides
- Outro / thank-you / Q&A slides
- Humor beats or punchlines (slides with jokes, analogies, callbacks)
- Transition slides between sections
- "This is us / this is the problem" empathy moments

Bad candidates (skip by default):

- Dense data slides (charts, tables, metrics)
- Decision / ask / approval slides
- Architecture diagrams, technical deep-dives
- Anything the audience needs to read carefully
- **Slides that already carry forward motion through step reveals** — loop motion fights the reveal sequence

Present the candidate list to the user and let them add/remove slides. **One list, one confirmation** — do not ask per-slide at this stage.

### 2. Pick one theme for the whole deck

Ask for a single theme that will flavor every GIF search. Offer examples but accept freeform:

| Option | Description |
|--------|-------------|
| A | Matrix |
| B | Pixar cartoons |
| C | The Office |
| D | 90s movies |
| E | Custom (user-provided) |

One theme per deck keeps the visual language coherent. If the user wants multiple themes, push back once — then comply if they insist.

### 3. For each selected slide, search Giphy and offer 3 options

For each slide in the confirmed list:

1. Derive a short search keyword from the slide's title or core idea (2–4 words, concrete nouns/verbs — e.g. "celebration", "confused", "mic drop", "lightbulb moment").
2. Combine with the theme: `<theme> <keyword>` (e.g. `matrix confused`, `pixar celebration`).
3. Call Giphy search, limit 3, rating `pg-13` by default:

   ```bash
   curl -sG "https://api.giphy.com/v1/gifs/search" \
     --data-urlencode "api_key=$GIPHY_API_KEY" \
     --data-urlencode "q=<theme> <keyword>" \
     --data-urlencode "limit=3" \
     --data-urlencode "rating=pg-13"
   ```

4. Present the 3 options to the user in a compact list:

   ```
   Slide 4 — "We thought this would be easy"
   Search: pixar confused

     1. "Confused Dory" — https://media.giphy.com/.../giphy.gif
     2. "Woody thinking"  — https://media.giphy.com/.../giphy.gif
     3. "Boo puzzled"     — https://media.giphy.com/.../giphy.gif
     S. Skip this slide
     R. Retry with different keyword
   ```

   Use the `images.downsized.url` (or `images.original.url`) field from the Giphy response. Include the GIF title for quick scanning.

5. Wait for the user's pick before moving to the next slide. Accept `1 / 2 / 3 / S / R` or a freeform response.

### 4. Embed chosen GIFs into the deck

Once all selections are made, embed each GIF into its slide. Match the deck's framework:

- **HTML / Reveal.js:** `<img src="<gif-url>" alt="<title>" class="slide-gif">` — place it where the slide has breathing room (often after the headline, before the detail text).
- **Slidev:** `![<title>](<gif-url>)` inside the slide's markdown block.
- **PowerPoint / Keynote:** emit a summary table (slide → GIF URL) for the user to paste in manually.

Prefer the hosted Giphy URL over downloading — it keeps the deck lightweight and always-fresh.

Do not let the GIF become a second main thought. If adding it makes the slide text-heavy, crowded, or less clear, replace supporting prose with the GIF or skip the slide.

### 5. Confirm

Summarize: slides updated, GIFs embedded, plus any slides where the user chose `Skip` or `Retry` was exhausted. Offer to run `deck-review-update` to re-check pacing now that visuals have changed.

---

## Output

Two things:

1. **Updated deck file(s)** with GIF embeds in place.
2. **A change summary** like:

   ```markdown
   ## GIFs added

   | Slide | Search | Chosen GIF |
   |-------|--------|------------|
   | 1 — Title | matrix welcome | "Neo waking up" |
   | 4 — We thought this would be easy | pixar confused | "Confused Dory" |
   | 12 — Mic drop | office drop | "Michael Scott mic drop" |

   Skipped: slide 7 (user skipped), slide 9 (no good match after retry).
   ```

---

## Quality bar

- Never add a GIF to every slide — restraint is the point. If the user says "all of them," push back once.
- Preserve one main thought per slide. A GIF should reinforce the beat, not compete with the message or force more text.
- Respect the body-text ceiling: at most one sentence on the slide besides the GIF, the title, and labels (see `../_shared/slide-philosophy.md`).
- Keyword should describe the **emotion or beat** of the slide, not its literal content. "Confused Dory" works; "data pipeline failure" does not.
- Respect deck tone — skip the skill entirely if the audience/setting is wrong, even if the user asked for it. Surface the mismatch first.
- Never commit a secret. If `GIPHY_API_KEY` ends up in the deck file, scrub it.
- Default Giphy rating to `pg-13`. Only relax with explicit user request.

---

## Handoff

When done, suggest running **`deck-review-update`** — GIFs change pacing and visual weight, so a second pass catches slides that now feel busy or off-balance.
