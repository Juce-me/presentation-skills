# UX / design regressions to prevent

Use this reference when a deck looks "off" even though it technically renders.

The point is to catch failures that pass basic correctness but still fail in a live room.

---

## Core principle

> Most "aspect ratio" complaints are really composition complaints.

If the deck is already 16:9, but the slide feels cropped, tiny, bottom-heavy, or strangely empty, fix the slide layout and visual proportions, not the global deck size.

---

## Failure modes

### 1. Composition imbalance

Symptoms:
- one side of the slide carries all the meaning while the other side is mostly dead space
- a code panel or chart occupies a small island inside a much larger empty container
- a slide reads like it was scaled down inside the canvas instead of composed for it

Default fix:
- identify the dominant object
- let it command the slide
- rebalance or split the slide instead of preserving a half-empty layout

### 2. Text distribution failure

Symptoms:
- the copy column feels ragged, holey, or oddly broken across lines
- the speaker has to visually search the left side to find the story order
- the slide relies on paragraphs or stacked bullets where a graph, picture, diagram, screenshot, or spatial comparison would land faster

Default fix:
- tighten the column width and line-length range
- group related lines into one readable text block
- use spacing to create sequence, not randomness
- replace explanatory prose with a dominant visual whenever the text is carrying the main idea

### 2b. Multiple-thought slide

Symptoms:
- the title, copy, and visual are trying to make two different claims
- the main thought needs an "and" to explain what the slide does
- the proposed solution or implication is only visible as a prose takeaway

Default fix:
- split the slide until each slide has one main thought
- make the dominant visual and title land that thought before the audience reads detail labels
- keep only the text needed to name the visual and the simple implication

### 3. Footer-hugging evidence

Symptoms:
- the chart, graph, or flamegraph sits near the bottom edge like a caption
- the visual proof is thinner than the headline or container chrome

Default fix:
- enlarge the evidence block until it is the biggest object after the title
- use more vertical range so the change is visible from the back row

### 4. Unanchored annotation

Symptoms:
- a label floats near a chart but does not clearly belong to a specific point
- correlation is implied in text but not made legible in the visual

Default fix:
- anchor the label to the exact plotted point
- use a visible leader stem or vertical marker
- place the label where the audience can read the causal relationship instantly

### 5. Cross-slide data drift

Symptoms:
- the hook, investigation, fix, and result slides talk about different thresholds, dates, or magnitudes
- the numbers technically sound plausible but do not describe the same incident

Default fix:
- define one canonical incident timeline and data model
- reuse it across all related slides

### 6. Static or non-replaying motion

Symptoms:
- a chart draws only the first time
- animation works in one browser but not another
- revisiting a slide shows the end state without the intended motion

Default fix:
- remount or reset custom visuals on slide entry
- test revisits, not just first playthrough
- verify in Chrome and Firefox

### 7. Decorative recap junk

Symptoms:
- recap or journey slides contain empty squares, placeholder tiles, or decorative mini-panels with no real narrative job

Default fix:
- replace with meaningful story thumbnails or cut the recap entirely

---

## Acceptance checklist

This file targets composition-specific failure modes. The full slide-level pass is canonical: run [`../../_shared/stagecraft-qa.md`](../../_shared/stagecraft-qa.md). Composition-specific spot checks:

- Is the dominant object obvious?
- Does the evidence carry visual weight proportional to the claim?
- Does every annotation clearly anchor to what it explains?
- Do related slides use the same incident data?
- Does motion replay on revisit?
- Does the slide still work in Firefox?
- Is every recap tile meaningful?

If any answer is no, the deck is not ready.
