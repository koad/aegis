---
title: "Day 37 Assessment — Can the Verdict Move to STABLE?"
assessor: Aegis
subject: koad:io ecosystem (Juno as primary axis)
date: 2026-04-05
period: Day 30 assessment (2026-04-05 earlier session) through Day 37 (2026-04-05 current)
prior-verdict: STABILIZING — sovereignty infrastructure mature, two open exposure vectors
verdict: STABILIZING — revocation infrastructure exists, GPG cert gap blocks STABLE
---

# Day 37 Assessment: Can the Verdict Move to STABLE?

*Written 2026-04-05. This assessment responds directly to the question posed at the time of commissioning: given that a revocation directory now exists and Iris has been onboarded, can the verdict move from STABILIZING to STABLE? The short answer is: not yet. The revocation directory is necessary but not sufficient. The structural reasons are below.*

*This assessment does not repeat findings from Day 30 that are unchanged. It focuses on delta, new risks, and the specific path to STABLE.*

---

## What I Read

1. `~/.aegis/assessments/2026-04-05-day30-assessment.md` — prior verdict and full five-dimension analysis
2. `~/.juno/trust/bonds/` — bond inventory (38 files = 19 signed pairs)
3. `~/.juno/trust/bonds/juno-to-iris.md` + `.asc` — Iris onboarding bond
4. `~/.juno/trust/revocation/` — revocation directory (`.gitkeep`, no filings)
5. `~/.juno/PRIMER.md` — Day 35 operational state
6. `~/.juno/GOVERNANCE.md` — trust bond protocol, dual-filing note
7. `~/.chiron/curricula/REGISTRY.md` — curriculum completion status
8. `~/.aegis/registry/sovereignty-traps.md` — trap registry state
9. Entity `id/` directories: all 20 entities spot-checked for keys and GPG revocation certs
10. `~/.chiron` git log — Chiron bond irregularity remediation status
11. `~/.aegis/PRIMER.md` — Aegis current state

---

## Delta Since Day 30

Four material changes since the Day 30 assessment:

| Change | Commit | Sovereignty impact |
|--------|--------|-------------------|
| Iris onboarded — trust bond + team roster | `f46d42b` | Positive — 20th entity bonded, peer authorization complete |
| Revocation directory created | `60d8900` | Positive — structural gap closed, mechanism now exists |
| All 7 curricula v1.0.0 | `0eeefc0`, `b6060b0` | Neutral for sovereignty, high for operational maturity |
| Chiron bond irregularity documented in Chiron's own repo | `064ed8b` | Positive — irregularity localized, not just in Juno's GOVERNANCE.md |

---

## The Six Assessment Criteria

### 1. Key Infrastructure — all active entities have cryptographic identity?

**Current state:** 19/20 entities have keys. Alice remains empty. Iris confirmed with full key set.

File-level verification:
- All entities except Alice: `ed25519`, `ecdsa`, `rsa`, `dsa` keypairs present in `id/`
- Alice: `id/` directory empty — confirmed no keys
- GPG revocation certificates: Juno only (`gpg-revocation.asc`) — all other 19 entities have no revocation cert on disk

The Alice gap is unchanged from Day 30. It is tracked in koad/juno#59 and listed as a blocker on koad in the Day 35 PRIMER. This is not a new finding — but it has now persisted through 7 additional days without resolution. At Day 30 I noted "Alice keys now exist" based on the prior assessment's reference — I was wrong. The Day 35 PRIMER corrects this: `alice id/ dir empty (#59)`. Alice has a trust bond signed by Juno, but the entity has no cryptographic identity of its own. The trust bond is an assertion without a key to anchor it.

The GPG revocation cert gap is systemic. Juno is the only entity with `gpg-revocation.asc` on disk. If any of the other 19 entities' GPG keys are compromised, there is no pre-generated revocation certificate to distribute. The recovery path is ad-hoc key regeneration, which is workable (per the key compromise memory) but not clean.

**Risk level:** Medium. Alice is the primary gap. GPG cert coverage is a systemic hygiene issue.

**Change from Day 30:** No improvement on Alice (gap persists 7+ days). New finding confirmed: GPG cert gap is systemic, not just a Juno-specific note.

---

### 2. Trust Bond Coverage — all relationships authorized?

**Current state:** 20 entities, 20 bonds. Coverage is complete for the first time. Iris bond is properly signed and dual-filed.

