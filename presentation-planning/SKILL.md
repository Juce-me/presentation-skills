---
name: presentation-planning
description: >-
  Plans talks and slide decks before implementation: theme, audience, narrative
  arc, composition, pacing, and progressive disclosure. Use when outlining a
  presentation, aligning content with listeners, or sequencing story beats.
  Optional: references/html-slide-deck.md for single-file HTML deck mechanics
  alongside the project’s maintainer doc (e.g. CLAUDE.md or AGENTS.md).
---

# Presentation planning

Use this skill **before** you lock slide layout, tooling, or visuals. First decide what the room needs to believe, feel, and do; then implement in Keynote, HTML, PDF, or whatever medium fits.

**Optional — single-file HTML deck in the workspace:** if you maintain a one-file slide HTML, see [references/html-slide-deck.md](references/html-slide-deck.md) plus that project’s maintainer documentation for tokens, components, and scripts.

---

## Workflow order

1. **Frame** — theme, audience, outcome (sections 1–2).
2. **Outline** — story beats and section flow (sections 3–4).
3. **Build** — chosen medium; for the HTML pattern in this repo’s reference, follow that doc.

Do not commit to layout or step-by-step reveals until the outline answers the framing questions.

---

## 1. Theme and critical thinking

**Through-line (one sentence).** What is the single idea the audience should retain after the room clears? Every slide or segment should advance that line. Cut or merge content that is only “interesting.”

**Stakes.** Why should listeners care *now*? Tie the theme to decisions they make, risks they own, or time they save. Name the cost of misunderstanding.

**Scope boundary.** State what the session is *not* about so scope and Q&A stay fenced.

**Contrasts and tensions.** Surface real tradeoffs (theory vs practice, two owners, precision vs speed) and resolve them with an operational rule. Avoid generic “best practices” with no bite.

**Terminology contract.** Define loaded terms once, then use them consistently. If org language differs from textbook usage, say so early.

---

## 2. Audience (listeners)

| Question | Why it matters |
|----------|----------------|
| **Who is in the room?** (roles, seniority) | Depth, jargon, examples |
| **What do they already believe?** | Order of arguments; address skepticism without preaching |
| **What must they do differently after?** | Shapes the close: decision, habit, or shared vocabulary |
| **Attention budget** | Density, repetition of the through-line, number of beats |
| **Likely Q&A challenges** | Whether you need an explicit “reality check” beat |

**Rule:** Prefer one primary audience per major block. If levels are mixed, signal shifts (“next: for ICs”) or use parallel tracks instead of one blended story.

---

## 3. Composition: how the session is structured

**Opening.** Title + promise: what they will understand and what problem it solves.

**Conceptual scaffold.** Teach the model before tooling and exceptions.

**Process in motion.** Negotiation, sequencing, handoffs — after static definitions. Any stepwise reveal should follow the order you want internalized.

**Structure / system view.** Map abstractions to artifacts (systems, tools, org layers). Diagrams belong here.

**Reality check.** Ideal vs local practice — before deep mechanics — so later content is not dismissed as naive.

**Mechanics and playbooks.** Procedures, sizing rules, checklists — after “why” and “what shape.”

**Role lens.** “What I do Monday” once the shared model exists.

**Close.** Recap tied to the through-line, explicit next step or Q&A frame.

---

## 4. Narrative arc and content buildup

Story beats, not slide count:

1. **Setup** — context and promise.
2. **Orientation** — shared language and mental model.
3. **Development** — layered complexity; each layer answers “so what?” for the primary audience.
4. **Complication** — where reality diverges; name the gap.
5. **Resolution** — rules of thumb and boundaries.
6. **Landing** — summary, action, space for questions.

**Progressive disclosure:** spoken order matches visual order — do not show the punchline before the premise.

**Pacing:** One main idea per unit. If there are two ideas, split or use progressive disclosure.

**Trilogies:** consecutive segments can share a topic label so listeners recognize a multi-part argument.

---

## Pre-outline checklist

- [ ] Through-line is one sentence; every planned beat serves it
- [ ] Primary audience and “what changes after” are explicit
- [ ] Arc runs setup → model → complexity → reality check → mechanics → role lens → close (adapt as needed)

---

## Implementation elsewhere

| Medium | Follow |
|--------|--------|
| Single-file HTML slide deck (pattern in this repo) | [references/html-slide-deck.md](references/html-slide-deck.md) + your project maintainer doc |
| Other | Project conventions; keep this skill’s framing sections as the default |
