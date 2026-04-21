# Presentation-Skills UX Regression Hardening

## Goal

Encode concrete UX and design guardrails into the presentation skills so generated decks stop regressing into under-composed layouts, weak chart staging, static animations, cross-slide data drift, and browser-specific failures.

## Scope

Update the shared deck-construction references and the downstream review and stats skills so they all enforce the same failure taxonomy:

- composition imbalance
- text distribution failure
- footer-hugging evidence
- unanchored annotation
- cross-slide data drift
- static or non-replaying motion
- decorative recap filler
- Firefox regressions in HTML decks

## Files

- `skills/presentation-plan-to-deck/references/ux-design-regressions.md`
- `skills/presentation-plan-to-deck/references/deck-hardening-prompt.md`
- `skills/presentation-plan-to-deck/SKILL.md`
- `skills/presentation-plan-to-deck/references/simple-reveal-deck.md`
- `skills/presentation-plan-to-deck/references/html-slide-deck.md`
- `skills/stats-visualization/SKILL.md`
- `skills/deck-review-update/SKILL.md`
- `README.md`
- `AGENTS.md`

## Implementation Notes

- Store plan documents only in `docs/plans/`.
- Treat aspect-ratio complaints as composition failures first when the deck already uses a 16:9 canvas.
- Require related slides to share one incident model when they describe the same event.
- Require custom motion to replay on slide revisit.
- Require QA in Chrome and Firefox for HTML decks.
- Ban recap or journey filler that has no narrative job.

## Verification

- Use `rg` to confirm the new guidance landed in the expected files.
- Run `git diff --check`.
- Confirm the repo docs point future planning work at `docs/plans/`, not `docs/superpowers/plans/`.
