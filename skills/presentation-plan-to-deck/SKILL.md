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

**Canonical slide rules:** load [`../_shared/slide-philosophy.md`](../_shared/slide-philosophy.md) before building. Every slide must satisfy all four pillars: one thought (one plain sentence, no "and"), minimum text (≤1 sentence besides graphics/labels/titles), visual-first, forward motion (default to step reveals; 10–35 s pace; named transition; reveal sync; replay on revisit). A resulting thought, lesson, standard, decision, pattern, principle, or "so what" must either be its own slide or land as a dominant final payoff layer.

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
   Default rule: one slide, one main thought.
   The thought should fit in one plain sentence and point to a simple implication, answer, decision, or solution. If a slide needs two thoughts, split it.

3. **Assign each slide a job**
   For every slide, define:
   - title
   - purpose
   - single main thought
   - key message
   - primary visual evidence or example
   - simple implication / solution the slide should make obvious
   - transition to the next slide

4. **Choose composition**
   Decide whether the slide is best expressed as:
   - title + statement
   - comparison
   - diagram
   - graph / chart
   - screenshot / product image
   - photo / picture
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
   - where the resulting thought / final payoff layer lands; if it is the slide's synthesis, make it a large hero statement or top-layer conclusion overlay, not a footer
   - whether a 3-4 card evidence grid uses a conclusion overlay
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
   - if a slide builds to a resulting thought, reveal that thought last as a dominant hero / overlay above the supporting evidence
   - when 3-4 statement, principle, or summary cards build evidence toward one takeaway, reveal the cards first, then reveal the takeaway as a centered conclusion overlay instead of placing it below the grid

7. **Design for presentation readability**
   Large readable text, strong contrast, clean visual hierarchy, room-scale composition. The four pillars in [`../_shared/slide-philosophy.md`](../_shared/slide-philosophy.md) are the bar — especially the one-sentence text ceiling and the default-to-reveals rule. No website-density slides, no bullet-heavy slides.

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
- Main thought: [one plain sentence; split the slide if this needs an "and"]
- Body text budget: [≤1 sentence besides graphics, labels, and titles]
- Simple implication / solution: [what the thought makes obvious]
- Scenario role: [hook / stakes / investigation / fix / result / lesson / recap / other]
- Content:
  - [short label or claim]
- Primary visual: [graph / picture / diagram / screenshot / demo / spatial comparison]
- Format / runtime: [16:9 or 9:16 HTML Reveal deck / PPTX / other]
- Visual system: [palette, type, contrast model, intentional theme contrast if any]
- Layout: [diagram / 2-column / sequence / card grid / hero / proof scene]
- Resulting thought / payoff treatment: [none / own slide / hero statement / conclusion overlay; never a footer if it is the point]
- Evidence sync: [what visual proof appears with each reveal / step]
- Opening state: [what is visible before any reveal]
- Reveal / animation order:
  1. [first element]
  2. [second element]
- Build notes: [built-in fragments only / custom SVG / custom JS / replay requirement]
- QA checks: [specific readability, replay, browser, or spacing checks]
- Transition forward: [what the slide hints at or sets up; why the next slide naturally follows]
- Estimated time on screen: [target 10–35 s; if longer, split]
```

---

## Evidence-to-conclusion overlay

When a slide has 3–4 statement / principle / summary cards building to one synthesis, use the canonical treatment in [`../_shared/evidence-to-conclusion-overlay.md`](../_shared/evidence-to-conclusion-overlay.md). Replace any bottom-of-slide takeaway with the overlay reveal (cards → scrim + centered conclusion panel).

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

**Slide pillars are blocking.** Any pillar violation in [`../_shared/slide-philosophy.md`](../_shared/slide-philosophy.md) — one thought, ≤1 body sentence besides graphics/labels/titles, visual-first, forward motion — fails the deck.

Deck-build-specific rules on top of the pillars:

- Every slide must trace back to the approved plan.
- The opening establishes context quickly. The ending lands on a takeaway, action, or decision — it does not just stop.
- Layout and animation reinforce meaning, not decorate it. If a slide feels crowded, split it instead of shrinking everything.
- **The live-talk canvas is explicit.** For HTML decks, set a presentation size that matches the planned aspect ratio rather than assuming browser defaults will behave well enough. 16:9 for standard stage; 9:16 for intentional vertical.
- **Browser support is part of the build contract.** Latest Chrome and latest Firefox are mandatory for HTML decks. Add Safari when local Mac presentation or direct browser opening is part of the delivery path.
- **Style is intentional.** State the deck's palette, typography, density, spacing rhythm, and whether section-to-section contrast is deliberate.
- **Before / after contrast reads as authored.** If one act is intentionally plain, ugly, or deadpan, make sure that contrast feels purposeful rather than accidentally unfinished.
- **Numeric results are never prose.** Any slide carrying a result, improvement, change, target, or comparison gets a visual treatment per **`stats-visualization`** — hero number, before/after, bars, gauge, delta callout, or annotated change chart — with a reason label explaining *why* the number moved. Inline phrasing like "340 ms vs 65 ms" is a bug.
- **Resulting thoughts are never footers.** If a line is the lesson, standard, decision, pattern, principle, or "so what" produced by the slide, make it the dominant final payoff layer. If that line is a separate thought, split it into its own slide.
- **Keep the stack simple.** Default to Reveal.js 5.x from CDN, single `index.html`, no build, no installed dependencies (see [references/simple-reveal-deck.md](references/simple-reveal-deck.md)). Do not add a bundler, package manager, CSS framework, or bespoke navigation system unless a concrete requirement demands it and the default has been tried first.
- **Treat "aspect ratio" complaints as composition bugs first.** If the deck is already using its intended canvas but the slide feels cropped, tiny, footer-heavy, or strangely empty, redesign the slide composition instead of blaming global deck size.
- **Related slides share one incident model.** Hook, diagnosis, fix, and result slides about the same event must use exactly the same thresholds, timeline, and before/after numbers.
- **Critical reveal-heavy decks need concrete QA checks.** If the deck depends on timing, replay, or annotation placement, write explicit per-slide checks instead of relying on vague manual confidence.
- **Decorative recap grids are banned.** Storyboard / journey / recap slides must contain meaningful story beats, not empty or interchangeable tiles.

---

## Human stagecraft QA

Before a deck is considered complete, run the canonical **human stagecraft QA** pass in [`../_shared/stagecraft-qa.md`](../_shared/stagecraft-qa.md). It is a blocking gate, not optional polish.

Judge every slide as a stage object for a live room, not as a browser screenshot. Revise and re-check until every checklist answer is **no**.

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