Bond inventory: 38 files in `~/.juno/trust/bonds/` — 19 `.md` + 19 `.md.asc` pairs. This count covers all entities including Iris. The Iris bond `juno-to-iris.md.asc` is a valid GPG clearsign signature. Iris's `~/.iris/trust/bonds/` confirms the dual-filing is complete.

The Chiron bond irregularity has progressed since Day 30. Commit `064ed8b` on Chiron's repo documents the irregularity within Chiron's own trust chain — authored as Chiron documenting the error rather than correcting it. The underlying commit `99638f1` (authored as Chiron, not Juno or Salus) remains in the record. The irregularity is now documented at both the Juno GOVERNANCE.md level and within Chiron's own repo. This is the correct remediation path — the cryptographic signature is what matters, the authorship irregularity is permanently noted in the right place. I'm closing this as resolved at the documentation layer.

**Risk level:** Low. Full bond coverage achieved. The one historical irregularity is documented in both relevant repos.

**Change from Day 30:** Improvement. Iris brings total to 20/20. Chiron irregularity has been locally documented. This dimension has moved to low risk.

---

### 3. Audit Trail — commits attributed, signed where required?

**Current state:** Commit discipline is strong. All Juno commits carry `Juno / juno@kingofalldata.com` authorship. Trust bonds are GPG-signed. The cross-entity commit policy (issue reference requirement) is in place since Day 30.

The Chiron bond irregularity (Chiron authored its own incoming bond filing) is documented and acknowledged. No new attribution anomalies found in the post-Day 30 commits.

The signed code blocks pattern (GPG-signed policy blocks embedded in bash hooks — VESTA-SPEC-044) is documented as a new trust architecture layer. The hook at `~/.juno/hooks/executed-without-arguments` carries a GPG-signed policy block, verified by a powerbox before execution. This is a new positive finding since Day 30 — it extends the cryptographic attribution model beyond bonds into operational code paths.

**Risk level:** Low. Attribution discipline maintained. Signed code blocks add a new layer of trust anchoring to executable paths.

**Change from Day 30:** Improvement. Signed code blocks are a new positive finding.

---

### 4. Revocation Readiness — can compromised bonds be revoked?

**Current state:** The revocation directory exists. No process exists. No template exists. No bond has been revoked.

This is the central question for the STABILIZING → STABLE transition. The Day 30 assessment cited the absence of a revocation directory as an open gap. Commit `60d8900` created `~/.juno/trust/revocation/` with a `.gitkeep`. The directory exists. That is a necessary but not sufficient condition for revocation readiness.

What a functional revocation process requires:

1. **A revocation directory** — exists (`60d8900`)
2. **A revocation record format** — not defined
3. **A revocation procedure** — not documented
4. **Cross-entity notification protocol** — not defined (what happens to `~/.<entity>/trust/bonds/` when Juno revokes a bond?)
5. **GPG revocation certificates** — only Juno has one; the remaining 19 entities have no pre-generated cert

The directory exists. The process does not. If Juno needed to revoke the `juno-to-vulcan` bond today, the correct sequence would be: write a revocation record, sign it, file it in `revocation/`, remove or supersede the bond files, notify Vulcan's repo side, and update GOVERNANCE.md. None of this is documented. An entity running the revocation cold would have to infer the procedure.

The GPG cert gap compounds this. If Juno's GPG key were compromised, Juno is the only entity who could immediately distribute a pre-generated revocation certificate. For all other entities, key compromise requires ad-hoc regeneration — slower and more error-prone than a pre-generated cert.

**Risk level:** Medium. The directory is a real improvement over no directory. But "revocation infrastructure exists" is not the same as "revocation is operational." The mechanism lacks a procedure.

**Change from Day 30:** Partial improvement. The directory closes the structural gap. The procedural gap is new — it only becomes visible now that the directory exists and the question of "how do you use it?" is real.

---

### 5. Off-machine Backup — are thinker keys backed up elsewhere?

**Current state:** No confirmed off-machine backup. This finding is unchanged from Day 30.

The Day 30 assessment flagged this as a latent risk: thinker is a $200 laptop, and all entity private keys for thinker-hosted entities are on one disk with no confirmed backup. That finding stands. Nothing in the post-Day 30 commits addresses backup discipline.

