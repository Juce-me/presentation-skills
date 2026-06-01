# Presentation Flow Lock Design

Status: planned
Type: feature
Author: Juce-me

## Goal

Add a dedicated intermediate skill between `brief-to-presentation-plan` and `presentation-plan-to-deck` that converts an approved presentation plan into a locked narrative, style, and motion contract before any deck generation begins.

## Why this change

`presentation-skills` already carries strong deck-specific guidance, but too many high-risk decisions are still made inside `presentation-plan-to-deck` while slide generation is already in progress. That makes outputs vulnerable to drift:

- a storytelling deck quietly turns into a generic business deck
- visual language changes from slide to slide without being intentional
- reveal-heavy slides use inconsistent timing or proof order
- selling decks bury objections or the CTA because the narrative spine was not locked
- educational decks jump between concepts without a stable teaching sequence

`superpowers` is more stable because it separates design, planning, and execution with explicit approval gates. This design borrows that structural advantage and applies it to presentation work.

## Problem statement

The current workflow looks like this:

1. `presentation-discovery` (optional)
2. `brief-to-presentation-plan`
3. `presentation-plan-to-deck`
4. `deck-review-update`

This is strong on discovery, planning, and review, but it lacks a dedicated phase for freezing the deck's operating contract. The plan may mention the audience, through-line, visual direction, and reveal strategy, yet the deck builder still has to improvise:

- what kind of persuasion or teaching flow the deck is actually using
- which slide archetypes are allowed
- how section-level style contrast should behave
- what reveal grammar is permitted
- what every proof-heavy slide must show before, during, and after each step

That missing layer is the main cause of instability.

## Proposed change

Add a new skill:

- `skills/presentation-flow-lock/SKILL.md`

Insert it into the workflow:

1. `presentation-discovery` (optional)
2. `brief-to-presentation-plan`
3. `presentation-flow-lock`
4. `presentation-plan-to-deck`
5. `deck-review-update`

`presentation-flow-lock` does not build slides. It produces a deck contract artifact that downstream skills must treat as the source of truth for flow, style, and animation behavior.

## Desired outcome

After this change, deck generation should become more repeatable in four areas:

1. Story flow
   The deck should follow a deliberately chosen narrative model instead of drifting into generic "section + bullets" structure.

2. Style consistency
   The deck should have one explicit visual system with controlled act-to-act contrast rather than accidental variation.

3. Animation quality
   Reveal steps should follow one stated grammar, sync proof with claims, and remain readable at every step.

4. Slide design discipline
   Each slide should use a known archetype with explicit opening/final states instead of ad hoc layouts.

## Scope

This change is limited to the skill system and repository documentation. It does not require building a deck renderer, new runtime code, or browser automation.

In scope:

- a new skill for locking flow/style/motion decisions
- a reusable artifact template produced by that skill
- workflow changes across existing skills and docs
- explicit handoff and rejection rules for incomplete inputs

Out of scope:

- automatic slide rendering
- a new QA runtime or screenshot harness
- replacing `presentation-plan-to-deck` or `deck-review-update`
- introducing more deck frameworks beyond existing guidance

## Design principles

### 1. Freeze decisions before slide generation

Anything likely to cause cross-slide drift should be decided before the deck builder starts writing slide content or HTML.

### 2. Separate narrative mode from visual polish

A beautiful deck with the wrong sales or teaching sequence still fails. The contract must define the presentation's rhetorical job, not only its appearance.

### 3. Constrain, do not overfit

The new skill should narrow the decision space enough to stabilize quality, but not force one universal deck style.

### 4. Treat animation as authored behavior

Animation is part of the teaching or selling logic. It is not a post-hoc flourish.

## Presentation modes

`presentation-flow-lock` should require one primary presentation mode:

- `storytelling`
- `selling`
- `educational`

Mixed decks are allowed, but one primary mode must be named so downstream decisions have a clear default.

### Storytelling mode

Default spine:

1. hook
2. stakes
3. turn or complication
4. investigation or journey
5. resolution
6. lesson or landing

### Selling mode

Default spine:

1. pain or opportunity
2. cost of inaction
3. proposed solution
4. proof
5. objection handling
6. CTA or decision ask

### Educational mode

Default spine:

1. context
2. mental model
3. guided example
4. misconception or failure mode
5. practice or application
6. recap

If the plan cannot cleanly support one of these modes, the skill should send the work back rather than invent a weak hybrid.

## Contract artifact

`presentation-flow-lock` should output a saved markdown artifact. Working name:

`<project-root>/docs/specs/YYYY-MM-DD-<slug>-flow-lock.md`

This file becomes a required input to `presentation-plan-to-deck`.

## Flow lock artifact structure

The artifact should contain these sections:

### 1. Presentation identity

- title or working title
- primary mode
- audience
- delivery mode
- deck goal
- one-sentence through-line

### 2. Narrative contract

- chosen narrative spine
- section list with section jobs
- escalation logic from opening to ending
- mandatory slide jobs that must appear
- forbidden detours or filler patterns

