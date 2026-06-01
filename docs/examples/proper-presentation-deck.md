# Worked Example: A Presentation Made With presentation-skills

This repository documents a concrete worked example based on a separate deck project built with `presentation-skills` (an external project, not included in this repo). In the references below, `<deck-project>` stands for that deck's project root.

Use this example when you need a reference for a **story-driven engineering presentation** that depends on:

- one incident retold across multiple slides
- intentional act-to-act style contrast
- staged reveals and animation as part of the story
- explicit browser/runtime constraints
- replayable chart behavior
- repeatable QA beyond subjective visual review

Treat this as a reference example, not a template to copy blindly. Reuse the patterns that matter; adapt the content and design to the user's actual presentation.

## Source files

- Design spec: `<deck-project>/docs/specs/2026-04-17-presentation-skills-lightning-talk-design.md`
- Deck implementation: `<deck-project>/index.html`
- QA script: `<deck-project>/scripts/deck-qa.js`

## Why this example matters

The deck demonstrates a supported scenario for this repo: an engineering story presented as a sequence of scenes instead of a static report, built with the workflow and quality bar this project is trying to teach.

Key moves:

- Act 1 is intentionally flat and bland.
- The bridge creates contrast and resets the room.
- Act 2 retells the same story with staged proof: hook, stakes, investigation, aha, fix, result, lesson, recap.
- Act 3 makes the presentation mechanics explicit and turns them into the pitch.

This is useful because the deck does not rely on generic “nice slides.” It relies on explicit narrative timing, content placement, visual hierarchy, browser behavior, and QA.

## Reusable patterns

### 1. Canonical incident model

The same event model is preserved across multiple slides: times, thresholds, deploy moments, and result numbers stay aligned.

Use this pattern whenever a deck made with `presentation-skills` retells one incident, migration, launch, or before/after transformation. The plan should pin one shared fact model before implementation begins.

### 2. Intentional style contrast

The deck uses a plain “before” section and a polished “after” section on purpose, not by accident.

Use this pattern when contrast helps the argument. If a section is ugly, flat, or deadpan, that should be authored and rhetorically justified.

### 3. Reveal sync

Claims and proof land on the same step. Text does not get ahead of the visual evidence.

Use this pattern for any fragment-heavy deck:

- markers appear with the analysis they support
- chips/captions follow the chart state the audience can already see
- recap/navigation views reveal meaningful beats, not filler tiles

### 4. Explicit runtime contract

The deck is built as a browser-run Reveal presentation with explicit size, browser expectations, and replay behavior.

Use this pattern whenever a presentation made with `presentation-skills` depends on the medium. If the runtime matters, it belongs in the plan, not just in implementation.

### 5. Repeatable QA

The deck is not only reviewed by eye. It also has explicit checks for critical behaviors such as:

- reveal counts
- evidence size
- annotation placement
- safe margins
- placeholder cleanup
- revisit/replay behavior

Use this pattern for any reveal-heavy or proof-heavy HTML deck.

## How each skill should use this example

### brief-to-presentation-plan

Learn from this example that the plan must do more than list slide titles. It should also lock:

- delivery format and aspect ratio
- runtime / browser support
- visual system
- motion strategy
- canonical facts
- QA expectations

### presentation-plan-to-deck

Learn from this example that implementation needs a real slide contract:

- slide role in the story
- dominant evidence object
- reveal sequence
- final visible state
- runtime notes
- replay behavior
- per-slide QA checks when motion carries meaning

### deck-review-update

Learn from this example that review should treat the following as first-class:

- story continuity across slides
- intentional style contrast
- proof dominance
- runtime assumptions
- browser behavior
- replayable animation
- build/runtime QA alongside human stagecraft

## What to inspect in the example deck

- The narrative structure and scenario framing in the design spec.
- The section contrast, reveal-heavy proof slides, and recap/navigation treatment in the deck HTML.
- The browser-based QA assertions that convert presentation quality risks into explicit checks.

## Anti-patterns this example helps prevent

- planning only the story and ignoring the runtime
- building proof slides where the evidence is too small to carry the claim
- using animation decoratively instead of structurally
- letting related slides drift apart on dates, thresholds, or result numbers
- calling a reveal-heavy browser deck “done” without replay and browser verification
