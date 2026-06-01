---
name: deck-review-update
description: >-
  Reviews a presentation deck for story consistency, pacing, structure, and
  audience fit, then proposes or applies concrete improvements. Use when a deck
  draft exists and you need to identify what is weak, confusing, redundant, or
  missing and update it accordingly.
---

# Deck review and update

Use this skill when the deck already exists and needs critical review plus concrete improvement.

The main job is not cosmetic polish. It is to judge whether the deck tells the right story, in the right order, for the right audience, and then tighten it.

**Canonical slide rules:** load [`../_shared/slide-philosophy.md`](../_shared/slide-philosophy.md). Any pillar violation is a blocking finding: one thought (one plain sentence, no "and"), minimum text (≤1 sentence besides graphics/labels/titles), visual-first, forward motion (default to step reveals; 10–35 s pace; named transition; reveal sync; replay on revisit).

---

## Supported scenario

This skill explicitly covers **story-driven engineering decks** that retell one incident, launch, migration, regression, or fix across multiple slides, often using:

- before / after contrast
- animated proof slides
- staged reveals
- recap or navigation slides
- deliberate visual style changes between acts

When reviewing this kind of deck, treat story continuity, proof timing, runtime behavior, and build constraints as first-class concerns, not implementation details.

Worked example:

- [`docs/examples/proper-presentation-deck.md`](../../docs/examples/proper-presentation-deck.md) — presentation made with `presentation-skills`

---

## Review focus

Check for:

- weak or unclear through-line
- audience mismatch
- slow or confusing opening
- missing stakes
- repetitive slides
- overloaded slides
- slides with more than one main thought (fails one-sentence test or needs an "and")
- slides carrying more than one body sentence besides graphics, labels, and titles
- slides whose implication, decision, or solution is buried in text instead of visible in the composition
- text-heavy slides that should be rebuilt around a graph, picture, diagram, screenshot, demo frame, or spatial comparison
- static slides where a step reveal would have carried the story forward
- slides whose forward transition to the next slide is unclear
- slides that would need a full minute or more to read in a live room (fails the 10–35 s/slide pace)
- overloaded comparison or example slides: more than one full example pair, more than one teachable mistake, multiple case studies, or more than two large comparison cards
- abrupt transitions
- unsupported claims
- weak landing or no real ending
- missing or vague build/runtime contract
- unclear or inconsistent visual system
- act-to-act style contrast that feels accidental instead of intentional
- visual/reveal choices that spoil the story order
- claim, takeaway, or analysis text that appears before the audience can see the matching proof on the main visual
- **numeric results presented as prose instead of visuals** (see `stats-visualization`)
- proof slides where the evidence is too small to carry the claim in a live room
- reveal steps where new labels, callouts, captions, or badges collide and become hard to read
- payoff slides where the insight is visually weaker than the container around it
- slides where the resulting thought, lesson, standard, decision, pattern, principle, or "so what" is treated as a small footer, caption, subtitle, or muted bridge instead of a dominant final payoff layer
- 3-4 statement, principle, or summary card slides that bury the synthesis as a bottom takeaway instead of revealing it as an overlay
- audience-facing scaffolding such as placeholder URLs, fake QR codes, TODO text, or backstage notes
- accidental machine-looking composition that should either be cleaned up or clearly marked as intentional parody/contrast
- slides that feel "wrong aspect ratio" because the canvas is underused or badly balanced
- chart or code slides where the evidence sits too low on the slide or occupies too little of the canvas
- related slides whose numbers or timeline do not describe the same incident
- custom motion that works once but does not replay on revisit
- motion or SVG behavior that breaks in Firefox
- reveal-heavy decks with no concrete QA evidence
- browser/runtime assumptions that are incompatible with how the deck is supposed to be delivered
- journey / recap slides made of decorative, empty, or interchangeable boxes

---

## Review workflow

1. **Reconstruct the intended story**
   Infer the likely goal, audience, and through-line from the deck.
   Also reconstruct the build/runtime contract:
   - what format this deck is meant to run in
   - whether it assumes 16:9, 9:16, or another presentation format
   - whether it depends on browser behavior, local serving, CDN access, or native deck software

2. **Test coherence**
   Ask:
   - does the opening earn attention
   - does each section build on the previous one
   - does the deck escalate meaningfully
   - does the ending resolve the promise made up front
   - do style, motion, and navigation choices support the same story rather than competing with it

3. **Find the highest-leverage issues**
   Prioritize structural problems before wording tweaks.

4. **Recommend updates**
   Prefer specific changes:
   - cut
   - merge
   - reorder
   - split
   - strengthen
   - add missing evidence
   - rewrite transitions

5. **Apply updates when requested**
   Update the deck or its slide spec so the story becomes cleaner and more persuasive.

6. **Run human stagecraft QA before declaring the deck done**
   This is a blocking completion gate.
   - if you are reviewing only, report every failed checklist item as a finding and do not call the deck ready
   - if you are updating the deck, revise and re-check until every checklist answer is `no`
   - for HTML decks, verify the critical slides in Chrome and Firefox before declaring the deck done

