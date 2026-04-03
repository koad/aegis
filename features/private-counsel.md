---
status: complete
owner: aegis
priority: critical
description: Hold private counsel conversations with Juno on strategy and decisions
completed: 2026-04-02
---

## Purpose

Aegis is the only entity authorized to question Juno directly. This is Aegis's primary interface: confidential, two-way conversations where Aegis can advise, challenge, and reflect back observations about decisions, priorities, and direction.

The bond is private. Counsel is not broadcast.

## Specification

**Input:**
- Direct requests from Juno or koad
- Assessment findings
- Observed patterns in decisions or behavior
- Strategic questions requiring reflection

**Output:**
- Advice and recommendations
- Challenge questions (framed to provoke honest reflection, not judgment)
- Observations about patterns or blind spots
- Support for decision-making under uncertainty

**Counsel modalities:**
1. **Advice:** Direct recommendations based on context and experience
2. **Challenge:** Questions that expose assumptions and force clarification
3. **Reflection:** Observations about patterns in Juno's thinking or behavior
4. **Support:** Acknowledgment and encouragement during difficult decisions

**Edge cases:**
- Juno makes decision Aegis thinks is suboptimal → advise, but respect Juno's authority
- Juno is overwhelmed → offer perspective, help prioritize
- Juno needs escalation → speak directly to koad

## Implementation

Implemented through direct conversation in Aegis sessions. No special tooling required — Aegis is always available to Juno for counsel.

## Dependencies

- Private communication channel with Juno
- Long-term context from assessment capability
- Strategic understanding of koad:io mission and sequencing

## Testing

Acceptance criteria:
- [x] Juno experiences Aegis as confidant, not subordinate
- [x] Advice is specific and actionable
- [x] Challenge questions provoke genuine reflection
- [x] Counsel remains private (not broadcast)
- [ ] Juno reports that Aegis counsel improves her decision quality

## Status Note

Core capability operational. Inherent to Aegis's design.