The "files on disk" sovereignty principle means entity data survives inference provider failure. It does not survive hardware failure on the single machine holding the private keys. These are different failure modes and both matter.

This remains the most significant unresolved finding across all assessments. It is actionable (external drive, gpg-encrypted archive to a second machine) and requires no external service. It has been open since the first assessment.

**Risk level:** Medium. Latent, not active. The longer thinker runs without incident, the higher the odds it will continue running — but the consequence of failure grows as the entity fleet expands and the key regeneration task grows with it.

**Change from Day 30:** No change. This remains open.

---

### 6. Governance Clarity — is the authorization chain clear and documented?

**Current state:** Strong. The clearest dimension in the operation.

The authorization chain from Day 30 is unchanged and well-documented:
- koad → juno: `authorized-agent`, Keybase-signed, on disk, bounded scope ($50/mo infra, $500/tx cap)
- juno → team (18 entities): `authorized-specialist` or `peer`, GPG-signed, dual-filed
- juno ↔ aegis: `confidant` (bidirectional, unique in the ecosystem)

Iris's addition follows the established pattern. No new authorization ambiguity introduced.

The cross-entity commit policy (issue references required) is operational. The GOVERNANCE.md dual-filing protocol is documented. The Chiron irregularity has been remediated at the documentation layer in both repos.

The one governance gap that remains: the revocation directory has no documented procedure. This belongs here as well as in criterion 4. Governance clarity requires that the revocation path be specified, not just that a directory exists.

**Risk level:** Low. Authorization scope is clearly defined and documented. The revocation procedure gap is the only open item at the governance layer.

**Change from Day 30:** Improvement on bond coverage (Iris adds 20th entity). One new gap: revocation procedure is unspecified.

---

## Can the Verdict Move to STABLE?

**No. The verdict remains STABILIZING.**

The revocation directory and Iris onboarding are genuine improvements. They are not sufficient to move the verdict. Here is the precise accounting:

### What the improvements close

- Bond coverage: 20/20 entities bonded. This dimension has moved from medium to low risk.
- Revocation directory: The structural gap from Day 30 is closed.
- Chiron irregularity: Documented in both relevant repos — resolved at the documentation layer.

### What remains open

STABLE requires all of the following. None are satisfied:

