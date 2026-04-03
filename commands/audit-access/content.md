---
status: draft
owner: aegis
priority: medium
description: Audit and enforce access control policies
---

## Purpose

This command audits file permissions, ownership, and access across koad:io infrastructure. Identifies over-privileged access, orphaned permissions, and enforces principle of least privilege.

## Interface

**Command:**
```bash
aegis audit-access [--entity NAME] [--auto-fix] [--report-only]
```

**Arguments:**
- `--entity` (optional): Specific entity to audit (defaults to all)
- `--auto-fix` (optional): Automatically fix common permission issues
- `--report-only` (optional): Generate report without making changes

**Output:**
- Access control audit report
- Over-privileged access findings
- Orphaned permissions (removed users still have access)
- Remediation recommendations

## Specification

**Permission baselines:**
- Private keys: 600 (owner read+write only)
- Public keys: 644 (world-readable)
- Secrets (.env, credentials): 600
- Entity directories: 700 (owner) or 750 (owner+group)
- Configuration: owner-readable, authorized process readable
- Trust bonds: as restrictive as functionality allows

**Audit checks:**
1. All private key files (id/, .env) are 600 or stricter
2. All public key files are 644 or readable
3. No world-readable secrets (grep for API keys, tokens)
4. Entity directories are not world-readable (no 777 permissions)
5. Group membership matches functional needs
6. No orphaned group memberships (removed team members)

**Output structure:**
```
Access Control Audit Report [entity-name]

Over-privileged access:
- [file]: permissions [current] should be [target]
  Risk: [reason]

Orphaned permissions:
- [user]: still has access to [resource] (removed 2026-03-15?)

Secrets exposure:
- [file]: world-readable or group-readable ([permissions])

Remediation:
- chmod 600 [file]
- Remove [user] from [group]
- ...

Summary: [X] critical, [Y] high issues
```

## Implementation

(Not yet built)

## Testing

Acceptance criteria:
- [ ] Identifies all over-privileged files in test system
- [ ] Correctly detects orphaned permissions
- [ ] Auto-fix remediates common issues without errors
- [ ] Reports are clear and actionable
- [ ] False positive rate <2%
- [ ] Can audit all entities in <5 seconds
