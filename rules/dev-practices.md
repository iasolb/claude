# Dev practices

- No Postman, ever, on any project. For exploring or testing an API, use
  curl, httpie, or a quick script/REPL snippet instead. If a request
  collection needs to persist, put it in a checked-in `.http` file, a shell
  script, or a markdown catalog of curl commands, not a Postman export.
- Strict linting/type-checking (pyright/mypy strict or equivalent) is the
  default assumption. Treat deliberate-looking strict-typing patterns as
  deliberate, not noise: `_ = call()` to mark a discarded return value,
  explicit `-> None` returns, `cast()`, `Any` only where a dynamic boundary
  genuinely requires it. Don't suggest loosening or dropping these as cleanup.
