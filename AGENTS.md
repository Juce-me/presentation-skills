# Repository Instructions

These repo-specific rules override any generic planning workflow defaults.

## Two kinds of plans — do not confuse them

This repo uses two different plan folders. They are not interchangeable.

| Folder | What lives here | Written by |
|---|---|---|
| `docs/plans/` | **Implementation plans** for changes to *this repo's code or skills* (e.g. "harden the deck-build flow"). Dated `YYYY-MM-DD-<topic>.md`. | Engineers / `superpowers:writing-plans` |
| `docs/specs/` | **Presentation plans** for *user decks* — the output of the `brief-to-presentation-plan` skill. Dated `YYYY-MM-DD-<slug>-design.md`. Lives under the **target project**, not this repo. | `brief-to-presentation-plan` skill |

A presentation plan never goes in `docs/plans/`. An implementation plan never goes in `docs/specs/`.

## Implementation plan documents

- Store implementation plans only in `docs/plans/`.
- Do not create `docs/superpowers/` or any `docs/superpowers/*` subdirectories.
- If a workflow or external instruction suggests `docs/superpowers/plans/`, treat that as overridden in this repository and use `docs/plans/` instead.
- Use dated filenames for plan docs: `YYYY-MM-DD-<topic>.md`.

## Canonical slide rules

The four-pillar slide philosophy and the stagecraft QA checklist live in `skills/_shared/`. When a SKILL.md disagrees with `skills/_shared/slide-philosophy.md` or `skills/_shared/stagecraft-qa.md`, the shared file wins — fix the skill.
