# Single-file HTML slide deck (implementation reference)

Companion to **`presentation-plan-to-deck`**. Use when building or editing a **one HTML file** deck (inline CSS + JS). Replace example tokens, section names, and domain rules with whatever matches **your** deck; keep the structural patterns (two reveal systems, `SECTIONS`, slide anatomy).

Authoritative detail for a given repo should live in that repo’s maintainer doc (`CLAUDE.md`, `AGENTS.md`, or similar).

**Preview:** open your deck HTML in a browser; refresh after edits.

**Viewport (example):** ~1440 × 900 px (16:9). Content column `max-width: 860px`; side media may extend beyond.

---

## File shape

- **Implementation:** one HTML file — `<style>`, `<body>` with `<section>` slides, `<script>` for nav and reveal.
- **Full reference:** maintainer doc in the repo that owns the HTML file.

---

## Design tokens (example — use variables)

```
--okr-color: #4f8eff       OKR theory (blue)
--jira-color: #00d4ff      Jira / hierarchy (cyan)
--jira-objective-color: #2684ff  Jira Objective issue type
--plan-color: #a855f7      planning / process (purple)
--ic-color: #22c55e        IC / execution (green)
--pm-color: #f97316        Product Manager (orange)
--em-color: #eab308        EM / EMG (yellow)
--accent-teal: #14b8a6     sub-tasks
--accent-red: #ef4444      anti-patterns / errors
--bg-card: #10111a         card surface
--bg-elevated: #181a28     hover / elevated
```

One-off `rgba(..., .08)` tints are acceptable. Avoid stray hex elsewhere.

---

## Two animation systems

| System | Classes | Use for |
|--------|---------|---------|
| One-shot scroll reveal | `.rv` / `.vis` (+ `.d1`–`.d4`) | Tag, title, subtitle, main block on slide enter |
| Progressive steps | `.step` / `.visible` | Cards, rows, chains; register in step-config |

Connectors after a step: `.step.visible + .connector-class { opacity: 1; }` — list connector classes in your maintainer doc.

Both systems must honor the four pillars in [`../../_shared/slide-philosophy.md`](../../_shared/slide-philosophy.md): one thought (one plain sentence, no "and"), ≤1 body sentence besides graphics/labels/titles, visual-first, forward motion. Reveal sync is non-negotiable — never let a `.step`, caption, or lower panel name evidence the audience cannot yet see.

If a late `.step` or bridge line carries the resulting thought — the lesson, standard, decision, pattern, principle, or "so what" — it must become a dominant final payoff layer: a hero statement or conclusion overlay above the evidence. Do not use `.rv.d4`, a footer, an italic caption, or a quiet subtitle for the payoff.

Design each slide for its densest visible state, not just the opening frame. Late-entering labels, badges, and callouts need reserved space so they remain readable and do not collide unless overlap is a deliberate visual treatment.

For 3–4 statement / principle / summary cards that build toward one synthesis, use the canonical evidence-to-conclusion overlay (see [`../../_shared/evidence-to-conclusion-overlay.md`](../../_shared/evidence-to-conclusion-overlay.md)) implemented via the deck's progressive-step mechanism. Bottom-of-slide takeaways under those grids are a review failure.

---

## Slide anatomy

```html
<section id="sN">
  <div class="tag rv" style="color:var(--X-color);">TOPIC TAG</div>
  <div class="stitle rv d1">Slide Title</div>
  <div class="sdesc rv d2">Non-empty one-liner subtitle.</div>
  <!-- .rv.d3 wrapper and/or .step items -->
</section>
```

---

## SECTIONS array (example — verify in your file)

```js
{ name: 'OKR Principles',  abbr: 'OKR',  slides: ['s1','s2',...,'s7'] },
{ name: 'Jira & Planning', abbr: 'JIRA', slides: ['s8',...,'s11','s11b','s12'] },
{ name: 'Execution & ICs', abbr: 'EXEC', slides: ['s13',...,'s17'] },
```

`body` classes `sec-0` / `sec-1` / `sec-2` — keep slide lists exhaustive and non-overlapping.

---

## Key components (abbreviated)

| Component | Class roots | Notes |
|-----------|-------------|--------|
| Hierarchy tower | `.hierarchy` / `.h-level` | Indent +20px per depth |
| Definition blocks | `.def-block` | `.def-media-row` when image left of block |
| Race track | `.race-track` / `.race-checkpoint` | `.race-connector` as steps |
| Cascade chain | `.vmap-col` / `.chain-step` | Tech vs Product |
| Cards | `.sum-card`, `.expect-card`, `.phase-card` | Icons ≥3–4rem, titles ≥1.5rem |
| Conclusion overlay | `.conclusion-scrim` / `.conclusion-panel` | Final step over a 3-4 card evidence grid; dark scrim, accent-yellow mono kicker, white body |
| PRD anatomy | `.prd-anatomy` / `.prd-row` | `.prd-arrow` between rows |

**Sizing:** Presentation-scale type; body on cards ≥`1.1rem`. Prefer centered vertical layout.

---

## Example domain rules (swap for your topic)

Illustrative rules from one planning deck; do not treat as universal.

- **Two roadmaps:** Tech (`--em-color`) vs Product (`--pm-color`) — do not collapse on hierarchy/cascade slides.
- **Jira Objective:** `--jira-objective-color` at Objective level; ownership badges separate.
- **“OKR planning”** in a given org = quarterly output planning; acknowledge gap vs classic outcome OKRs where relevant.
- **Hypothesis ≠ hallucination.**
- **Story size:** “up to 2 Story Points”. **Sub-task** not “Sub-task / Commit”.

---

## Example narrative arc (same sample deck)

Definition → flow/negotiation → Jira mapping → local reality vs theory → planning mechanics → IC perspective → summary/Q&A.

---

## Adding or renumbering slides

1. Add `<section id="sN">` with standard anatomy.
2. Update `SECTIONS` for the correct group.
3. Add `{ id: 'sN', sel: '.selector' }` to step-config if using `.step`.
4. Set nav counter `01 / N`.

Renumber **highest to lowest**: IDs, comments, `SECTIONS`, step-config, promotion `forEach`, counter.

---

## Pre-change checklist (implementation)

Run the canonical [`../../_shared/stagecraft-qa.md`](../../_shared/stagecraft-qa.md) for slide-level QA. Implementation-specific items only:

- [ ] CSS variables — no stray hex
- [ ] `.sdesc` non-empty on every slide touched
- [ ] New `.step` items in step-config; connectors use `.step.visible +`
- [ ] Card icons ≥3rem, titles ≥1.5rem
- [ ] Two-roadmap distinction where applicable
- [ ] Slide counter matches count; `SECTIONS` complete and disjoint
- [ ] Any custom SVG / JS animation replays on slide revisit, not only first load
- [ ] Critical slides verified in Chrome and Firefox

For SVG, cascade/Venn, and full CSS, use your deck repository’s maintainer documentation.
