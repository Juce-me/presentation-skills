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

---

## Supported scenario

This skill explicitly covers **story-driven engineering decks** that retell one incident, launch, migration, regression, or fix across multiple slides, often using:

- before / after contrast
- animated proof slides
- staged reveals
- recap or navigation slides
- deliberate visual style changes between acts

When reviewing this kind of deck, treat story continuity, proof timing, runtime behavior, and build constraints as first-class concerns, not implementation details.

---

## Review focus

Check for:

- weak or unclear through-line
- audience mismatch
- slow or confusing opening
- missing stakes
- repetitive slides
- overloaded slides
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

## Human stagecraft QA

- Text hugging the screen edge: [yes/no + slide refs]
- Object too small for the back row: [yes/no + slide refs]
- Empty container chrome larger than the insight: [yes/no + slide refs]
- Claim appears before matching evidence: [yes/no + slide refs]
- Reveal collisions or unreadable overlap: [yes/no + slide refs]
- Placeholder or dev-only text still visible: [yes/no + slide refs]
- Auto-fitted instead of human-composed: [yes/no + slide refs]

## Build / Runtime QA

- Planned aspect ratio explicitly supported: [yes/no + notes]
- Run path matches delivery mode: [yes/no + notes]
- Chrome verified: [yes/no + notes]
- Firefox verified: [yes/no + notes]
- Safari required and verified: [yes/no/n/a + notes]
- Custom animation replays on revisit: [yes/no + slide refs]
- Visual system / style contrast feels intentional: [yes/no + slide refs]

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
- Keep audience needs above source-material completeness.
- Stagecraft QA failures are blocking. A deck with any `yes` answer in the final checklist is not done.
- Missing runtime/build requirements are blocking when the deck depends on them.
- For any fragment, reveal, or animation sequence, require narrative and evidence to advance together on the same step.
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
- multiple charts, diagrams, or data tables on the same slide
- a layout that requires the speaker to explain how to read the slide before reading it
- text or visual elements that are shrunk to fit rather than naturally sized

**Default action: split into separate slides.**

Each split slide gets its own job, its own title, and its own reveal logic. Prefer two clean slides over one complex one. A slide that needs a tour guide is a slide that needs to be broken apart.

---

## Human stagecraft QA

Before calling a deck complete, run a mandatory **human stagecraft QA** pass. Judge the slides as stage objects for a live audience, not as browser screenshots.

Hard rules:

- **Respect the chosen stage.** If the deck is meant for a standard wide screen or an intentional vertical screen, the composition should clearly use that space on purpose.
- **No auto-fit look.** Headlines, wordmarks, and hero objects must keep visible breathing room from the slide edges. If a long token or product name starts hugging the edge, split it, resize it, or constrain it to a column.
- **No tiny idea objects.** Ban micro-demos, tiny dots, thin labels, miniature navigation markers, and other subscale elements unless the whole slide is about that object and it is enlarged enough to command attention.
- **Evidence must dominate proof slides.** On chart, diagram, or flamegraph slides, the evidence should be the biggest thing after the headline. Thin lines with tiny annotations are not enough for a live room.
- **Reveal states must sync story to proof.** If a step introduces a claim, takeaway, or analysis point, the matching marker, highlight, label, callout, or comparison cue must appear on that same step. Lower captions and bullets cannot get ahead of the main visual.
- **Payoff hierarchy must be obvious.** The main lesson, delta, or result cannot sit as a muted footer under a giant container. If it is the point, it must be visually dominant.
- **No audience-facing scaffolding.** Never leave placeholder URLs, fake QR codes, TODO text, implementation reminders, or backstage instructions on visible slides.
- **No accidental reveal collisions.** Late-entering elements must remain readable and keep breathing room. If the final reveal creates overlap or crowding, redesign or split the slide.
- **Navigation and recap must clarify the path.** Progress bars, journey grids, section labels, and "you are here" cues must reinforce story orientation.
- **Style contrast must read as intentional.** If one section is plain, ugly, deadpan, or parody, that should feel authored rather than broken.
- **Distinguish intentional ugly from accidental ugly.** If a deck uses parody or contrast on purpose, preserve that; do not "fix" the joke. But do not let accidental machine-looking composition leak into the polished sections.

Final review checklist:

- any text hugging the screen edge?
- any object too small to notice from the back row?
- any slide where empty container chrome is larger than the insight?
- any claim, caption, or bullet visible before its matching evidence appears?
- any reveal step where late-entering elements collide or become hard to read?
- any placeholder or dev-only text still visible?
- any slide that feels auto-fitted instead of composed by a human?
- any slide where the complaint sounds like "aspect ratio" but the real problem is empty or badly used canvas?
- any chart, flamegraph, or code panel hugging the footer instead of commanding the stage?
- any related slides where the dates, thresholds, or result numbers do not line up?
- any custom animation that fails to replay when revisiting the slide?
- any slide that behaves differently enough in Firefox to change readability or meaning?
- any missing or unclear runtime requirement that could break delivery?
- any act-level visual language shift that feels accidental instead of intentional?
- any recap / journey slide filled with decorative or empty boxes?

If any answer is **yes**, the review is not complete. Revise the slide, then run the pass again. Only call the deck done when every answer is **no**.

---

## When to send work backward

If the deck problems come from a weak plan rather than weak execution, send it back to **`brief-to-presentation-plan`** or **`presentation-plan-to-deck`** as appropriate instead of patching endlessly.
