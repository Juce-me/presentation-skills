---
name: brief-to-presentation-plan
description: >-
  Converts a brief, notes, transcript, document, or mixed source material into
  a presentation plan and saves it to the project's `docs/specs/` folder. Use
  when the input is messy or incomplete and you need to extract audience,
  goal, theme, narrative arc, section flow, and slide intent before building
  a deck.
---

# Brief to presentation plan

Use this skill when the user provides source material and wants a presentation created from it. The job here is to turn raw input into a clear plan, not to design slide layouts yet.

**Canonical slide rules:** load [`../_shared/slide-philosophy.md`](../_shared/slide-philosophy.md) before planning. Every slide intent must satisfy all four pillars: one thought, minimum text (≤1 sentence besides graphics/labels/titles), visual-first, and forward motion (reveals + 10–35 s pace + named transition).

---

## Supported scenarios

This skill supports more than one presentation shape. One important supported scenario is a **story-driven engineering deck** that:

- turns one incident, migration, launch, regression, or fix into a narrative
- uses before / after contrast, staged reveals, animated proof, or navigation cues
- depends on content placement, visual hierarchy, and browser/runtime behavior to land correctly

When this scenario applies, the plan must lock the story facts, visual direction, motion strategy, and delivery constraints early. Do not leave those decisions to improvisation during deck build.

Worked example:

- [`docs/examples/proper-presentation-deck.md`](../../docs/examples/proper-presentation-deck.md) — presentation made with `presentation-skills`

---

## Inputs

Supported starting points:

- brief or prompt
- meeting notes
- transcript
- document or spec
- mixed notes, links, bullets, and rough ideas

If the input is fragmented, normalize it first into a single working summary.

---

## Workflow

1. **Read the source carefully**
   Extract the main topic, business context, explicit asks, and implied stakes.

2. **Identify the presentation outcome**
   Determine what the audience should understand, decide, believe, or do after the presentation.
   Also identify the delivery mode:
   - live talk
   - internal review
   - async walkthrough
   - export / leave-behind artifact

3. **Define the audience**
   Infer or ask about:
   - who is in the room
   - what they already know
   - what they are likely to resist or question
   - what level of detail they need

4. **Find the through-line**
   Reduce the presentation to one sentence. Every section should support that sentence.

5. **Apply critical thinking**
   Pressure-test the material:
   - what is unsupported, vague, or contradictory
   - what is missing for credibility
   - what is interesting but not essential
   - where theory and reality diverge

6. **Choose the story shape**

   Two canonical arcs. Pick one and use it consistently in the plan; do not blend them.

   **Generic arc (default):**
   - setup
   - orientation
   - development
   - complication
   - resolution
   - landing

   **Engineering-story arc** — use for an incident, migration, launch, regression, diagnosis, or fix retold as one narrative:
   - hook
   - stakes
   - investigation
   - aha / diagnosis
   - fix
   - result
   - lesson
   - recap / navigation / CTA

   The output template below has a slot for whichever arc you pick.

7. **Create the presentation plan**
   Produce:
   - presentation goal
   - primary audience
   - through-line
   - key tensions or tradeoffs
   - section-by-section flow
   - slide-by-slide intent, with one main thought per slide and the forward transition to the next slide
   - visual evidence plan for each slide: chart, diagram, screenshot, picture, demo frame, or spatial comparison before prose
   - per-slide reveal intent (which element appears on which step)
   - format and delivery contract
   - visual system / style direction
   - motion / reveal strategy
   - QA and verification requirements
   - canonical fact model for any repeated case study, incident, or before/after story
   - open questions / evidence gaps

