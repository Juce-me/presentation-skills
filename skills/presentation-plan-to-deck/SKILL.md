---
name: presentation-plan-to-deck
description: >-
  Converts an approved presentation plan into a concrete presentation deck. Use
  when you already know the audience, through-line, and slide flow and now need
  to produce slide structure, layout decisions, reveal order, animation, and
  implementation-ready deck content.
---

# Presentation plan to deck

Use this skill after the presentation plan is settled. The job here is to turn the plan into a deck with accurate structure, layout, and reveal logic.

For new decks, **default to the simple stack** described in [references/simple-reveal-deck.md](references/simple-reveal-deck.md) — Reveal.js 5.x from CDN, single `index.html`, no build tool, no installed dependencies.

If the project already has a bespoke single-file HTML deck with custom reveal systems, also read [references/html-slide-deck.md](references/html-slide-deck.md) and the project maintainer documentation. Do not retrofit legacy patterns onto a new deck.

---

## Inputs

Expected input:

- approved presentation plan
- slide intents or section flow
- optional branding, examples, constraints, or design system references

If the plan is weak or incomplete, stop and send it back to **`brief-to-presentation-plan`** rather than improvising a deck on shaky foundations.

---

## Workflow

1. **Translate plan to slide units**
   Default rule: one slide, one main idea.

2. **Assign each slide a job**
   For every slide, define:
   - title
   - purpose
   - key message
   - evidence or examples
   - transition to the next slide

3. **Choose composition**
   Decide whether the slide is best expressed as:
   - title + statement
   - comparison
   - diagram
   - process flow
   - hierarchy
   - phased sequence
   - summary / takeaway
   - **numeric result / change** → hand off slide design to **`stats-visualization`**

4. **Specify reveal order**
   Reveals and animation should match the spoken story:
   - premise before punchline
   - framework before detail
   - tension before resolution

5. **Design for presentation readability**
   Prefer large readable text, strong contrast, clean visual hierarchy, and room-scale composition. Avoid website-density slides.

6. **Produce implementation-ready deck content**
   The output can be:
   - slide-by-slide deck spec
   - draft slide copy
   - HTML deck changes
   - instructions for another deck tool

7. **Run human stagecraft QA before completion**
   This is a blocking pass, not optional polish.
   - inspect every slide as something meant for a live room, not just a browser tab
   - apply the hard rules below
   - if any checklist item fails, revise the slide and re-check before calling the deck complete

---

## Slide spec template

Use this format when building or handing off the deck:

```markdown
## Slide N — [Title]

- Purpose: [what this slide must achieve]
- Audience takeaway: [what they should leave with]
- Content:
  - [point]
  - [point]
- Layout: [diagram / 2-column / sequence / card grid / hero]
- Reveal / animation order:
  1. [first element]
  2. [second element]
- Transition forward: [why the next slide follows]
```

---

## Presentation description

When the user asks "what is this presentation about?" or "write a description of this presentation", generate a short friendly text — not a slide, not a list.

The output format:

**Summary:** [title of the presentation — one short phrase]
**Description:** [2–4 sentences in plain, warm language covering what the audience will get out of it]

Write it as if it were the body of a calendar invite or an email to attendees. The tone should feel like an invitation: give enough context to make someone want to show up, without summarising every point. No bullet lists, no jargon, no agenda structure.

Example output:

> **Summary:** Onboarding flow review
>
> **Description:** We'll walk through how the current onboarding experience works, what we've changed recently based on user feedback, and where we're taking it next. Whether you're new to the product or just want a refresher, this session will give you the full picture.

---

## Accuracy rules

- Every slide must trace back to the approved plan.
- Layout and animation must reinforce meaning, not decorate it.
- If a slide feels crowded, split it instead of shrinking everything.
- The opening must establish context quickly.
- The ending must land on a takeaway, action, or decision, not just stop.
- **Numeric results are never prose.** Any slide carrying a result, improvement, change, target, or comparison (latency, adoption %, cost delta, error rate, etc.) gets a visual treatment per **`stats-visualization`** — hero number, before/after, bars, gauge, delta callout, or annotated change chart — with a reason label explaining *why* the number moved. Inline phrasing like "340 ms vs 65 ms" is a bug, not a slide.
- **Keep the stack simple.** Default to Reveal.js 5.x from CDN, single `index.html`, no build tool, no installed dependencies (see [references/simple-reveal-deck.md](references/simple-reveal-deck.md)). Do not introduce a bundler, package manager, CSS framework, or bespoke navigation system unless a concrete requirement demands it and the default has been tried first. Every added dependency must earn its complexity.

---

## Human stagecraft QA

Before a deck is considered complete, run a mandatory **human stagecraft QA** pass. Judge every slide as something meant to land in a live room, not merely fit inside a viewport.

Hard rules:

- **No auto-fit look.** Headlines, wordmarks, and hero objects must keep visible breathing room from the slide edges. If a long token or product name starts hugging the edge, split it, resize it, or constrain it to a column.
- **No tiny idea objects.** Ban micro-demos, tiny dots, thin labels, miniature navigation markers, and other subscale elements unless the whole slide is about that object and it is enlarged enough to command attention.
- **Evidence must dominate proof slides.** On chart, diagram, or flamegraph slides, the evidence should be the biggest thing after the headline. Thin lines with tiny annotations are not enough for a live room.
- **Payoff hierarchy must be obvious.** The main lesson, delta, or result cannot sit as a muted footer under a giant container. If it is the point, it must be visually dominant.
- **No audience-facing scaffolding.** Never leave placeholder URLs, fake QR codes, TODO text, implementation reminders, or backstage instructions on visible slides.
- **Distinguish intentional ugly from accidental ugly.** If a deck uses parody or contrast on purpose, preserve that; do not "fix" the joke. But do not let accidental machine-looking composition leak into the polished sections.

Final review checklist:

- any text hugging the screen edge?
- any object too small to notice from the back row?
- any slide where empty container chrome is larger than the insight?
- any placeholder or dev-only text still visible?
- any slide that feels auto-fitted instead of composed by a human?

If any answer is **yes**, revise the slide and run the pass again. Do not call the deck complete until every answer is **no**.

---

## Single-file HTML decks

For new decks, follow the simple default stack:

- read [references/simple-reveal-deck.md](references/simple-reveal-deck.md) — Reveal.js 5.x from CDN, one `index.html`, no build, no install
- use Reveal's built-in fragments / transitions before writing custom JS
- keep CSS tokens in `:root`; no stray hex colors

For existing decks with a bespoke single-file HTML framework:

- read [references/html-slide-deck.md](references/html-slide-deck.md)
- follow the owning repo's maintainer doc for tokens, components, and scripts
- keep reveal logic aligned with the story order

---

## Handoff

After a draft exists, use **`deck-review-update`** for the final review pass. A deck is not complete until it passes story review *and* human stagecraft QA with every checklist answer set to **no**.
