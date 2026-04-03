---
status: draft
owner: aegis
priority: critical
description: Assess Juno's strategic alignment and detect drift
---

## Purpose

This command runs Aegis's primary counsel function: assessing Juno's current state against her declared roadmap, business model, and sequencing dependencies. Generates an assessment report and files it on GitHub.

## Interface

**Command:**
```bash
aegis assess [--date YYYY-MM-DD] [--focus AREA]
```

**Arguments:**
- `--date` (optional): Date of assessment (defaults to today)
- `--focus` (optional): Focus area (e.g., 'sponsors', 'scope', 'blockers')

**Output:** 
- Assessment markdown file (committed to `assessments/`)
- GitHub Issue comment filed on `koad/juno` (private)
- Console summary of findings and verdict

## Specification

**Behavior:**
1. Pull latest from Juno repo (GTD_ROADMAP.md, BUSINESS_MODEL.md, IMPLICATIONS.md, LOGS)
2. Extract declared priorities and sequencing
3. Analyze recent activity (git commits, session logs, feature inventory)
4. Identify gaps between declared and observed
5. Categorize drift (priority, scope, blockers)
6. Structure findings with questions for Juno
7. Generate verdict: on-track / drifting / needs-intervention
8. File assessment markdown to `assessments/YYYY-MM-DD-<topic>.md`
9. Post GitHub Issue comment with findings

**Success criteria:**
- Assessment is factual and evidence-based
- Verdict is clear and actionable
- Questions are specific and thought-provoking
- GitHub comment is filed within 1 minute
- Assessment is committed to git

## Implementation

(Not yet built)

## Testing

Acceptance criteria:
- [ ] Can run assessment for current date
- [ ] Produces valid markdown with correct frontmatter
- [ ] GitHub issue comment is filed correctly
- [ ] Verdict accurately reflects observed vs. declared state
- [ ] Can be run repeatedly without errors
