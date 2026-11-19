---
paths:
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.js"
  - "**/*.jsx"
---

# TypeScript / JavaScript

- Always use strict mode.
- Never use `any`. Write a type guard if needed.
- Avoid type assertions (`as`). Narrow with `typeof`, `instanceof`, `in`, or
  type guards.
- Never use non-null assertions (`!`). Narrow with an `if` guard and throw a
  descriptive error:

```typescript
const val = arr[0];
if (!val) throw new Error("expected val");
```

- No single-letter variable names. Abbreviate only if the full name gets very
  long.
- Don't pass a function directly to an iterator method. Use a separate callback:

```typescript
[1, 2, 3].map((x) => unicorn(x));
```

## Testing

- Prefer real implementations over mocks. Only mock at system boundaries:
  `fetch`, external APIs, modules that can't run in the test env.
- Needing a mock is a signal to refactor (export pure function) rather than
  mock.
- Partial mocks: use `jest.requireActual`, override only the boundary function.
