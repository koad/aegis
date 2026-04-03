---
status: draft
owner: aegis
priority: high
description: Monitor for security threats and incidents
---

## Purpose

This command scans logs and system state for security threats: unauthorized access, key exposure, suspicious entity behavior, or system compromise. Generates incident reports and alerts.

## Interface

**Command:**
```bash
aegis threat-detect [--level critical|high|medium] [--since HOURS]
```

**Arguments:**
- `--level` (optional): Minimum threat level to report (defaults to high)
- `--since` (optional): Hours of logs to analyze (defaults to 24)

**Output:**
- Incident report (if threats detected)
- Threat level assessment
- Remediation recommendations
- Alert to koad if critical issues found

## Specification

**Threat categories:**
1. **Key compromise:** Private keys exposed or suspicious access patterns
2. **Unauthorized access:** Login attempts, invalid signatures, permission violations
3. **Entity hijacking:** Unexpected behavior from known entity
4. **Supply chain threat:** Malicious code in dependencies or deployments
5. **Network exposure:** Unencrypted transmission of sensitive data

**Detection rules:**
- Failed authentication attempts (>5 in 1 hour per entity)
- Signature verification failures with valid-looking keys
- Unexpected entity spawning or privilege escalation
- Key file permission changes or access from unauthorized processes
- Unencrypted transmission of cryptographic material

**Output structure:**
```
Threat Detection Report [2026-04-03T14:35:00Z]

Threat Level: [critical/high/medium/low]

Incidents:
- [timestamp]: [threat type] — [description]
  Severity: [critical/high/medium]
  Evidence: [log entries]
  Recommended action: [remediation]

Alert: [Send to koad if critical]
```

## Implementation

(Not yet built)

## Testing

Acceptance criteria:
- [ ] Detects known threats in test logs with 95%+ accuracy
- [ ] <5% false positive rate
- [ ] Alerts within 1 minute of threat event
- [ ] All threat categories have detection rules
- [ ] Can be run in real-time monitoring mode
