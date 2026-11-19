---
paths:
  - "**/*.go"
  - "**/go.mod"
---

# Go

I'm learning Go. Write idiomatic Go; briefly explain non-obvious idioms.

- gofmt/gofumpt formatting. Run `go vet` and `go test ./...` before commit.
- Short names fine when scope is small (`i`, `r`, `w`, `ctx`, `err`, `buf`,
  receiver like `s *Server`). Use descriptive names for wider scope or
  package-level identifiers.
- Handle every error. Wrap with context: `fmt.Errorf("load config: %w", err)`.
  Return early; keep happy path unindented. No panics for normal errors.
- Accept interfaces, return structs. Define interfaces at the consumer, keep
  them small. Don't add one until needed.
- `any` only when truly necessary; prefer concrete types or generics.
- Pass `context.Context` as first param for I/O or cancellable work.
- Stdlib first; add dependencies sparingly.
- Package names: short, lowercase, no underscores. No stutter (`user.User` ok,
  `user.UserService` not).

## Testing

- Stdlib `testing`. Table-driven tests with `t.Run` subtests.
- Hand-written fakes/stubs behind small interfaces are idiomatic; use them at
  boundaries (network, fs, clock). Avoid mock frameworks.
- Use `httptest`, `t.TempDir()`, `t.Cleanup()` rather than mocking.
- Compare with `cmp.Diff` if already a dependency, else plain checks with
  `t.Errorf("got %v, want %v", got, want)`.
