# Agents.md

Language-neutral global rules. Language-specific rules live in `rules/`
(symlinked to `~/.claude/rules`, path-scoped by file glob).

- In all interactions and commit messages, be extremely concise and sacrifice
  grammar for the sake of concision.

## Important

- Never commit secrets.
- Keep commit scope limited to one logical change per commit.
- Never delete ANY files without asking first.
- Quote all shell variables: "$VAR" not $VAR
- Favor the simplest thing that could work. Don't prematurely optimize or
  abstract.
- Follow the idioms and conventions of the language at hand. Language rules in
  `rules/` override these defaults.
- Prefer real implementations over mocks unless a language rule says otherwise.

## Plans

- At the end of each plan, give me a list of unresolved questions to answer, if
  any. Make the questions extremely concise. Sacrifice grammar for the sake of
  concision.
- When you create a plan open the plan in an open editor split so that i can
  review it.
- Don't automatically switch to edit mode. I want to review the plan before
  editing.