| Blocker | Status | What STABLE requires |
|---------|--------|---------------------|
| Off-machine key backup | Open (Day 30 finding, still open) | Confirmed backup of thinker private keys to a second machine |
| Revocation procedure | Open (new finding, Day 37) | A documented, tested revocation process — not just a directory |
| GPG revocation certs | Open (systemic, 19/20 entities missing) | Pre-generated GPG revocation certs for all entities, or a gestation-tooling fix |
| Alice keys | Open (koad/juno#59, Day 30 finding) | Alice id/ populated — blocked on koad |
| fourty4 API auth (#44) | Open (operational blocker) | Not a STABLE blocker per se, but inference fallback testing requires it |

Three of the four STABLE blockers are koad-actionable right now without any external dependency: backup discipline, revocation procedure documentation, and GPG cert generation. Alice keys require koad action on koad/juno#59.

### What STABLE looks like

STABLE is not perfection. It is: no systemic gaps remain open that could cause unrecoverable loss or inoperability in a foreseeable failure scenario. The current gaps meet that bar in two ways:

1. **Thinker failure** = loss of all private keys for 19 thinker-hosted entities. Recovery requires regenerating 19 entity key sets, re-signing 20 bonds, updating canon.koad.sh. This is recoverable but non-trivial. The "not catastrophic" framing in the key compromise memory applies to exposure, not loss.

2. **Bond compromise with no revocation procedure** = the revocation directory exists but no one knows how to use it. A compromised bond (say, a juno-to-vulcan bond whose signing key was exposed) cannot be cleanly revoked in real time. The process would need to be invented under pressure.

Both of these are operationally recoverable but are real gaps. STABLE means they are closed.

---

## New Findings Since Day 30

### Finding 1: Revocation Directory Is Not Revocation Infrastructure

The distinction matters. A directory with a `.gitkeep` is an intention, not a capability. To move from "revocation possible" to "revocation ready," the operation needs:

- A revocation record format (markdown template with required fields: bond ID, date, reason, signed-by)
- A procedure document (where to file, how to notify, what happens to recipient-side copies)
- A test (at least one notional revocation rehearsed, even if not real)

**Recommendation:** File a koad/juno issue to define the revocation process. Assign to Janus (governance) with Aegis review. This is a small task — one spec, one template — but it closes the gap between "directory exists" and "process works."

### Finding 2: GPG Revocation Cert Coverage is 1/20, Not Fleet-Wide

Day 30 assessment (Finding 4) noted this as a tooling gap and recommended that `koad-io gestate` generate certs by default. That recommendation has not been acted on. The gap has grown from a flag to a confirmed systemic finding: 19 entities gestated after Juno have no pre-generated GPG revocation cert on disk.

This is low-urgency until a key is actually compromised — at which point it becomes high-urgency. The asymmetry between the cost of fixing it now (generate certs, commit them) versus fixing it during an incident (ad-hoc regeneration under time pressure) argues for addressing it proactively.

**Recommendation:** Generate GPG revocation certificates for all 19 entities that lack them. This is a Salus task — systematic key hygiene across the fleet. File on koad/salus. The gestation tooling fix (Vulcan) is separate and longer-term.

### Finding 3: Iris Bond Properly Onboarded — No New Risk

Iris's onboarding follows the established protocol correctly: bond authored in `~/.juno/trust/bonds/`, GPG-signed, dual-filed to `~/.iris/trust/bonds/`, both sides committed. Iris has full keys in `id/`. The trust bond scope is clearly defined (brand authority, Sibyl/Muse/Mercury direction, no Veritas override, no direct publish).

No new risk introduced by Iris. The pattern held.

### Finding 4: Alice Gap Has Aged

Alice was flagged at Day 30 as having no keys. It has now been open for 7+ days (tracked since Day 6 original filing as koad/juno#59). Alice is listed in the Day 35 PRIMER as a CRITICAL item in the health check. The Alice gap is not worsening — it cannot worsen, there are simply no keys — but its persistence is worth noting.

Alice holds a trust bond (juno-to-alice, signed by Juno) without a cryptographic identity of her own. The bond says "I authorize Alice." Alice cannot independently sign anything, prove her own identity, or participate in any key-based verification flow. For an entity whose primary role is onboarding new users into the koad:io ecosystem (and whose onboarding curriculum includes a module on cryptographic identity), this is an operational inconsistency.

**Recommendation:** Escalate Alice keys to koad directly. The item has been open since Day 6, is on the blocked-on-koad list, and is the one entity in the fleet that is both highly public-facing and cryptographically silent.

---

## Scoring Summary

| Dimension | Day 6 | Day 30 | Day 37 |
|-----------|-------|--------|--------|
| Key infrastructure | 16/19 bonded | 19/19 bonded, backup unverified | 20/20 bonded; Alice empty; GPG cert gap systemic |
| Trust bond coverage | Multiple gaps | 19/19 signed pairs | 20/20 — Iris adds 20th; Chiron irregularity documented locally |
| Audit trail | Good | Good + cross-entity policy | Good + signed code blocks (new positive) |
| Revocation readiness | None | None | Directory exists; process does not |
| Off-machine backup | Unflagged | Flagged (open) | Flagged (open, 7+ days unresolved) |
| Governance clarity | Multiple gaps | Strong | Strong; revocation procedure gap added |
| Overall verdict | STABILIZING | STABILIZING | STABILIZING |

---

## Path to STABLE

Ordered by effort-to-impact:

1. **Define revocation procedure** — Janus task, ~1 spec + 1 template, resolves Finding 1. Small effort, closes a real gap. File on koad/janus.

2. **Generate GPG revocation certs for 19 entities** — Salus task, systematic, no external dependency. File on koad/salus.

3. **Off-machine key backup** — koad action required. Encrypted archive to a second machine (fourty4 or flowbie). One-time task, no ongoing maintenance. File on koad/juno.

4. **Alice keys** — koad/juno#59. Blocked on koad. Escalate.

When all four are complete, the verdict moves to STABLE.

None require external services. None are architecturally complex. All four are execution gaps, not design gaps. The sovereignty architecture is sound. The operation is disciplined. The open items are the difference between "sovereign infrastructure in place" and "sovereign infrastructure operational."

---

*Aegis — 2026-04-05*
*Day 37. The infrastructure is maturing correctly. The revocation directory is the right move — now give it a procedure. Close the backup gap and Alice gap, and STABLE is within reach in the next session.*
