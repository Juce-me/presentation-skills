# Slide philosophy (canonical)

Single source of truth for the slide rules every skill in this repo enforces. When skills disagree with this file, this file wins. Update it here, not in each skill.

---

## The four pillars

A slide passes only when **all four** are true.

### 1. One thought per slide

A slide carries exactly one main thought.

**Two-part test (both required):**

- the thought fits in **one plain sentence**
- the slide does **not need an "and"** to explain its job

If a slide needs two claims, two decisions, or two explanations, split it before doing anything else. A slide that needs an "and" is two slides pretending to be one.

### 2. Minimum text

The slide should land its thought from the visual, not from prose.

**Hard rule:** at most **one sentence on the slide besides graphics, labels, and titles.**

That single sentence is for the headline / takeaway / caption only. Bullets, paragraph copy, stacked lines of body text, and "subtitle plus description plus three points" are out by default. Labels on a chart, axis titles, callout text on a diagram, the slide title, and the section tag do not count toward the limit — they are part of the visual.

If you cannot land the slide under that ceiling, the visual is doing too little, not the text doing too little.

### 3. Visual-first

Prefer a graph, picture, diagram, screenshot, demo frame, or spatial comparison over prose. The audience should be able to **name the slide's main thought from the dominant visual + title alone, with the rest of the slide covered.**

If a text-heavy slide could be rebuilt around a graph, picture, diagram, screenshot, demo frame, or spatial comparison, it should be. Text labels the visual; it does not become the slide.

### 4. Forward motion

The deck is always moving the audience forward. The story does not sit still.

**Operational rules:**

- **Default to revealing in steps.** Slides that are static from first paint to last are the exception, not the default. Most slides should reveal at least one element after the opening state — a label, a marker, a comparison cue, a synthesis card, a delta badge — to keep the audience leaning forward.
- **Pace target: 10–35 seconds per slide.** A slide should not "live" for a minute or more. If a slide stays on screen that long, the thought is too big — split it.
- **Set up what comes next.** Every slide's final state should hint at, or earn, the next slide. The slide spec must name the forward transition explicitly.
- **Reveal sync is non-negotiable.** When a step introduces a claim, takeaway, or analysis point, the matching marker, highlight, label, callout, or comparison cue must appear on the **same step**. A caption, bullet, or lower panel that names evidence the audience cannot yet see is a bug.
- **Custom motion must replay on revisit.** A chart, SVG, or scripted visual that animates only on first render is broken — the deck spec must say how replay is triggered or remounted.

---

## Pace target (10–35 seconds per slide)

Use this when sizing a deck or pushing back on a target slide count.

| Format | Length | Slide count target | Implication |
|---|---|---|---|
| Lightning | 5–7 min | ~15–25 slides | ~15–25 s per slide |
| Standard | 20–25 min | ~50–80 slides | ~20–30 s per slide |
| Full session | 40–45 min | ~90–140 slides | ~20–30 s per slide |

A presenter is meant to **advance**, not dwell. If a discovery, brief, or plan suggests a slide count that puts the average above ~35 s/slide, push back: that pace tells the audience to read the slide instead of listening, and pillar 4 fails.

These ranges are guidelines, not budgets to fill. A deck with fewer slides, all of which honor pillars 1–4, beats a longer deck that drags.

---

## When applying the philosophy

Every skill in this repo loads this file as canon:

- **`presentation-discovery`** sets the slide-philosophy expectation in the brief.
- **`brief-to-presentation-plan`** plans for one-thought-per-slide, minimum-text-per-slide, visual-first evidence, and a forward-motion model (reveal strategy + transitions).
- **`presentation-plan-to-deck`** enforces all four pillars at build time and runs `stagecraft-qa.md`.
- **`deck-review-update`** treats violations of any pillar as blocking findings and runs `stagecraft-qa.md` again.
- **`stats-visualization`** is the visual-first treatment for any number that represents a result.
- **`slide-gif-picker`** must not break pillar 4: continuous loop motion competes with reveal-driven motion. Use a GIF only when it serves the beat, never on a slide whose forward motion is already carried by reveals.

If a skill's local guidance contradicts this file, fix the skill.
