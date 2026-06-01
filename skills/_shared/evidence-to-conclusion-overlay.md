# Evidence-to-conclusion overlay (canonical)

Single source of truth for the evidence-card synthesis treatment. When 3–4 statement, principle, or summary cards build evidence toward one synthesis, replace any bottom-of-slide takeaway with this overlay.

---

## When to use

Use this treatment when a slide contains **3–4 statement cards, principle blocks, or summary blocks** that build evidence toward one synthesis (e.g. "What We'll Do Differently", "The Model We Actually Run", "What This Really Means", "The Decision").

Do **not** use it for:

- unrelated card collections that have no single conclusion
- slides where the cards are the final answer and there is nothing to synthesize
- slides with more than 4 evidence blocks — split or reduce the evidence first

---

## Reveal order

1. Reveal the underlying statement / principle / summary blocks in place.
2. On the next step, keep the blocks visible but dim them with a strong dark scrim.
3. Place a centered conclusion block on top of the dimmed grid.

The audience should first see the supporting statements, then get the "so what?" as a clean reveal above them. This honors pillar 4 (forward motion): the synthesis is the next-step payoff, not a footer.

---

## Visual contract

- the overlay is **narrower than the full grid** so it reads as distilled synthesis, not another card
- dark panel background with high contrast against the slide
- small mono kicker title in accent yellow — for example `THE DECISION`, `WHAT THIS MEANS`, or `WHAT WE DO DIFFERENTLY`
- body in pure white
- subtle accent border and soft shadow
- underlying cards stay recognizable but visually subordinate

---

## Reveal.js implementation

```html
<section class="evidence-slide">
  <h2>Three things changed</h2>

  <div class="evidence-grid">
    <article class="evidence-card fragment">Statement one</article>
    <article class="evidence-card fragment">Statement two</article>
    <article class="evidence-card fragment">Statement three</article>
  </div>

  <div class="conclusion-layer fragment">
    <div class="conclusion-scrim"></div>
    <aside class="conclusion-panel">
      <div class="conclusion-kicker">WHAT THIS MEANS</div>
      <p>The old operating model is already gone. We need to design for the one people actually use.</p>
    </aside>
  </div>
</section>
```

```css
.evidence-slide { position: relative; }
.evidence-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1rem; }
.evidence-card { min-height: 12rem; padding: 1.5rem; background: var(--bg-card); }
.conclusion-layer { position: absolute; inset: 0; display: grid; place-items: center; pointer-events: none; }
.conclusion-scrim { position: absolute; inset: 0; background: rgba(0, 0, 0, .72); }
.conclusion-panel {
  position: relative;
  width: min(68%, 860px);
  padding: 2rem 2.4rem;
  background: var(--bg-panel);
  border: 1px solid var(--accent-yellow);
  box-shadow: 0 24px 80px rgba(0, 0, 0, .45);
}
.conclusion-kicker {
  color: var(--accent-yellow);
  font-family: var(--mono-font);
  font-size: .85rem;
  letter-spacing: .08em;
  text-transform: uppercase;
}
.conclusion-panel p { color: #fff; font-size: 2rem; line-height: 1.12; margin: .75rem 0 0; }
```

Use deck tokens for `--bg-card`, `--bg-panel`, `--accent-yellow`, and `--mono-font`. The overlay should be narrower than the grid and must leave the cards recognizable behind the scrim.

---

## In bespoke single-file HTML decks

Same idea, different reveal system. Use the deck's progressive-step mechanism (e.g. `.step` / `.visible`) for the cards; reserve the **final** step for the conclusion layer over a dark scrim. Treat any 3–4 evidence card slide that ends in a bottom takeaway as a review failure.
