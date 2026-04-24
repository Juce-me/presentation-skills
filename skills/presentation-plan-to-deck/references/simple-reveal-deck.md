# Simple Reveal.js deck (default stack)

Companion to **`presentation-plan-to-deck`**. Use this as the **default stack** for new decks unless there is a concrete reason to do something else.

The goal: a deck that works with nothing installed. Open `index.html` in a browser, present.

---

## Stack

| | |
|---|---|
| **Stack** | Reveal.js 5.x from CDN, vanilla HTML / CSS / JS, single `index.html` |
| **Dist** | No build tool, no package manager, no dependencies installed |
| **Run** | Open `index.html` in a browser. That is the whole workflow. |
| **Ship** | Commit the HTML file. Host on any static server (GitHub Pages, Netlify drop, a shared drive) — or just send the file. |

---

## Why this default

- **Nothing to install** — contributors don't need Node, npm, or a build step. Opening the file *is* the dev loop.
- **Nothing to break** — no dependency drift, no lockfile churn, no framework upgrades.
- **Nothing to explain** — any web developer can read the file top to bottom and understand it in 10 minutes.
- **Portable** — attach to an email, drop in Slack, host behind any static server.

The rule: **start here**. Add complexity only when a specific requirement forces it (see "When to upgrade" below).

---

## Minimal skeleton

A complete working deck in one file:

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Deck title</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reset.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reveal.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/theme/black.css" id="theme" />

  <style>
    /* Your tokens + slide styles inline here. Keep it small. */
    :root {
      --accent: #4f8eff;
      --fg: #eaeaea;
      --bg: #0c0d14;
    }
    .reveal h1, .reveal h2 { letter-spacing: -0.02em; }
    .reveal .hero { font-size: clamp(4rem, 12vw, 9rem); font-weight: 900; line-height: 1; }
    .reveal .reason { opacity: 0.6; font-size: 1.1rem; margin-top: 1rem; }
  </style>
</head>
<body>
  <div class="reveal">
    <div class="slides">

      <section>
        <h1>Deck title</h1>
        <p>Subtitle / speaker / date</p>
      </section>

      <section>
        <h2>A point</h2>
        <p class="fragment">First reveal</p>
        <p class="fragment">Second reveal</p>
      </section>

      <section>
        <div class="hero">−81%</div>
        <div>page load time</div>
        <div class="reason">after adding a Redis cache in front of the DB</div>
      </section>

    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reveal.js"></script>
  <script>
    Reveal.initialize({
      hash: true,
      controls: true,
      progress: true,
      transition: 'fade',
    });
  </script>
</body>
</html>
```

That is a working deck. No build. No install. Nothing missing.

---

## Conventions inside this stack

- **One file.** Keep `<style>` and `<script>` inline in `index.html` until there is a real reason to split. Splitting is a cost, not a default.
- **Use Reveal's built-ins** (`.fragment`, `data-auto-animate`, `data-transition`) before writing custom JS. If Reveal does it, use Reveal's version.
- **Pin the major version** (`reveal.js@5`) in CDN URLs so the deck doesn't drift when the CDN rolls forward.
- **Tokens as CSS vars** in `:root`. No stray hex colors scattered through the file.
- **Slide anatomy**: one `<section>` per slide. Vertical stacks via nested `<section>` only when the stack is genuinely hierarchical.
- **Reveal order** uses `.fragment` (and `.fragment.fade-up`, `.fade-in-then-out`, etc.) — match the spoken story.
- **Sync claim and proof on the same fragment.** If a fragment introduces a takeaway, analysis point, or comparison, reveal the matching marker, highlight, label, callout, or visual cue on that same step.
- **Do not let lower copy outrun the visual.** Captions, bullets, and footer panels cannot explain evidence the audience cannot yet see.
- **Design for the final fragment state.** Reserve space for late-entering elements so labels and callouts stay readable and do not collide unless the overlap is an intentional graphic effect.
- **Use conclusion overlays for evidence grids.** When 3-4 statement cards build to one synthesis, reveal the cards first, then use a final fragment that dims the card grid and centers the conclusion above it. Do not put the takeaway as a footer under the grid.

## Evidence-to-conclusion overlay

Use this pattern when a slide has 3-4 cards that should become evidence for a later synthesis:

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

When a slide uses custom JS charts, remount them on slide entry instead of assuming first render is enough:

```js
function mountChartForSlide(slide) {
  const name = slide.dataset.chart;
  const mount = slide.querySelector('[data-chart-mount]');
  if (!name || !mount) return;
  mount.innerHTML = '';
  charts[name](mount, slide.dataset.chartVariant || 'default');
}

Reveal.on('ready', (e) => mountChartForSlide(e.currentSlide));
Reveal.on('slidetransitionend', (e) => mountChartForSlide(e.currentSlide));
```

This is the default pattern when the deck depends on motion to explain the story.

## Browser verification

Do not trust one browser preview.

For HTML decks, run a local static server and verify in both Chrome and Firefox:

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000` in the latest Chrome and the latest Firefox.

Check:

- the slide still feels intentionally composed at full-screen size
- custom SVG / chart animation replays when revisiting the slide
- labels, callouts, and code lines stay readable in both browsers

---

## When to upgrade (and when not to)

Stick with the default unless one of these is true:

| Upgrade | Only when |
|---------|-----------|
| Add a bundler (Vite, esbuild) | You need TypeScript, npm components, or tree-shaking — and the deck is long-lived / frequently edited |
| Split into multiple files | The single file exceeds ~1500 lines **and** multiple people are editing concurrently |
| Switch to Slidev | The deck is code-demo-heavy and benefits from MDX + code runners |
| Switch to Keynote / PowerPoint | The audience / environment requires a native `.pptx` / `.key` file |
| Write a bespoke framework | Never as a starting point. Only if Reveal.js genuinely cannot express what the deck needs, and you have proven that by trying |

Every upgrade earns its complexity or it does not happen.

---

## Anti-patterns

- Installing a framework / build tool for a 10-slide talk.
- Pulling in a CSS library (Tailwind, Bootstrap) when a dozen CSS variables would do.
- Copying a previous deck's giant custom navigation system into a new project "for consistency".
- Splitting into many small files before the deck is big enough to need it.
- Vendoring Reveal.js locally when the CDN is fine (do this only for offline / air-gapped presentations).
- A thin chart parked near the footer under a huge empty field.
- A label that talks about a data point without a visible marker or leader stem.
- A code or chart card centered inside a much larger empty panel with no compositional reason.
- A 3-4 statement card grid with the conclusion parked as a bottom takeaway instead of revealed as an overlay.
- A "journey" grid made of decorative or empty tiles that do not tell the story.
- A chart that animates only on the first visit or only in one browser.

---

## Checklist before adding complexity

- [ ] Is there a concrete requirement the default stack cannot meet?
- [ ] Have I tried solving it with Reveal's built-in features first?
- [ ] Will anyone other than me open this file in the next 12 months? If yes, does the extra complexity pay for the reading cost?
- [ ] Am I adding this because I need it, or because it feels "more professional"?

If the honest answer to the last question is the second one, stop and stay simple.
