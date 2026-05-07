---
name: presentation-discovery
description: >-
  Guided discovery for new presentations when there is no brief, notes, or
  source material yet. Asks structured questions one at a time to establish
  audience, format, tone, takeaway, and narrative direction, then produces a
  brief that feeds into brief-to-presentation-plan.
---

# Presentation discovery

Use this skill when the user wants to create a presentation but only has a topic or rough idea — no written brief, notes, transcript, or document yet. The job here is to run a guided discovery conversation and produce a brief, not to plan the deck.

**Canonical slide rules:** load [`../_shared/slide-philosophy.md`](../_shared/slide-philosophy.md). The brief must set the four-pillar expectation (one thought, ≤1 body sentence besides graphics/labels/titles, visual-first, forward motion at 10–35 s/slide) for the rest of the pipeline.

**Skip when:** the user already has a brief, notes, transcript, or document — go directly to `brief-to-presentation-plan`.

---

## Principles

- One question per message — do not stack questions.
- Multiple choice preferred (A/B/C/D/E) with recommendation + reasoning when the choice is not purely subjective.
- Order matters — later questions depend on earlier answers.
- Adapt options to context — drop irrelevant options, add obvious missing ones.
- Accept freeform answers — if the user ignores options, roll with it.
- Set the slide philosophy early — all four pillars from `../_shared/slide-philosophy.md`: one main thought (one plain sentence, no "and"), minimum text (≤1 sentence besides graphics/labels/titles), visual-first, forward motion (10–35 s/slide, default to step reveals).

---

## Discovery sequence

### 1. Audience — who is this for?

| Option | Description |
|--------|-------------|
| A | Internal team or colleagues |
| B | Stakeholders / leadership — buy-in, funding, decision |
| C | Conference or meetup — broad, external |
| D | Client or customer — persuasion, sales |
| E | Educational — workshop, training, onboarding |

### 2. Format and length

Pace target: **10–35 seconds per slide**. The presenter advances; they do not dwell. If a chosen slide count puts the average above ~35 s/slide, push back and split.

| Option | Description | Slide estimate |
|--------|-------------|----------------|
| A | Lightning talk (5–7 min) | ~15–25 slides |
| B | Standard talk (20–25 min) | ~50–80 slides |
| C | Full session (40–45 min) | ~90–140 slides |

### 3. Tone

| Option | Description |
|--------|-------------|
| A | Provocative / confrontational — challenges the audience |
| B | Empathetic / journey — "we've all been there" |
| C | Show-don't-tell / demonstration — the medium proves the message |
| D | Analytical / data-driven — evidence-first |
| E | Storytelling / narrative arc — characters, tension, resolution |

Recommendation logic:

- Lightning + demo-focused → lean C
- Longer format + persuasion → lean B or E
- Technical audience + evidence-heavy → lean D

### 4. Takeaway — what should the audience walk away with?

| Option | Description |
|--------|-------------|
| A | Awareness / inspiration only |
| B | Awareness + a specific tool or project to try |
| C | Awareness + actionable principles to apply immediately |
| D | A decision or approval to proceed |

### 5. Narrative approach

No fixed options. Generate 2–3 approaches tailored to the combination of answers 1–4. Each gets:

- Short name
- One-paragraph flow description
- Trade-off line (strength vs risk)

End with a recommendation + reasoning.

### 6. Implementation framework (optional — skip if already stated)

| Option | Best when |
|--------|-----------|
| A — Reveal.js (CDN, single `index.html`, no build) — **default** | Most talks. Works with nothing installed |
| B — Slidev | Code demos, developer audience, MDX workflow |
| C — Custom HTML/CSS/JS | Unconventional interactions Reveal cannot express |
| D — PowerPoint / Keynote | Corporate, non-technical audience, required native file |
| E — Undecided | Decide during deck build |

Default recommendation: **A**. Pick another option only if a concrete requirement rules it out. See `presentation-plan-to-deck` → `references/simple-reveal-deck.md` for the default stack.

---

## Output

After all questions are answered, produce a brief using this structure:

```markdown
# Presentation brief

## Topic
[What the presentation is about]

## Audience
[Who, what they know, what they care about]

## Format
[Length, slide estimate, setting]

## Tone
[Chosen tone and what it means for this talk]

## Takeaway
[What the audience walks away with]

## Narrative approach
[How the story flows open to close]

## Implementation framework
[Chosen tech or TBD]

## Slide philosophy
[Four pillars from `skills/_shared/slide-philosophy.md`: one main thought (one plain sentence, no "and"); ≤1 body sentence on the slide besides graphics/labels/titles; visual-first (graphs, pictures, diagrams, screenshots, demos, spatial comparisons); forward motion (default to step reveals; 10–35 s/slide; every slide hints at what comes next)]

## Raw context
[Additional details / constraints from discovery]
```

Present the brief for review. On approval, hand off to `brief-to-presentation-plan`.

---

## Quality bar

- Brief must reflect actual answers, not defaults.
- Recommendations must have reasoning.
- Narrative approach must be tailored to the specific combination — not a generic template.
- Brief must preserve all four pillars from `../_shared/slide-philosophy.md`. The forward-motion pillar (10–35 s/slide, default to reveals, named transitions) is non-optional.
- If answers are contradictory (e.g., lightning talk + deep analytical tone), surface the tension and help resolve it.

---

## Handoff

Once the brief is approved, hand off to **`brief-to-presentation-plan`** to turn it into a presentation plan.
