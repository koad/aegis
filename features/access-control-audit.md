---
status: draft
owner: aegis
priority: medium
description: Audit and enforce access control policies across koad:io
---

## Purpose

Aegis audits who has access to what in the koad:io ecosystem: entity directories, cryptographic keys, configuration, and sensitive data. This capability identifies over-privileged access, orphaned permissions, and enforces principle of least privilege.

## Specification

**Input:**
- Entity directory permissions (rwx by owner/group/other)
- File ownership and group membership
- Key file permissions (should be 600 for private, 644 for public)
- Configuration file access
- Trust bond visibility
- Secret material locations

**Output:**
- Access control audit report
- Over-privileged access findings
- Orphaned permissions (e.g., removed team members still have access)
- Remediation recommendations
- Privilege map (who can access what)

**Access control principles:**
1. Private keys are world-unreadable (600)
2. Public keys are world-readable (644)
3. .env files contain no world-readable secrets
4. Entity directories are readable only by owner (700) or owner+group (750)
5. Configuration is readable by owner and authorized processes
6. Trust bonds are as restrictive as functionality allows

## Implementation

(Not yet built)

## Dependencies

- Entity model (VESTA-SPEC-001)
- Cryptographic identity system (VESTA-SPEC-009)
- Unix permissions and group management
- Configuration management system

## Testing

Acceptance criteria:
- [ ] Identifies all over-privileged files in test system
- [ ] Reports are clear and actionable
- [ ] Can auto-remediate common permission issues (600 vs 644, etc.)
- [ ] Audit passes for properly configured entities
- [ ] False positive rate < 2%

## Status Note

Design phase. Relatively straightforward implementation; medium priority compared to threat detection and key rotation.
