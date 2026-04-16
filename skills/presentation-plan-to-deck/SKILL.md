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

If the project uses a single-file HTML deck, also read [references/html-slide-deck.md](references/html-slide-deck.md) and the project maintainer documentation.

---

## Inputs

Expected input:

- approved presentation plan
- slide intents or section flow
- optional branding, examples, constraints, or design system references

If the plan is weak or incomplete, stop and send it back to **`brief-to-presentation-plan`** rather than improvising a deck on shaky foundations.

---

## Workflow

1. **Translate plan to slide units**
   Default rule: one slide, one main idea.

2. **Assign each slide a job**
   For every slide, define:
   - title
   - purpose
   - key message
   - evidence or examples
   - transition to the next slide

3. **Choose composition**
   Decide whether the slide is best expressed as:
   - title + statement
   - comparison
   - diagram
   - process flow
   - hierarchy
   - phased sequence
   - summary / takeaway

4. **Specify reveal order**
   Reveals and animation should match the spoken story:
   - premise before punchline
   - framework before detail
   - tension before resolution

5. **Design for presentation readability**
   Prefer large readable text, strong contrast, and clean visual hierarchy. Avoid website-density slides.

6. **Produce implementation-ready deck content**
   The output can be:
   - slide-by-slide deck spec
   - draft slide copy
   - HTML deck changes
   - instructions for another deck tool

---

## Slide spec template

Use this format when building or handing off the deck:

```markdown
## Slide N — [Title]

- Purpose: [what this slide must achieve]
- Audience takeaway: [what they should leave with]
- Content:
  - [point]
  - [point]
- Layout: [diagram / 2-column / sequence / card grid / hero]
- Reveal / animation order:
  1. [first element]
  2. [second element]
- Transition forward: [why the next slide follows]
```

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

- Every slide must trace back to the approved plan.
- Layout and animation must reinforce meaning, not decorate it.
- If a slide feels crowded, split it instead of shrinking everything.
- The opening must establish context quickly.
- The ending must land on a takeaway, action, or decision, not just stop.

---

## Single-file HTML decks

For one-file HTML slide decks with inline CSS and JS:

- read [references/html-slide-deck.md](references/html-slide-deck.md)
- follow the owning repo's maintainer doc for tokens, components, and scripts
- keep reveal logic aligned with the story order

---

## Handoff

After a deck exists, use **`deck-review-update`** to review the story, pacing, and improvement opportunities.
