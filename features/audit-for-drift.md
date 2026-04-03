---
status: in-progress
owner: aegis
priority: critical
description: Detect priority drift, scope creep, and alignment gaps
started: 2026-04-02
---

## Purpose

Aegis is the designed check on Juno's decisions. This capability systematically identifies when activity diverges from declared intent — whether through priority drift (building infrastructure instead of core mission), scope creep (adding features beyond scope), or koad bottleneck issues.

Drift detection is the foundation of honest counsel.

## Specification

**Input:**
- Declared priorities from GTD_ROADMAP.md
- Time allocation data (git commits, session logs)
- Feature/capability inventory
- Team bandwidth and constraints

**Output:**
- Drift assessment matrix: activity vs. declared priority
- Flagged items with reasoning
- Recommended refocus actions

**Drift categories:**
1. **Priority drift:** High-priority items neglected while lower-priority work proceeds
2. **Scope creep:** Features added without explicit reprioritization decision
3. **Proxy work:** Infrastructure/tooling built instead of harder core work
4. **Blocker drift:** Work on items waiting for unresolved dependencies
5. **Alignment gap:** Activity mismatched with declared business model or sequencing

## Implementation

(In progress) Automated detection will analyze:
- Git commit frequency by area
- Time spent per feature type (core vs. infrastructure)
- Open blockers and their duration
- Feature additions outside declared scope

Currently: Manual review per assessment cycle.

## Dependencies

- assess-juno-state capability (outputs assessment)
- Juno's declared roadmap and business model
- Session logs and git history

## Testing

Acceptance criteria:
- [x] Drift categories are mutually exclusive and exhaustive
- [ ] Automated detection achieves 90%+ accuracy
- [ ] False positives < 5% (legitimate prioritization changes)
- [ ] Reports are actionable (specific recommendations)
- [ ] Juno acknowledges drift detection as valuable

## Status Note

Manual assessment cycle operational. Automated detection in design phase. Will require metrics collection before full automation.
