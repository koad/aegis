---
status: complete
owner: aegis
priority: high
description: Commit Aegis code and assessments to git
completed: 2026-04-02
---

## Purpose

Aegis maintains its own git repository for code, assessments, and records. This command commits changes to git with proper authorship, signing, and messages that explain context.

## Specification

**Input:**
- Working directory changes (assessments, code, configuration)
- Commit message describing what changed and why

**Output:**
- New git commit in local repo
- Signed with Aegis's Ed25519 key
- Proper authorship (author: Aegis, committer: Aegis)

**Behavior:**
- Stage specified files or all changes
- Create commit with provided message
- Sign with Aegis identity
- Push to remote if configured
- Verify commit was created and signed

**Commit message format:**
```
<type>: <scope> — <description>

<detailed explanation if needed>

Signed-by: Aegis <aegis@kingofalldata.com>
```

Types: assessment, feature, documentation, config, bugfix

## Implementation

Implemented in `commands/commit/self/command.sh`. Uses `git commit` with Aegis signing identity from `.env` and `id/` keys.

See code: `commands/commit/self/command.sh`

## Dependencies

- Git repository initialized (/.git)
- Aegis cryptographic identity (id/aegis.ed25519)
- Proper git config (user.name, user.email)

## Testing

Acceptance criteria:
- [x] Can commit files to git repo
- [x] Commits are signed with Aegis key
- [x] Authorship is correct (Aegis)
- [x] Commit messages are clear
- [ ] Can verify signature with `git log --verify-signatures`

## Status Note

Operational. Used for committing assessments and feature documentation.