### 3. Visual system contract

- palette and contrast model
- typography direction
- spacing rhythm
- density rules
- component motifs
- allowed section contrast
- banned visual regressions

### 4. Motion grammar

- default reveal model
- when to use fragments vs static composition
- step order rules
- timing range
- replay requirements
- readability rules for late-entering labels, captions, and callouts

### 5. Slide archetype library

Each deck should define its allowed archetypes from a small library such as:

- hook slide
- stakes slide
- proof slide
- comparison slide
- process or model slide
- objection slide
- recap slide
- CTA slide

Each archetype should specify:

- its job
- preferred layout family
- allowed content density
- animation allowance
- anti-patterns

### 6. Reveal matrix

For every reveal-heavy slide or slide family, define:

- opening state
- step 1
- step 2
- step 3 if needed
- final state
- matching proof per step
- reserved space for late elements

### 7. Consistency anchors

- canonical facts reused across slides
- style invariants that must not drift
- motion invariants that must not drift
- browser/runtime requirements

### 8. Completion gate

- explicit checks that `presentation-plan-to-deck` must satisfy
- explicit reasons to reject the plan and send work backward

## Workflow behavior

### `brief-to-presentation-plan`

This skill remains responsible for audience, goal, through-line, delivery contract, visual direction, motion strategy, and canonical facts. It should now end with an instruction that the approved plan must be locked by `presentation-flow-lock` before deck implementation begins.

### `presentation-flow-lock`

This new skill should:

1. read the approved presentation plan
2. identify the primary deck mode
3. choose the narrative spine
4. lock the visual system
5. lock the motion grammar
6. assign the slide archetype library
7. define reveal matrices for reveal-heavy segments
8. save the flow-lock artifact
9. hand off to `presentation-plan-to-deck`

If the plan is too vague to support a stable contract, it should refuse to proceed and route the work back to `brief-to-presentation-plan`.

### `presentation-plan-to-deck`

This skill should no longer improvise the deck's narrative model, style system, or animation grammar when a flow-lock artifact is expected. It should consume the artifact and treat it as binding. If it receives only a plan for a deck that clearly depends on story flow, teaching order, sales choreography, or reveal-heavy proof, it should send the work back to `presentation-flow-lock`.

### `deck-review-update`

This skill should review not only against the deck and plan, but also against the flow-lock artifact. That gives review a stable basis for judging whether inconsistency is intentional or a regression.

## Stability gains

This design should improve output stability by moving the highest-risk choices earlier:

- narrative drift becomes less likely because the mode and spine are explicit
- style drift becomes easier to detect because the deck has declared invariants
- animation inconsistency becomes less likely because motion grammar is stated once
- step-by-step proof becomes more reliable because reveal matrices are part of the contract
- review becomes sharper because it can compare the built deck to a fixed contract, not only to a broad plan

## Example operating rule

If the primary mode is `selling`, the deck builder should not quietly substitute a neutral educational sequence. The flow lock should explicitly require:

- a pain slide before the solution pitch
- a proof mechanism before the CTA
- at least one objection-handling slide or section
- CTA language and ask type consistent with the plan's decision goal

Likewise, if the primary mode is `educational`, the deck builder should not skip the mental model and jump straight to examples.

## Implementation sketch

Expected repository changes:

- add `skills/presentation-flow-lock/SKILL.md`
- update `README.md` workflow and skill list
- update `skills/brief-to-presentation-plan/SKILL.md` handoff rules
- update `skills/presentation-plan-to-deck/SKILL.md` to require the flow lock for relevant decks
- update `skills/deck-review-update/SKILL.md` to validate against the flow lock
- optionally add a small example or template reference for `flow-lock.md`

## Risks and tradeoffs

### Risk: more process overhead

This adds one more step to the workflow. That is intentional. The cost is acceptable because the repository is optimizing for presentation quality and repeatability, not for the shortest possible path to a draft.

### Risk: over-constraining simple decks

Not every deck needs a heavy flow lock. The skill should scale its output to the deck's complexity. A short educational deck may need a lean artifact; a reveal-heavy sales narrative may need a detailed one.

### Risk: duplication with the plan

The flow lock should not restate everything in the plan. It should only freeze the decisions that must remain stable during deck construction and review.

## Success criteria

This change is successful when:

- the repository has a dedicated flow-lock skill
- the docs describe it as a required intermediate phase for relevant decks
- existing skills route work through it instead of improvising late
- the artifact clearly locks narrative mode, visual system, and motion grammar
- review can use the artifact to flag drift

## Open questions

1. Whether the artifact should always be required, or only for decks that are story-driven, sales-oriented, educational, or reveal-heavy.
2. Whether a tiny reference template should live next to the skill for easier reuse.
3. Whether numeric-slide requirements from `stats-visualization` should be referenced directly inside the flow-lock archetype library.

## Recommendation

Implement `presentation-flow-lock` as a required step for any deck where the audience experience depends on storytelling, selling, educational sequencing, deliberate style contrast, or step-by-step animation. Keep lightweight decks on the existing simpler path.
