# Human stagecraft QA (canonical)

Single source of truth for the stagecraft QA pass. `presentation-plan-to-deck` and `deck-review-update` both run this exact checklist. Update it here, not in each skill.

A deck is **not complete** until every checklist answer is **no**.

---

## Hard rules

Judge slides as stage objects for a live audience, not as browser screenshots.

- **Honor the four pillars.** See `slide-philosophy.md`. Any pillar violation is a blocking finding.
- **Use the chosen canvas on purpose.** Whether the deck is 16:9 or 9:16, it should feel composed for that stage instead of looking like another document scaled into the frame.
- **One thought at room scale.** The audience should be able to name the slide's main thought from the dominant visual and title alone.
- **No auto-fit look.** Headlines, wordmarks, and hero objects must keep visible breathing room from the slide edges. If a long token or product name starts hugging the edge, split it, resize it, or constrain it to a column.
- **Visuals carry explanation.** If the slide is mostly text, redesign it around a graph, picture, diagram, screenshot, demo frame, or split it.
- **No tiny idea objects.** Ban micro-demos, tiny dots, thin labels, miniature navigation markers, and other subscale elements unless the whole slide is about that object and it is enlarged enough to command attention.
- **Evidence must dominate proof slides.** On chart, diagram, or flamegraph slides, the evidence should be the biggest thing after the headline. Thin lines with tiny annotations are not enough for a live room.
- **Reveal states sync story to proof.** If a step introduces a claim, takeaway, or analysis point, the matching marker, highlight, label, callout, or comparison cue must appear on that same step. Lower captions and bullets cannot outrun the main visual.
- **Forward motion is visible.** Most slides reveal at least one element after the opening state. Static slides exist only when the static composition is the point.
- **Payoff hierarchy is obvious.** The main lesson, delta, or result cannot sit as a muted footer under a giant container. If it is the point, it must be visually dominant.
- **Resulting thoughts are top-layer moments.** A lesson, standard, decision, pattern, principle, or "so what" must either be its own slide or land as a dominant final hero / conclusion overlay above the evidence. Treat small footer lines, italic bridge captions, quiet subtitles, or muted lower notes as failures when they carry the slide's payoff.
- **Evidence-card payoffs use overlays.** When 3–4 statement, principle, or summary cards build to one synthesis, the final reveal dims the cards and places the conclusion above them. See `evidence-to-conclusion-overlay.md`.
- **Overloaded comparison/example slides split by default.** If one slide contains more than one full example pair, more than one teachable mistake, multiple case studies, or more than two large comparison cards, split it into separate slides by default. A bad/good pair counts as one proof object; two bad/good pairs are two slides unless the slide is explicitly a recap/index with label-only cards.
- **Split slides stay atomic.** Each split slide needs one sentence-level thought, one proof object, its own title/subtitle, and a reveal path that can land in 10-35 seconds.
- **No audience-facing scaffolding.** Never leave placeholder URLs, fake QR codes, TODO text, implementation reminders, or backstage instructions on visible slides.
- **No accidental reveal collisions.** As elements enter across steps, they remain readable, keep breathing room, and avoid unintended overlap. If the layout only works before the final fragment appears, redesign or split the slide.
- **Navigation earns its place.** Progress bars, recap grids, act labels, and "you are here" cues clarify the story path; they do not add decorative noise.
- **Style contrast reads as intentional.** If one section is plain, ugly, deadpan, or parody, that should feel authored rather than broken. Preserve intentional ugly. Do not let accidental machine-looking composition leak into polished sections.
- **Custom motion replays on revisit.** Any chart, SVG, or scripted visual must replay when the audience returns to the slide.
- **Firefox is mandatory QA for HTML decks.** A deck is not complete when it only looks right in Chrome.
- **Pace is honest.** The average slide should land in 10–35 s. If many slides need a full minute to read, the thoughts are too big — split them.

---

## Final checklist

