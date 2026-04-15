# OKR–Jira single-file HTML slide deck

Companion to **`presentation-authoring`** when editing the deck in `okr-jira-planning.html`. Authoritative technical detail lives in the deck repository’s **`CLAUDE.md`**.

**Preview:** open `okr-jira-planning.html` in a browser; refresh after edits.

**Viewport:** ~1440 × 900 px (16:9). Content column `max-width: 860px`; side media may extend beyond.

---

## File and docs

- **Implementation:** one HTML file — `<style>`, `<body>` sections, `<script>` for nav and reveal.
- **Full reference:** `CLAUDE.md` in the same repo (components, `IntersectionObserver`, `syncCascade`, renumbering).

---

## Design tokens (always variables)

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

Connectors after a step: `.step.visible + .connector-class { opacity: 1; }` — see `CLAUDE.md` for class names.

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

## SECTIONS array (example — verify in repo)

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
| PRD anatomy | `.prd-anatomy` / `.prd-row` | `.prd-arrow` between rows |

**Sizing:** Presentation-scale type; body on cards ≥`1.1rem`. Prefer centered vertical layout.

---

## Domain content rules (this deck)

- **Two roadmaps:** Tech (`--em-color`) vs Product (`--pm-color`) — do not collapse on hierarchy/cascade slides.
- **Jira Objective:** `--jira-objective-color` at Objective level; ownership badges separate.
- **“OKR planning”** at Bidswitch = quarterly output planning; acknowledge gap vs classic outcome OKRs where relevant.
- **Hypothesis ≠ hallucination.**
- **Story size:** “up to 2 Story Points”. **Sub-task** not “Sub-task / Commit”.

---

## Example narrative arc (this deck)

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

- [ ] CSS variables — no stray hex
- [ ] `.sdesc` non-empty on every slide touched
- [ ] New `.step` items in step-config; connectors use `.step.visible +`
- [ ] Card icons ≥3rem, titles ≥1.5rem
- [ ] Two-roadmap distinction where applicable
- [ ] Slide counter matches count; `SECTIONS` complete and disjoint

For SVG, cascade/Venn, and full CSS, use **`CLAUDE.md`** in the deck repo.
