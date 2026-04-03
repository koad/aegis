---
status: draft
owner: aegis
priority: critical
description: Audit for priority drift, scope creep, and alignment gaps
---

## Purpose

This command detects when Juno's activity diverges from declared priorities. It analyzes git commits, time allocation, and feature inventory to identify drift categories: priority drift (building infra instead of core), scope creep, proxy work, blocker drift, or alignment gaps.

## Interface

**Command:**
```bash
aegis audit [--format json|text] [--period DAYS]
```

**Arguments:**
- `--format` (optional): Output format (defaults to text)
- `--period` (optional): Analysis window in days (defaults to 7)

**Output:**
- Drift assessment matrix
- Flagged items with categorization and reasoning
- Recommended refocus actions
- JSON report (if --format json)

## Specification

**Drift categories:**
1. **Priority drift:** High-priority items neglected; low-priority work proceeds
2. **Scope creep:** Features added without explicit reprioritization decision
3. **Proxy work:** Infrastructure/tooling built instead of harder core work
4. **Blocker drift:** Work on items waiting for unresolved external dependencies
5. **Alignment gap:** Activity mismatched with declared business model or sequencing

**Analysis method:**
- Extract declared priorities from GTD_ROADMAP.md
- Count commits per area (core work vs. infrastructure/tooling)
- Time allocation analysis from session logs
- Feature additions outside declared scope
- Blocker identification and duration tracking

**Output structure:**
```
Drift Report [2026-04-03]

Declared Priority: [priority name]
Expected allocation: [%]
Actual allocation: [%]
Variance: [+/-]%

Flagged items:
- [item]: [drift type] (reasoning)

Recommendation: [specific actions to refocus]
```

## Implementation

(Not yet built)

## Testing

Acceptance criteria:
- [ ] Correctly categorizes all drift types in test data
- [ ] Reports are accurate to within 5% of manual review
- [ ] <5% false positive rate
- [ ] Can run on arbitrary date ranges
- [ ] JSON output is valid and parseable
