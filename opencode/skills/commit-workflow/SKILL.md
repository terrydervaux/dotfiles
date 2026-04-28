---
name: commit-workflow
description: Standard commit message convention and workflow that must be followed
license: MIT
compatibility: opencode
---

## When to use me

Use this when you are ready to commit changes and want a consistent,
conventional commit message.

## The Golden Rule

Agents MUST NEVER create commits unless the user explicitly requests it.

## Authorization

**AUTHORIZED** — explicit commit permission:

```text
"commit"
"go ahead and commit"
"commit it"
"make the commit"
"yes, commit" (when asked about committing)
```

**NOT AUTHORIZED** — do not commit:

```text
"go ahead"                    # Too vague, doesn't mention commit
"fix this issue"              # Only authorizes making changes
"that looks good"             # Just approval of changes
"yes" or "okay"               # Too ambiguous without context
"continue"                    # Doesn't mention commit/push
"proceed"                     # Generic, doesn't specify commit
"that's fine"                 # Approval of work, not commit permission
```

**AMBIGUOUS** — always ask "shall I create the commit?":

| Phrase        | Why Ambiguous                   |
| ------------- | ------------------------------- |
| "continue"    | Could mean continue working     |
| "proceed"     | Generic, doesn't specify action |
| "go ahead"    | Too vague without context       |
| "next steps"  | Refers to workflow              |
| "that's fine" | Approval, not permission        |

## Workflow

1. When changes are completed, suggest a commit message following the
   convention in [commit-format.md](./commit-format.md)
2. WAIT for explicit authorization
3. Only after receiving explicit permission, stage relevant changes and run:

   ```bash
   git commit -s -m "..."
   ```
