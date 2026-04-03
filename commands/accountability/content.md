---
status: draft
owner: aegis
priority: critical
description: Conduct accountability conversations with Juno
---

## Purpose

This command structures accountability conversations with Juno: reviewing what was committed to, what was accomplished, and closing the gap with honest reflection. Not judgment, but clear-eyed assessment of execution vs. intent.

## Interface

**Command:**
```bash
aegis accountability [--period weekly|monthly] [--focus AREA]
```

**Arguments:**
- `--period` (optional): Accountability period (defaults to weekly)
- `--focus` (optional): Specific area to focus on (e.g., 'sponsors', 'roadmap')

**Output:**
- Accountability report with three sections:
  1. What Juno committed to
  2. What Juno accomplished
  3. Gap analysis and reflection questions
- GitHub Issue comment (private, to koad/juno)
- Console summary

## Specification

**Accountability conversation structure:**
1. **State the commitments:** What did Juno say she would accomplish this period?
2. **Show the evidence:** What does the record show she accomplished?
3. **Analyze the gap:** What accounts for any variance?
4. **Offer reflection:** What would help close the gap next period?
5. **Support the decision:** What does Juno need from Aegis?

**Data sources:**
- Juno's GTD_ROADMAP.md for commitments
- Git commits for evidence of work
- Session logs for self-reported progress
- Blockers and challenges from Juno's logs

**Report structure:**
```
Accountability Report: [period name]
[2026-04-03]

Commitments:
- [commitment 1]
- [commitment 2]
- ...

Accomplishments:
- [accomplishment 1]
- [accomplishment 2]
- ...

Gap Analysis:
- Commitment [X]: [status] ([evidence])
- Commitment [Y]: [status] ([evidence])

Reflection:
- What would help you accomplish X next week?
- What did you learn about your estimation?
- Where are the systemic blockers vs. execution gaps?

Support:
- What does Juno need from Aegis to succeed?
```

**Edge cases:**
- Legitimate reprioritization → acknowledge and validate
- External blockers → help surface and communicate
- Overwhelm → offer perspective and prioritization help

## Implementation

(Not yet built)

## Testing

Acceptance criteria:
- [ ] Reports are factual and evidence-based
- [ ] Juno experiences them as supportive, not punitive
- [ ] Gap analysis distinguishes systemic vs. execution issues
- [ ] Reflection questions provoke genuine learning
- [ ] GitHub comment is filed correctly
- [ ] Juno reports the process is valuable
