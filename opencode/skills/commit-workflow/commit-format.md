# Commit Format Reference

All commit messages MUST follow
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):

```text
<type>: <description>

[optional body]

[optional footer]
```

## Types

| Type       | Use For          | Example                              |
| ---------- | ---------------- | ------------------------------------ |
| `feat`     | New feature      | `feat: add pressure conversion`      |
| `fix`      | Bug fix          | `fix: resolve crash in init`         |
| `refactor` | Code refactoring | `refactor: simplify user validation` |
| `docs`     | Documentation    | `docs: update API documentation`     |
| `test`     | Tests            | `test: add state transition tests`   |
| `chore`    | Build/tooling    | `chore: update gradle dependencies`  |

## Rules

1. **Lowercase** for type and description
2. **Subject line** under 50 characters (hard limit: 72)
3. **Body lines** under 80 characters (wrap long lines)
4. **Use present tense**: "add feature" not "added feature"
5. **Include reference**: use `Refs:` or `Closes:` keywords in footer
6. **Breaking changes**: append `!` to the type and add `BREAKING CHANGE:` in
   footer

## Body

For `fix` commits: first paragraph states the root cause, second paragraph
explains how this commit resolves it.

For all other types: a short, minimal description of what changed and why.

## Examples

Subject only:

```text
feat: add new pressure conversion methods
fix: crash when incorrect vehicle speed received
refactor: simplify detekt code quality violations
docs: add safety lifecycle section
test: add rear view integration tests
chore: bump rust toolchain to 1.92.0
```

Fix with body:

```text
fix: plantuml rendering errors

PlantUML rendering issues were caused by an outdated version bundled in the
Docker image.

Update the Docker image used by the build-book job to use a recent PlantUML
version, resolving the rendering issues.
```

Feat with body:

```text
feat: generate requirements at build time

Leverage minijinja-cli to generate the requirements documentation at build
time.
```

Breaking change:

```text
feat!: remove support for camera v1 API

BREAKING CHANGE: deprecated camera v1 API has been removed.
```

Footer references:

```text
Refs: #123
Closes: #123
Refs: 676104e, a215868
```
