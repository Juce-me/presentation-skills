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

Also read [references/ux-design-regressions.md](references/ux-design-regressions.md) before building or revising any deck with custom visuals, charts, or reveal-heavy storytelling. It names the failure modes that make a deck feel broken even when the HTML technically renders.

---

## Supported scenario: story-driven engineering decks

This skill must support decks that tell one engineering story as a sequence of scenes: an incident, launch, migration, performance regression, diagnosis, or fix retold with escalating proof.

Common shape:

1. hook
2. stakes
3. investigation
4. aha / diagnosis
5. fix
6. result
7. lesson
8. recap / navigation / CTA

For this scenario:

- treat animation as narrative infrastructure, not decoration
- keep one canonical model for times, numbers, thresholds, and causal claims
- make evidence visually dominant on proof slides
- specify how each reveal step changes both the story and the visible proof
- define whether any act-to-act style contrast is intentional, such as a bland "before" act and a polished "after" act

Worked example:

- [`docs/examples/proper-presentation-deck.md`](../../docs/examples/proper-presentation-deck.md) — presentation made with `presentation-skills`

---

## Inputs

Expected input:

- approved presentation plan
- slide intents or section flow
- optional branding, examples, constraints, or design system references

If the plan is weak or incomplete, stop and send it back to **`brief-to-presentation-plan`** rather than improvising a deck on shaky foundations.

---

## Workflow

1. **Lock the deck contract**
   Before building slides, define:
   - output format (`index.html`, `.pptx`, or other)
   - delivery mode (live talk, async walkthrough, export, handoff)
   - target aspect ratio and viewport
   - runtime / browser support requirements
   - build / run path (for example, open `index.html`, serve locally, or export a `.pptx`)

   Default for live HTML decks:
   - explicit aspect ratio, usually 16:9 for standard stage decks
   - explicit working size matched to that ratio, for example 1920x1080 for 16:9 or 1080x1920 for 9:16
   - latest Chrome and latest Firefox required
   - Safari recommended when the deck is likely to be presented from a Mac or opened directly by the audience

2. **Translate plan to slide units**
   Default rule: one slide, one main idea.

3. **Assign each slide a job**
   For every slide, define:
   - title
   - purpose
   - key message
   - evidence or examples
   - transition to the next slide

4. **Choose composition**
   Decide whether the slide is best expressed as:
   - title + statement
   - comparison
   - diagram
   - process flow
   - hierarchy
   - incident / case-study scene
   - before / after retelling
   - proof / diagnosis sequence
   - phased sequence
   - recap / navigation map
   - summary / takeaway
   - evidence card grid with synthesized conclusion overlay
   - **numeric result / change** → hand off slide design to **`stats-visualization`**

5. **Write a composition contract**
   Before implementing the slide, define:
   - target viewport / aspect ratio
   - dominant object
   - supporting object
   - intended canvas split (for example 60/40, full-bleed evidence, or centered hero)
   - opening visible state before any reveal
   - final visible state after all reveals
   - where late-entering labels / callouts will live
   - where the payoff lands, especially whether a 3-4 card evidence grid uses a conclusion overlay
   - safe margins or no-go zones near the slide edge
   - whether the slide uses built-in Reveal behavior, custom SVG/CSS/JS, or static composition only
   - any browser-sensitive custom animation behavior that must replay on revisit

6. **Specify reveal order**
   Reveals and animation should match the spoken story:
   - premise before punchline
   - framework before detail
   - tension before resolution
   - each new claim, takeaway, or analysis point must reveal its matching visual evidence on the same step
   - markers, highlights, labels, callouts, and comparison cues should appear when the audience needs them, not a beat later
   - lower panels, captions, and bullets must not get ahead of what the audience can already see on the main visual
   - if the deck uses navigation cues or recap tiles, they should reinforce where the audience is in the story
   - reserve space for late-entering elements so they stay readable and do not collide unless overlap is a deliberate visual move
   - when 3-4 statement, principle, or summary cards build evidence toward one takeaway, reveal the cards first, then reveal the takeaway as a centered conclusion overlay instead of placing it below the grid

7. **Design for presentation readability**
   Prefer large readable text, strong contrast, clean visual hierarchy, and room-scale composition. Avoid website-density slides.

8. **Produce implementation-ready deck content**
   The output can be:
   - slide-by-slide deck spec
   - draft slide copy
   - HTML deck changes
   - instructions for another deck tool

9. **Run human stagecraft QA before completion**
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
- Scenario role: [hook / stakes / investigation / fix / result / lesson / recap / other]
- Content:
  - [point]
  - [point]
