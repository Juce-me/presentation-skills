---
name: brief-to-presentation-plan
description: >-
  Converts a brief, notes, transcript, document, or mixed source material into
  a presentation plan. Use when the input is messy or incomplete and you need
  to extract audience, goal, theme, narrative arc, section flow, and slide
  intent before building a deck.
---

# Brief to presentation plan

Use this skill when the user provides source material and wants a presentation created from it. The job here is to turn raw input into a clear plan, not to design slide layouts yet.

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
   Default arc:
   - setup
   - orientation
   - development
   - complication
   - resolution
   - landing

7. **Create the presentation plan**
   Produce:
   - presentation goal
   - primary audience
   - through-line
   - key tensions or tradeoffs
   - section-by-section flow
   - slide-by-slide intent
   - open questions / evidence gaps

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
1. Setup
2. Orientation
3. Development
4. Complication
5. Resolution
6. Landing

## Deck structure
1. [Section name]: [purpose]
2. [Section name]: [purpose]

## Slide intents
1. [Slide title] — [job this slide does]
2. [Slide title] — [job this slide does]

## Gaps / questions
- [Missing evidence, unclear claim, unresolved choice]
```

---

## Quality bar

- The plan must be driven by audience and outcome, not by source-document order.
- Cut repetition from the source instead of preserving it.
- Surface weak claims explicitly rather than smoothing them over.
- If the source does not support a strong presentation yet, say so and list what is missing.

---

## Handoff

Once the plan is approved, hand off to **`presentation-plan-to-deck`** to build the actual deck.