---

## Feedback format

When reviewing, use this structure:

```markdown
## Findings

1. [Most important issue]
   - Why it matters
   - What to change

2. [Next issue]
   - Why it matters
   - What to change

[Use the canonical reporting format from [`../_shared/stagecraft-qa.md`](../_shared/stagecraft-qa.md) — both Human stagecraft QA and Build / Runtime QA sections.]

## Suggested update plan

1. [Change]
2. [Change]
3. [Change]
```

If there are no major issues, say that explicitly and call out any residual risks or testing gaps.

---

## Update rules

- Fix structural issues before polishing wording.
- Protect the through-line; do not add slides that dilute it.
- If two slides do the same job, merge or remove one.
- If one slide does too many jobs, split it.
- If one slide carries more than one main thought (one-sentence test fails or it needs an "and"), split it before rewriting copy.
- If one slide contains more than one full example pair, more than one teachable mistake, multiple case studies, or more than two large comparison cards, split it by default. A bad/good pair counts as one proof object; two bad/good pairs are two slides unless the slide is explicitly a recap/index with label-only cards.
- If a slide carries more than one body sentence besides graphics, labels, and titles, cut to the one sentence that lands the thought; let the visual carry the rest.
- If the audience has to read paragraphs or stacked bullets to understand the point, replace the prose with a graph, picture, diagram, screenshot, demo frame, or spatial comparison.
- If a slide is static end-to-end and there is a natural step reveal that would carry momentum, add it.
- Each slide should land a simple implication, decision, or solution. If that outcome is buried in supporting text, redesign the visual hierarchy.
- If a slide builds to a resulting thought, make that thought the dominant final payoff layer or split it into its own slide. Do not leave it as a footer, caption, subtitle, or quiet bridge line.
- Keep audience needs above source-material completeness.
- Stagecraft QA failures are blocking. A deck with any `yes` answer in the canonical checklist is not done.
- Missing runtime/build requirements are blocking when the deck depends on them.
- Replace bottom takeaways under 3–4 evidence cards with the canonical evidence-to-conclusion overlay (see [`../_shared/evidence-to-conclusion-overlay.md`](../_shared/evidence-to-conclusion-overlay.md)).
- Preserve intentional style contrast in multi-act decks; remove accidental inconsistency.
- Preserve intentional ugly, parody, or contrast when it is clearly part of the joke or rhetorical move. Remove only the accidental machine-looking composition.

---

## Numeric slide check

During review, scan every slide for numbers that represent a **result, improvement, change, target, or benchmark** (latency, adoption, cost, error rate, revenue delta, etc.). Flag any slide where those numbers appear as inline prose, bullet text, or a raw table.

**Default action: redesign the slide per `stats-visualization`** — hero number, before/after, bars, gauge, delta callout, or annotated change chart. Every such slide must also carry a short **reason label** explaining *why* the number moved (e.g., "added cache", "new algorithm", "A/B test winner"). A delta without a reason is trivia.

Do not treat this as a polish issue — it is structural. A deck that buries its best numbers is a deck that loses its audience.

---

## Slide complexity check

During review, flag any slide that is doing too much. Signs of a complicated slide:

- more than one distinct concept or argument
- the main thought cannot be stated in one plain sentence
- the conclusion, decision, or solution only appears as a prose takeaway
- the resulting thought, lesson, standard, decision, pattern, principle, or "so what" is visually secondary to the evidence it summarizes
- multiple charts, diagrams, or data tables on the same slide
- more than one full example pair
- more than one teachable mistake
- multiple case studies
- more than two large comparison cards
- a layout that requires the speaker to explain how to read the slide before reading it
- a thumbnail/contact-sheet view where the speaker would need to tour the audience through separate quadrants
- text or visual elements that are shrunk to fit rather than naturally sized
- bullet paragraphs doing work that a visual should do

**Default action: split into separate slides.**

Each split slide gets one sentence-level thought, one proof object, its own title/subtitle, and a reveal path that can land in 10-35 seconds. A bad/good pair counts as one proof object; two bad/good pairs are two slides unless the slide is explicitly a recap/index with label-only cards. Prefer two clean slides over one complex one. A slide that needs a tour guide is a slide that needs to be broken apart.

During review, inspect the slide at thumbnail/contact-sheet size and ask: "Would the speaker need to tour the audience through separate quadrants?" If yes, split before polishing copy.

---

## Human stagecraft QA

Run the canonical pass in [`../_shared/stagecraft-qa.md`](../_shared/stagecraft-qa.md). It is a blocking completion gate.

- If you are reviewing only, report every failed checklist item as a finding and do not call the deck ready.
- If you are updating the deck, revise and re-check until every checklist answer is **no**.
- For HTML decks, verify the critical slides in Chrome and Firefox before declaring the deck done.

---

## When to send work backward

If the deck problems come from a weak plan rather than weak execution, send it back to **`brief-to-presentation-plan`** or **`presentation-plan-to-deck`** as appropriate instead of patching endlessly.
