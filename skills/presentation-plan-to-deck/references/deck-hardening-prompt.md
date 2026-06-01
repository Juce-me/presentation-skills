# Deck hardening prompt

Use this prompt when a generated deck technically works but still feels visually wrong.

```text
Treat this as a stagecraft regression pass, not cosmetic polish.

Hard rules:
- Do not blame global aspect ratio until you have ruled out bad slide composition.
- Evidence slides must be dominated by the evidence, not by empty space, labels, or chrome.
- Resulting thoughts must dominate their final state: a lesson, standard, decision, pattern, principle, or "so what" cannot be a footer, caption, subtitle, or quiet bridge line.
- Hook, investigation, fix, and result slides must share one incident model and one set of numbers.
- Correlation labels must anchor to real plotted points with visible markers or leader stems.
- Custom SVG / chart animation must replay on revisit.
- Verify in Chrome and Firefox before calling the deck fixed.
- Recap / journey slides must contain meaningful beats, not decorative filler tiles.

For each failing slide:
1. name the exact failure
2. state the concrete layout / data / animation fix
3. implement the strongest version of that fix
4. verify the result in Chrome and Firefox
```
