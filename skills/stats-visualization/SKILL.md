---
name: stats-visualization
description: >-
  Turns numeric results, improvements, and comparisons into bold visual
  treatments instead of inline prose. Use on any slide that contains a number
  representing a result, change, gain, loss, target, or benchmark — bars,
  gauges, hero numbers, before/after panels, delta callouts, with a reason
  label explaining why the number moved.
---

# Stats visualization

Use this skill whenever a slide contains a number that represents a **result, improvement, change, target, or comparison**. The rule: numbers that carry meaning deserve visual weight — never drop them as inline prose.

**Skip when:** the number is incidental context ("founded in 2014", "Q3 2025") and is not the point of the slide.

---

## Core principle

> **If the number is the story, the number must be bigger than the sentence around it.**

The audience should *feel* the change before they parse it. A bar that is 5× longer than another bar communicates in 200 ms what "340 ms → 65 ms" takes 2 seconds to read.

Two things must be visible, always:

1. **The delta** — how much it changed, ideally as both absolute and relative (`−275 ms`, `−81%`).
2. **The reason** — one short label saying *why* it moved (e.g., "added cache", "parallelized calls", "switched to native query"). A visualization without a reason is trivia.

If the slide reveals in steps, the claim and the proof arrive together. A delta badge, reason label, or takeaway line cannot appear before the bar, marker, highlight, or comparison cue that makes it legible.

---

## Anti-patterns — reject these on sight

| Anti-pattern | Example | Fix |
|--------------|---------|-----|
| Inline comparison in prose | "Reduced from 340 ms to 65 ms" | Before/after bars + delta badge |
| Table of raw numbers | "\| Before \| After \|<br>\| 340 ms \| 65 ms \|" | Hero number + reason label, or bars |
| Percentage without anchor | "81% faster" | "340 ms → 65 ms (−81%)" with bars |
| Delta without reason | "−81%" alone | Add the cause: "−81% after adding cache" |
| Tiny chart with dense axis labels | 200px chart with 6 gridlines | Big number + one supporting mini-bar |
| Multiple KPIs competing on one slide | 4 metrics, same weight | One hero number per slide; secondary metrics as thin strip |
| Footer-hugging line chart | Hero stat at top, tiny line chart near bottom edge | Make the chart the dominant proof object or split the slide |
| Unanchored correlation label | "deployed here" text floating near a curve | Add a vertical marker / leader stem anchored to the exact event point |
| Result slide with weak proof | Big result number plus a nearly flat visual | Increase chart height / range until the audience can feel the change |

---

## Pattern library

Pick one pattern per slide. Do not stack patterns on a single slide.

### 1. Hero number

One massive number dominates the slide. Everything else is supporting text.

**Use when:** a single headline result ("we cut latency by 81%") is the entire point.

```html
<div class="hero-stat">
  <div class="hero-stat__value">−81%</div>
  <div class="hero-stat__label">page load time</div>
  <div class="hero-stat__reason">after adding a Redis cache in front of the DB</div>
</div>

<style>
  .hero-stat__value  { font-size: clamp(6rem, 18vw, 12rem); font-weight: 900; line-height: 1; letter-spacing: -0.04em; }
  .hero-stat__label  { font-size: 1.75rem; opacity: 0.8; margin-top: 0.5rem; }
  .hero-stat__reason { font-size: 1.25rem; opacity: 0.6; margin-top: 1rem; max-width: 40ch; }
</style>
```

### 2. Before / after panels

Two stacked or side-by-side blocks, with strong visual contrast between them. The "after" side carries more weight (larger, bolder, colored).

**Use when:** the audience needs to hold the old state in mind to feel the new state.

```html
<div class="ba">
  <div class="ba__before">
    <div class="ba__num">340 ms</div>
    <div class="ba__lbl">before</div>
  </div>
  <div class="ba__arrow">→</div>
  <div class="ba__after">
    <div class="ba__num">65 ms</div>
    <div class="ba__lbl">after</div>
  </div>
</div>
<div class="ba__reason">cache hit rate went from 0% to 94%</div>
```

Rule: the "after" number should be at least 1.3× the type size of the "before" number. Size carries the message before color does.

### 3. Bar comparison

Two horizontal bars, length proportional to value. Label inside or beside each bar.

**Use when:** the ratio between values is the point, or when there are 3–5 values to compare.

```html
<div class="bars">
  <div class="bar bar--old" style="width: 100%"><span>340 ms — before</span></div>
  <div class="bar bar--new" style="width: 19%"><span>65 ms — after</span></div>
</div>
```

- Always normalize against the largest value — bars should max out the slide width.
- Animate on reveal: bars grow from 0 to their width over ~600 ms, ease-out.
- Show the delta as a separate badge beneath the bars: `−275 ms (−81%)`.

