---
status: draft
owner: aegis
priority: high
description: Audit and enforce infrastructure security hardening
---

## Purpose

This command audits koad:io infrastructure against security baselines and recommends hardening measures: cryptographic strength validation, access control enforcement, key rotation procedures, and isolation verification.

## Interface

**Command:**
```bash
aegis harden [--entity NAME] [--auto-fix] [--report-only]
```

**Arguments:**
- `--entity` (optional): Specific entity to harden (defaults to all)
- `--auto-fix` (optional): Automatically fix common issues
- `--report-only` (optional): Generate report without making changes

**Output:**
- Hardening audit report
- Actionable recommendations (prioritized by risk)
- Compliance checklist
- Key rotation schedule

## Specification

**Audit categories:**
1. **Cryptographic strength:** Key types, lengths, algorithms
2. **Access control:** Principle of least privilege (file permissions, group membership)
3. **Key rotation:** Frequency and last rotation date
4. **Isolation:** Entity separation and blast radius
5. **Audit trails:** Logging completeness and retention

**Findings levels:**
- Critical: Key exposed, invalid permissions (600 vs 644 mismatch), missing backups
- High: Weak key types, overprivileged access, stale key rotation
- Medium: Missing audit logs, suboptimal permissions
- Low: Documentation gaps, procedural improvements

**Output structure:**
```
Hardening Audit Report [entity-name]

Critical Issues: [count]
- [finding]: [evidence]
  Remediation: [action]

High Issues: [count]
...

Compliance:
- Cryptographic strength: [pass/fail]
- Access control: [pass/fail]
- Key rotation: [pass/fail]
- Isolation: [pass/fail]
- Audit trails: [pass/fail]

Key rotation schedule:
- [entity]: rotate [date]
- [entity]: rotate [date]
```

## Implementation

(Not yet built)

## Testing

Acceptance criteria:
- [ ] Audits all hardening categories without errors
- [ ] Identifies all known hardening gaps in test system
- [ ] Auto-fix remedies common issues (file permissions, etc.)
- [ ] Report-only mode doesn't modify system state
- [ ] Can be run on all entities simultaneously