- Format / runtime: [16:9 or 9:16 HTML Reveal deck / PPTX / other]
- Visual system: [palette, type, contrast model, intentional theme contrast if any]
- Layout: [diagram / 2-column / sequence / card grid / hero / proof scene]
- Evidence sync: [what visual proof appears with each reveal / step]
- Opening state: [what is visible before any reveal]
- Reveal / animation order:
  1. [first element]
  2. [second element]
- Build notes: [built-in fragments only / custom SVG / custom JS / replay requirement]
- QA checks: [specific readability, replay, browser, or spacing checks]
- Transition forward: [why the next slide follows]
```

---

## Evidence-to-conclusion overlay

Use this treatment when a slide contains 3-4 statement cards, principle blocks, or summary blocks that build evidence toward one synthesis.

Default rule: **replace bottom-of-slide takeaways with a final conclusion overlay.** The audience should first see the supporting statements, then get the "so what?" as a clean reveal above them.

Reveal order:

1. Reveal the underlying statement blocks in place.
2. On the next step, keep the blocks visible but dim them with a strong dark scrim.
3. Place a centered conclusion block on top of the statements.

Visual contract:

- the overlay is narrower than the full grid so it reads as distilled synthesis, not another card
- use a dark panel background with high contrast against the slide
- use a small mono title in accent yellow, such as `THE DECISION`, `WHAT THIS MEANS`, or `WHAT WE DO DIFFERENTLY`
- set the body in pure white
- add a subtle accent border and soft shadow
- keep the underlying cards recognizable but visually subordinate

Narrative fit:

- use for "What We'll Do Differently", "The Model We Actually Run", "What This Really Means", "The Decision", and similar synthesis beats
- avoid using it for unrelated card collections where there is no single conclusion
- if the slide has more than 4 evidence blocks, split the evidence or reduce it before using this treatment

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
- **The live-talk canvas must be explicit.** For HTML decks, set a presentation size that matches the planned aspect ratio rather than assuming browser defaults will behave well enough. Standard stage decks usually use 16:9; vertical decks may intentionally use 9:16.
- **Browser support is part of the build contract.** For HTML decks, latest Chrome and latest Firefox are mandatory. Safari should be checked when local Mac presentation or direct browser opening is part of the delivery path.
- **Style must be intentional.** State the deck's palette, typography, density, spacing rhythm, and whether section-to-section contrast is deliberate.
- **Before / after contrast must read as authored.** If one act is intentionally plain, ugly, or deadpan, make sure that contrast feels purposeful rather than accidentally unfinished.
- **Numeric results are never prose.** Any slide carrying a result, improvement, change, target, or comparison (latency, adoption %, cost delta, error rate, etc.) gets a visual treatment per **`stats-visualization`** — hero number, before/after, bars, gauge, delta callout, or annotated change chart — with a reason label explaining *why* the number moved. Inline phrasing like "340 ms vs 65 ms" is a bug, not a slide.
- **Reveal sync is mandatory.** For any fragment, reveal, or animation sequence, narrative and evidence land together. Do not reveal a claim, takeaway, caption, or bullet before the chart marker, highlight, labeled region, callout, or comparison cue that proves it.
- **Every reveal state must remain readable.** New labels, callouts, captions, and badges cannot collide, overlap into ambiguity, or fight for the same space unless that collision is a clearly intentional artistic move.
- **Keep the stack simple.** Default to Reveal.js 5.x from CDN, single `index.html`, no build tool, no installed dependencies (see [references/simple-reveal-deck.md](references/simple-reveal-deck.md)). Do not introduce a bundler, package manager, CSS framework, or bespoke navigation system unless a concrete requirement demands it and the default has been tried first. Every added dependency must earn its complexity.
- **Treat "aspect ratio" complaints as composition bugs first.** If the deck is already using its intended canvas, whether 16:9 or 9:16, but the slide feels cropped, tiny, footer-heavy, or strangely empty, redesign the slide composition instead of blaming global deck size.
- **Related slides must share one incident model.** If the deck contains hook, diagnosis, fix, and result slides about the same event, the thresholds, timeline, and before/after numbers must line up exactly.
- **Custom motion must replay.** Any chart, SVG, or scripted visual that animates on slide entry must also replay when revisiting the slide, not only on first render. The implementation should state how replay is triggered or remounted.
- **Firefox is mandatory QA for HTML decks.** A deck is not complete when it only looks right in Chrome.
- **Critical reveal-heavy decks need concrete QA checks.** If the deck depends on timing, replay, or annotation placement, write explicit per-slide checks instead of relying on vague manual confidence.
- **Decorative recap grids are banned.** Storyboard / journey / recap slides must contain meaningful story beats, not empty or interchangeable tiles.

---

## Human stagecraft QA

Before a deck is considered complete, run a mandatory **human stagecraft QA** pass. Judge every slide as something meant to land in a live room, not merely fit inside a viewport.

Hard rules:

- **Use the chosen canvas on purpose.** Whether the deck is 16:9 or 9:16, it should feel composed for that stage instead of looking like another document scaled into the frame.
- **No auto-fit look.** Headlines, wordmarks, and hero objects must keep visible breathing room from the slide edges. If a long token or product name starts hugging the edge, split it, resize it, or constrain it to a column.
- **No tiny idea objects.** Ban micro-demos, tiny dots, thin labels, miniature navigation markers, and other subscale elements unless the whole slide is about that object and it is enlarged enough to command attention.
- **Evidence must dominate proof slides.** On chart, diagram, or flamegraph slides, the evidence should be the biggest thing after the headline. Thin lines with tiny annotations are not enough for a live room.
- **Reveal states must sync story to proof.** If a fragment introduces a claim, takeaway, or analysis point, the matching marker, highlight, label, callout, or comparison cue must appear on that same step. Lower captions and bullets cannot outrun the main visual.
- **Payoff hierarchy must be obvious.** The main lesson, delta, or result cannot sit as a muted footer under a giant container. If it is the point, it must be visually dominant.
- **Evidence-card payoffs use overlays.** When 3-4 statement, principle, or summary cards build to one synthesis, the final reveal should dim the cards and place the conclusion above them, not tuck the takeaway below the grid.
- **No audience-facing scaffolding.** Never leave placeholder URLs, fake QR codes, TODO text, implementation reminders, or backstage instructions on visible slides.
- **No accidental reveal collisions.** As elements enter across steps, they must remain readable, keep breathing room, and avoid unintended overlap. If the layout only works before the final fragment appears, redesign or split the slide.
- **Navigation must earn its place.** Progress bars, recap grids, act labels, and "you are here" cues should clarify the story path, not add decorative noise.
- **Distinguish intentional ugly from accidental ugly.** If a deck uses parody or contrast on purpose, preserve that; do not "fix" the joke. But do not let accidental machine-looking composition leak into the polished sections.

Final review checklist:

- any text hugging the screen edge?
- any object too small to notice from the back row?
- any slide where empty container chrome is larger than the insight?
- any claim, caption, or bullet visible before its matching evidence appears?
- any 3-4 evidence card slide using a bottom takeaway instead of a conclusion overlay?
- any reveal step where late-entering elements collide or become hard to read?
- any placeholder or dev-only text still visible?
- any slide that feels auto-fitted instead of composed by a human?

If any answer is **yes**, revise the slide and run the pass again. Do not call the deck complete until every answer is **no**.

---

## Single-file HTML decks

For new decks, follow the simple default stack:

- read [references/simple-reveal-deck.md](references/simple-reveal-deck.md) — Reveal.js 5.x from CDN, one `index.html`, no build, no install
- use Reveal's built-in fragments / transitions before writing custom JS
- set an explicit deck size in the Reveal config or equivalent that matches the planned aspect ratio
- keep CSS tokens in `:root`; no stray hex colors

For existing decks with a bespoke single-file HTML framework:

- read [references/html-slide-deck.md](references/html-slide-deck.md)
- follow the owning repo's maintainer doc for tokens, components, and scripts
- keep reveal logic aligned with the story order

## Browser QA for HTML decks

For any HTML deck, verify at least:

- latest Chrome
- latest Firefox
- Safari when the plan, presenter environment, or delivery path makes it relevant

Check:

- deck is explicitly configured for the planned presentation aspect ratio
- slide proportions feel intentionally composed in both browsers
- custom charts / SVGs animate on first entry and on revisit
- fragment timing still syncs story and proof
- labels, callouts, and code blocks wrap the same way or remain equally readable
- navigation cues, recap grids, and act labels still read correctly
- the run path still matches the plan: direct-open, local server, CDN dependency, and any offline assumption

If Firefox breaks the slide, the deck is not done.

---

## Verification for reveal-heavy HTML decks

If the deck depends on custom motion, staged proof, annotation placement, or revisit replay, add a lightweight repeatable QA check for the critical slides instead of relying on memory.

Typical checks:

- fragment counts and reveal order
- minimum evidence size for charts, code panels, demos, or payoff cards
- annotation anchoring to the correct visual moment or data point
- replay behavior on revisit
- safe margins for headlines, hero objects, and wrapped titles
- placeholder or backstage text removal

This does not replace human stagecraft review. It prevents silent regressions in the parts of the deck where timing and layout are carrying meaning.

---

## Handoff

After a draft exists, use **`deck-review-update`** for the final review pass. When the deck technically works but still feels wrong, use [references/deck-hardening-prompt.md](references/deck-hardening-prompt.md) to frame the regression pass. A deck is not complete until it passes story review *and* human stagecraft QA with every checklist answer set to **no**.