8. **Save the plan to the project**
   Write the plan to `<project-root>/docs/specs/YYYY-MM-DD-<slug>-design.md` (see [File location](#file-location) below). Create `docs/specs/` if it does not exist. Tell the user the exact path after saving.

---

## File location

Every plan must be saved to the target project's specs folder using a dated, descriptive filename:

```
<project-root>/docs/specs/YYYY-MM-DD-<kebab-slug>-design.md
```

Example:

```
<project-root>/docs/specs/2026-04-17-presentation-skills-lightning-talk-design.md
```

Rules:

- `YYYY-MM-DD` is today's date in ISO format.
- `<kebab-slug>` is a short lowercase, hyphen-separated slug tied to the talk topic.
- Filename always ends in `-design.md`.
- Create `docs/specs/` if it does not exist — do not fall back to another path.
- Never save the plan at the project root, in `plans/`, in `docs/` directly, or next to deck files.
- One plan per file. Do not append multiple plans into one document.
- If the target project root is ambiguous, confirm with the user before writing.

---

## Output template

Use this structure unless the user asks for another format:

```markdown
# Presentation plan

## Goal
[What this presentation must achieve]

## Audience
[Who is in the room, what they know, what they need]

## Through-line
[One-sentence core message]

## Stakes
[Why this matters now]

## Key tensions
- [Tension 1]
- [Tension 2]

## Narrative arc
[Pick one — Generic OR Engineering-story — and fill in the matching beats. Delete the other.]

**Generic arc:**
1. Setup
2. Orientation
3. Development
4. Complication
5. Resolution
6. Landing

**Engineering-story arc:**
1. Hook
2. Stakes
3. Investigation
4. Aha / diagnosis
5. Fix
6. Result
7. Lesson
8. Recap / navigation / CTA

## Deck structure
1. [Section name]: [purpose]
2. [Section name]: [purpose]

## Slide intents
1. [Slide title] — [one main thought (one plain sentence, no "and"); primary visual proof; reveal intent; forward transition to next slide]
2. [Slide title] — [one main thought; primary visual proof; reveal intent; forward transition]

## Format and delivery
- Format: [HTML deck / PPTX / other]
- Aspect ratio: [explicitly chosen; 16:9 is the usual default, 9:16 is valid for intentional vertical delivery]
- Delivery mode: [live talk / async / review]
- Runtime: [browser / PowerPoint / other]
- Support matrix: [for HTML decks, latest Chrome and Firefox are required; add Safari when relevant]

## Visual system
- Style direction: [clean / technical / bold / formal / etc.]
- Palette / contrast rules: [what visual language the deck uses]
- Typography / density rules: [minimum text; visuals carry the explanation; how the deck should read in a live room]
- Intentional contrast: [for example, plain "before" act vs polished "after" act]

## Motion / reveal strategy
- Reveal model: [none / fragments / animated charts / staged proof / auto-animate]
- Evidence-to-conclusion overlays: [slides where 3-4 statement cards should reveal a centered synthesis overlay instead of a bottom takeaway]
- Navigation cues: [progress bar / act labels / recap map / none]
- Replay requirement: [what must re-run when revisiting a slide]

## Canonical facts
- [Shared numbers, dates, thresholds, names, and cause/effect facts that must stay consistent across slides]

## QA / verification
- [Stagecraft checks, browser checks, runtime checks, timing checks, export checks]

## Gaps / questions
- [Missing evidence, unclear claim, unresolved choice]
```

---

## Quality bar

**Slide rules:** every planned slide must satisfy the four pillars in [`../_shared/slide-philosophy.md`](../_shared/slide-philosophy.md). The plan is rejected if any slide intent violates one of them at the planning stage.

Plan-level requirements on top of the pillars:

- The plan must be driven by audience and outcome, not by source-document order.
- Cut repetition from the source instead of preserving it.
- Surface weak claims explicitly rather than smoothing them over.
- If the source does not support a strong presentation yet, say so and list what is missing.
- The plan must name the intended build/runtime path when presentation behavior depends on the medium.
- The plan must name the intended aspect ratio explicitly. **16:9** is the common default for standard stage decks; **9:16** is fully supported when the user, venue, recording format, or distribution model calls for vertical delivery.
- For HTML decks, treat **latest Chrome and latest Firefox** as the minimum browser support contract. Add Safari when the deck is likely to be presented from a Mac or opened locally.
- The motion / reveal strategy is a first-class plan section, not an afterthought. Name reveal strategy, replay behavior on revisit, and the navigation / "what's coming" cues.
- If 3–4 statement, principle, or summary blocks build toward one synthesis, call for an evidence-to-conclusion overlay (see [`../_shared/evidence-to-conclusion-overlay.md`](../_shared/evidence-to-conclusion-overlay.md)).
- If the same incident, migration, or before/after story appears on multiple slides, pin one canonical set of numbers, times, and causal claims in the plan.
- The visual system should be explicit enough that implementation does not invent an arbitrary style, layout density, or contrast model.
- The slide count must respect the 10–35 s/slide pace target. If the proposed count puts the average above ~35 s/slide, push back and split.

---

## Handoff

Once the plan file is saved under `docs/specs/` and approved, hand off to **`presentation-plan-to-deck`** using that saved file as the source of truth for the deck build.