### 4. Gauge / progress

A gauge (arc or linear) showing progress toward a target.

**Use when:** the number is a percentage of a known maximum ("68% of our error budget"), or progress toward a goal ("payroll 72% complete").

Keep the gauge big — minimum 40% of slide height. Annotate the target tick, not just the current value.

### 5. Delta callout

A single number plus a colored arrow/badge showing direction and magnitude.

**Use when:** the "before" value is not interesting on its own, only the change.

```
  ▲ +42%     — signups after redesign
  ▼ −81%     — p95 latency after cache
  ◆ ±0%      — error rate (unchanged, which is the point)
```

Color rules: green = better (regardless of sign), red = worse, neutral = no change. Direction of the metric matters — a rise in error rate is red, a rise in conversion is green.

### 6. Annotated change chart

A line or bar chart with a **labeled vertical marker** at the moment the change happened, with the reason written on the marker.

**Use when:** the slide needs to prove causality — "the graph dropped *exactly* when we shipped the fix".

```
    latency (ms)
  400 ┤ ▁▂▃▃▂▃▂▃▂ ┃ ← "cache deployed"
  300 ┤           ┃
  200 ┤           ┃
  100 ┤           ┃▁▂▂▁▂▁▂▁
    0 └───────────┃────────
           Mon     Wed       Fri
```

The marker + label is the thing that makes the chart a story instead of a scatter plot.

Hard rules for this pattern:

- the chart should occupy enough vertical space that the change is visible from the back row
- the event marker must be visually anchored to the exact point or x-position it explains
- if the slide also contains a hero number, the chart still needs enough size to read as proof rather than decoration
- revisit behavior matters: the marker and chart motion must replay when the audience returns to the slide

---

## Reveal order

Numbers carry more punch when revealed in the right order:

1. Show the **old value** first (audience orients).
2. Reveal the **new value** (tension → release).
3. Reveal the **delta badge** (makes the change legible).
4. Reveal the **reason label** last (lands the *why*).

For a hero number, reverse it: delta first (huge, center), then reason (smaller, below).

For any stepwise build, pair each narrative move with its matching evidence on the same step. If the script says "this is where the curve breaks," that step must reveal the vertical marker, highlighted segment, or comparison cue immediately. Do not let a caption, bullet, or lower panel get ahead of the chart.

Use ~400–700 ms ease-out transitions. Bars should grow, not snap. Numbers can count up with `Intl.NumberFormat` over ~800 ms for extra impact on high-value slides — but use sparingly, once per deck at most.
Reserve space for late-entering markers, badges, and labels. If the final state crowds the chart or creates accidental overlap, simplify the layout or split the slide.

---

## Choosing the right pattern

| If the slide's job is... | Use |
|--------------------------|-----|
| Announce a headline result | Hero number |
| Show transformation from a known state | Before / after |
| Compare 2–5 values by scale | Bar comparison |
| Show progress toward a target | Gauge |
| Emphasize change without dwelling on old value | Delta callout |
| Prove a change caused an effect | Annotated change chart |

If none fits cleanly, the slide is probably trying to make more than one point — split it.

---

## Quality bar

- Numbers that represent results are **never** inline prose. If you catch `X ms vs Y ms` in a sentence, it is a bug.
- Every visualization names its reason. No orphan percentages.
- Every revealed claim lands with visible proof on the same step. No numeric caption or takeaway before the audience can see the marker, bar, highlight, or comparison that supports it.
- One hero metric per slide. Secondary metrics get lower visual weight or a separate slide.
- Units are always visible (`ms`, `%`, `requests/s`, `$`, `users`). No bare "340".
- Scale is honest. Truncated Y-axes are banned unless the truncation is annotated.
- Direction-of-good is consistent within the deck (e.g., up = better in every chart, or down = better — pick one per metric and stick to it).
- Late-entering labels, callouts, and badges stay readable and non-colliding unless overlap is a deliberate visual effect.
- For incident / diagnosis / result sequences, the same metric and event timeline must be preserved across slides.
- Annotated charts are not complete until the marker, label, and motion still work in Firefox.

---

## When applying this skill

- During **`presentation-plan-to-deck`**: every slide whose intent mentions a number, result, improvement, or comparison must be assigned one of the patterns above.
- During **`deck-review-update`**: scan all slides for inline numeric prose and replace with a pattern. Treat this as a structural issue, not a polish issue.

---

## Handoff

When done, the deck should pass a simple test: **read every numeric slide title + delta out loud with the rest of the slide covered**. If the audience could grasp the point from that alone, the visualization is doing its job.
