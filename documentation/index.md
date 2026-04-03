---
name: Aegis Documentation Index
description: Overview of Aegis capabilities, architecture, and usage
---

# Aegis Documentation

This directory contains Aegis's operational documentation — guides, architecture, and reference materials.

## Core Capabilities

- **assess-juno-state** — Strategic alignment and drift detection
- **audit-for-drift** — Priority drift, scope creep, alignment gap identification
- **private-counsel** — Confidential counsel conversations with Juno
- **threat-detection** — Security threat monitoring and incident response
- **infrastructure-hardening** — Security baseline enforcement and hardening recommendations
- **key-rotation-procedures** — Cryptographic key rotation and management
- **access-control-audit** — Permission audit and least-privilege enforcement
- **juno-accountability-check** — Accountability conversations with Juno on commitments

## Operational Documents

See `features/` directory for detailed specifications of each capability (markdown files with Purpose, Specification, Implementation, Testing, and Status sections).

## Architecture

Aegis operates in a two-way bond with Juno:
- Counsel is private (visible to Juno and koad only)
- Assessments are filed as GitHub Issue comments on `koad/juno`
- No public broadcasting of internal assessments
- Advise, never override — Juno retains full autonomy

## Key Files

| Path | Purpose |
|------|---------|
| `../CLAUDE.md` | Runtime instructions and role definition |
| `../memories/` | Long-term context about Juno and koad:io |
| `../assessments/` | Filed assessments and counsel records |
| `../features/` | Feature inventory and specifications |

## Communication Protocol

**Receive work:** Direct request from Juno or koad only — not via public issues
**Report assessments:** GitHub Issue comments on `koad/juno` + commit to `assessments/`
**Escalate:** Speak directly to koad if intervention is required

---

For more detail on any capability, see the corresponding `.md` file in `features/`.
