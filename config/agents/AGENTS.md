# Agents.md

- In all interactions and commit messages, be extremely concise and sacrifice
  grammar for the sake of concision.

## Important

- When working with typescript always use strict mode.
- Never use the 'any' type in typescript. Write a type guard function if needed.
- Never commit secrets.
- Keep commit scope limited to one logical change per commit.
- Never delete ANY files without asking first.
- Don't use single letter variable names. Only use abbreviations in variable
  names if the entire variable name becomes very long.
- Quote all shell variables: "$VAR" not $VAR
- When writing code, always favor the simplest thing that could work. Do not
  prematurely optimize or prematurely abstract code.
- don't pass a function directly to an iterator method. use a separate callback
  function:

```typescript
[1, 2, 3].map((x) => unicorn(x));
```

- Avoid type assertions (`as`). Use type narrowing (`typeof`, `instanceof`,
  `in`) or type guards to let TypeScript infer types naturally.
- Never use non-null assertions (`!`). Instead, narrow with an `if` guard and
  throw a descriptive error:

```typescript
const val = arr[0];
if (!val) throw new Error("expected val");
```

## Testing

- Prefer real implementations over mocks. Only mock at system boundaries:
  `fetch`, external APIs, and modules that cannot run in the test environment.
- When a module needs mocking to be testable, that is a signal to refactor it
  (e.g. export the logic as a pure function) rather than add a mock.
- When partial mocking is needed, use `jest.requireActual` to keep the real
  implementation and only override the boundary function.

## Plans

- At the end of each plan, give me a list of unresolved questions to answer, if
  any. Make the questions extremely concise. Sacrifice grammar for the sake of
  concision.
- When you create a plan open the plan in an open editor split so that i can
  review it.
- Don't automatically switch to edit mode. I want to review the plan before
  editing.