- any slide with more than one main thought (fails the one-sentence test, or needs an "and")?
- any slide carrying more than one sentence of body text besides the title, graphics, and labels?
- any text-heavy slide where a graph, picture, diagram, screenshot, demo frame, or spatial comparison would explain it faster?
- any slide whose simple implication, decision, or solution is buried in prose?
- any resulting thought, lesson, standard, decision, pattern, principle, or "so what" treated as a small footer/caption/subtitle instead of a dominant final layer?
- any text hugging the screen edge?
- any object too small to notice from the back row?
- any slide where empty container chrome is larger than the insight?
- any claim, caption, or bullet visible before its matching evidence appears?
- any 3–4 evidence card slide using a bottom takeaway instead of a conclusion overlay?
- any comparison/example slide with more than one full example pair, more than one teachable mistake, multiple case studies, or more than two large comparison cards?
- any split slide missing one sentence-level thought, one proof object, its own title/subtitle, or a 10-35 second reveal path?
- at thumbnail / contact-sheet size, any slide where the speaker would need to tour the audience through separate quadrants?
- any reveal step where late-entering elements collide or become hard to read?
- any static slide where a reveal would have kept the story moving forward?
- any slide whose forward transition to the next slide is unclear?
- any placeholder or dev-only text still visible?
- any slide that feels auto-fitted instead of composed by a human?
- any slide where the complaint sounds like "aspect ratio" but the real problem is empty or badly used canvas?
- any chart, flamegraph, or code panel hugging the footer instead of commanding the stage?
- any related slides where the dates, thresholds, or result numbers do not line up?
- any custom animation that fails to replay when revisiting the slide?
- any slide that behaves differently enough in Firefox to change readability or meaning?
- any missing or unclear runtime requirement that could break delivery?
- any act-level visual language shift that feels accidental instead of intentional?
- any recap / journey slide filled with decorative or empty boxes?
- any slide that would need a full minute or more to read in a live room?

If any answer is **yes**, revise the slide and run the pass again.

---

## Reporting format (for `deck-review-update`)

```markdown
## Human stagecraft QA

- More than one main thought / needs an "and": [yes/no + slide refs]
- More than one body sentence besides graphics/labels/titles: [yes/no + slide refs]
- Text-heavy where a visual would explain faster: [yes/no + slide refs]
- Simple implication / solution buried in prose: [yes/no + slide refs]
- Resulting thought not dominant final layer: [yes/no + slide refs]
- Text hugging the screen edge: [yes/no + slide refs]
- Object too small for the back row: [yes/no + slide refs]
- Empty container chrome larger than the insight: [yes/no + slide refs]
- Claim appears before matching evidence: [yes/no + slide refs]
- Evidence-card payoff uses conclusion overlay: [yes/no/n/a + slide refs]
- Overloaded comparison/example slide should split: [yes/no + slide refs]
- Split slide lacks atomic thought/proof/title/reveal path: [yes/no + slide refs]
- Thumbnail view requires touring separate quadrants: [yes/no + slide refs]
- Reveal collisions or unreadable overlap: [yes/no + slide refs]
- Static slide where a reveal would carry momentum: [yes/no + slide refs]
- Forward transition unclear: [yes/no + slide refs]
- Placeholder or dev-only text still visible: [yes/no + slide refs]
- Auto-fitted instead of human-composed: [yes/no + slide refs]
- Underused / badly balanced canvas (read as "aspect ratio" complaint): [yes/no + slide refs]
- Evidence hugging the footer: [yes/no + slide refs]
- Cross-slide data drift (dates / thresholds / numbers): [yes/no + slide refs]
- Custom animation does not replay: [yes/no + slide refs]
- Firefox readability divergence: [yes/no + slide refs]
- Missing / unclear runtime requirement: [yes/no + notes]
- Accidental act-level style shift: [yes/no + slide refs]
- Decorative / empty recap tiles: [yes/no + slide refs]
- Slide that needs ≥1 minute to read: [yes/no + slide refs]

## Build / Runtime QA

- Planned aspect ratio explicitly supported: [yes/no + notes]
- Run path matches delivery mode: [yes/no + notes]
- Chrome verified: [yes/no + notes]
- Firefox verified: [yes/no + notes]
- Safari required and verified: [yes/no/n/a + notes]
```
