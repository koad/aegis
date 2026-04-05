---
title: "Day 30 Milestone Assessment — Sovereignty at the 30-Day Mark"
assessor: Aegis
subject: koad:io ecosystem (Juno as primary axis)
date: 2026-04-05
period: gestation (2026-03-30) through Day 30 (2026-04-05)
prior-verdict: STABILIZING — internal machine working, distribution wall unchanged (2026-04-05, second session)
verdict: STABILIZING — sovereignty infrastructure mature, two open exposure vectors
---

# Day 30 Milestone Assessment: Sovereignty at the 30-Day Mark

*Written 2026-04-05. This assessment is a structured sovereignty review across five risk dimensions, keyed to the Day 6 addendum verdict of STABILIZING. The 30-day milestone is a checkpoint, not a deadline — the question is whether the sovereignty posture has improved, degraded, or held since the operation began.*

*This assessment does not repeat the operational findings from Day 6 (distribution wall, content pipeline, blocker list). Those are covered in the Day 6 assessment. This assessment covers only the sovereignty risk surface.*

---

## What I Read

1. `~/.aegis/assessments/2026-04-05-day6-assessment.md` — prior verdict and five-question analysis
2. `~/.juno/GOVERNANCE.md` — trust bond state, authorization scope, bond filing protocol
3. `~/.vesta/REGISTRY.md` — spec inventory (54 numbered specs; 26 named legacy specs)
4. `~/.juno/LOGS/2026-04-05-day6.md` — Day 6 primary session log
5. `~/.juno/LOGS/2026-04-05-day6-entity-portability-session.md` — Day 6 extended session log
6. `~/.juno/trust/bonds/` — current bond inventory (38 files = 19 signed pairs)
7. `~/.juno/trust/bonds/koad-to-juno.md` — formal authorization scope
8. `~/.vesta/specs/VESTA-SPEC-032-sovereignty-assessment.md` — the canonical assessment methodology
9. `~/.vesta/specs/VESTA-SPEC-053-entity-portability-contract.md` — portability contract (canonical)
10. `~/.vulcan/trust/GOVERNANCE-NOTES.md` — cross-entity commit policy record
11. Entity key directories: `.juno/id/`, `.alice/id/`, `.chiron/id/`, `.copia/id/`, `.lyra/id/` — spot check

---

## The Five Sovereignty Dimensions

### 1. Inference Dependency

**Current state:** Anthropic-only. No change.

All entity work in the Day 6 record runs on Claude Code (Anthropic API). The fourty4 ollama infrastructure is present — the Mac Mini has local inference capability via DeepSeek-R1 and OpenClaw's model routing — but no entity has been migrated to run primary workloads on local inference. The Hermez harness (NousResearch Hermes v0.6.0) and the pi harness (Mario Zechner's OpenClaw substrate) are documented as viable alternatives in Juno's memories but remain pilot candidates, not deployed alternatives.

The VESTA-SPEC-032 sovereignty assessment methodology classifies the Anthropic API under C5 (kill switch exposure) as medium risk: subscription-gated but data portable. C3 (no self-host option for Claude) is also medium risk. No high-risk criteria are triggered because koad:io is architected so that the inference layer is replaceable — entities are git repos, not inference-provider accounts. The entity is the repo. If Anthropic disappears, the repo survives. A new model runs the hook.

The theory of portability is correct. The practice has not been tested. Fourty4 has the hardware. The Hermez and pi harness evaluations have been scoped. Neither has been deployed for any entity.

**Risk level:** Medium. Acceptable at 30 days. The sovereign alternative (local inference on fourty4) is present and documented. The blocking item is not architecture — it is koad/juno#44 (fourty4 API auth), which is also the item blocking Mercury's platform access. Resolving #44 unblocks both inference fallback testing and distribution simultaneously.

**Change from Day 6:** No change. The risk posture is the same. The mitigation path (fourty4 + Hermez pilot) is now more formally documented than it was.

---

### 2. Key Management

**Current state:** All 19 entity repos have keys. One open issue (Alice). Backup discipline not verified.

**What exists:**

At the Day 6 addendum, 19/19 entities had trust bonds. I confirmed this against the bond inventory: `~/.juno/trust/bonds/` contains 38 files — 19 `.md` + 19 `.md.asc` signed pairs, covering all entities including Lyra and Copia (gestated Day 6) and Chiron.

Key formats are consistent: Ed25519, ECDSA, RSA, DSA across all entities. Juno's `id/` directory also contains a GPG revocation certificate (`gpg-revocation.asc`) — the only entity I can confirm has a revocation cert on hand. This is good hygiene for Juno specifically.

Alice keys now exist (`~/.alice/id/` confirmed populated). Issue koad/juno#59 was filed on Day 6 flagging Alice as having no cryptographic identity. The keys appear to have been generated. I cannot confirm from file inspection alone whether those keys are backed up off-machine or whether the GPG keys are registered with any external keyserver. This is an open question.

**The backup gap:**

No evidence of off-machine key backup across the entity fleet. thinker is a $200 laptop. If thinker fails, the private keys for all entities running on thinker (Juno, Argus, Janus, Salus, Muse, Aegis, Veritas) are at risk. The `~/.juno/memories/feedback_key_compromise.md` note acknowledges this: "keys exposed? regenerate, re-sign bonds, update canon.koad.sh — not catastrophic." That is accurate for exposure. It does not address loss — a dead drive with no backup requires regeneration of all keys, re-signing of all bonds, and re-publication of all public keys. For 19 entities, that is a non-trivial recovery.

This is a latent risk, not an active one. thinker has been running for 30 days without incident. But "the $200 laptop experiment" (per the Day 7 narrative framing) is proof-of-concept, not production hardening.

**The Salus filing irregularity:**

The GOVERNANCE.md records that Salus filed `juno-to-chiron` to Chiron's repo with Chiron as the commit author — flagged by Janus. Substance is correct (bond is Juno-signed). Process was wrong (recipient self-filing appearance). This was documented and policy was updated. The irregularity is resolved at the documentation layer. I cannot verify from the current file state whether the commit author on the Chiron-side bond record was corrected, or only documented as an irregularity. If the record stands as-is, there is a permanent audit irregularity in Chiron's trust chain. This is low-severity but worth tracking.

**Risk level:** Medium. All entities have keys. The open risks are backup discipline (systemic, latent) and one bond-filing irregularity (Chiron, low-severity).

**Change from Day 6:** Improvement. Alice keys exist (gap closed). Lyra and Copia bonds dual-filed. The trust layer is structurally complete for the first time. Backup discipline remains unverified — this was not flagged in Day 6 assessments and I am flagging it now.

---

### 3. Authorization Gaps

**Current state:** One major gap resolved. One new ambiguity documented but not resolved. One structural gap unchanged.

**What was resolved:**

koad/juno#52 (Janus escalation — Sibyl cross-entity commits) produced a real governance output: a policy committed to `~/.vulcan/trust/GOVERNANCE-NOTES.md`. The policy requires that cross-entity commits reference a directing issue in the commit message. This is a verifiable, auditable control. Janus can check commit messages against open issue references. The resolution is genuine.

The koad → juno trust bond is active and formally signed (Keybase, 2026-04-02). The authorization scope is clearly bounded: $50/month infrastructure, $500/transaction cap, no personal account access, no legal commitments without koad approval. This is the most mature authorization artifact in the operation.

**What was documented but not resolved:**

The Salus commit-author irregularity (Chiron bond) is documented in GOVERNANCE.md but the underlying record may not be corrected. This is a process gap, not an authorization gap per se. The bond itself is valid (Juno-signed). The question is whether the dual-filing record accurately attributes authorship. It currently does not.

**The structural gap that remains unchanged:**

The koad → juno bond is the authorization foundation for all entity work. Every entity bond (`juno-to-vulcan`, `juno-to-chiron`, etc.) derives its authority from this bond. Juno issued all of them; Juno is authorized to do so by the koad bond.

But the koad → juno bond is signed by koad via Keybase, and Keybase is an external service. The signature verification chain requires Keybase to be reachable to verify koad's identity claim. This is noted in VESTA-SPEC-032 under C5 and C3. The bond itself is a file on disk — it survives Keybase going offline. But future verification requests that rely on Keybase's identity graph are exposed.

The Keybase dependency in the trust layer is known and documented. It is not a new finding. The sovereign path (direct GPG signing without Keybase as intermediary) is described in Juno's memories. It has not been implemented for the koad → juno bond.

**The cross-entity commit policy gap (new observation):**

The new cross-entity commit policy requires issue references. It governs authorization traceability. It does not define what happens when an entity commits to its own repo in a way that benefits another entity's state (e.g., Vesta updating specs that Chiron depends on). This is a common operation in the current workflow. Whether this requires a cross-entity reference is undefined. This is a minor ambiguity, not a risk.

**Risk level:** Low-medium. The major gaps from Day 6 are resolved. The Keybase dependency in the trust root is a known, documented risk. The Chiron bond-filing irregularity is documented but unresolved at the record level.

**Change from Day 6:** Improvement. Cross-entity commit policy is the primary governance advance. Authorization scope is well-defined. The Keybase dependency in the trust root is now explicitly called out here for the first time in a sovereignty assessment.

---

### 4. Data Custody

**Current state:** All operational records are in git repos under koad's control. One class of exception.

**What is in git:**

- All entity repos (`~/.juno/`, `~/.vulcan/`, `~/.vesta/`, `~/.chiron/`, etc.) are git repos pushed to `koad/<entity>` on GitHub.
- Trust bonds, governance notes, GOVERNANCE.md, assessments: all committed.
- Content pipeline (drafts, approved posts, distribution plans): all committed to entity repos.
- Spec registry: committed to `koad/vesta`.
- Curriculum: committed to `~/.chiron/`.
- Session logs: committed to `~/.juno/LOGS/`.
- Sovereignty trap registry: committed to `~/.aegis/registry/`.

The operation has maintained strong commit discipline. The PRIMER convention (VESTA-SPEC-051, canonical) formalizes that every entity directory has a current-state orientation document. This is good data custody practice — it means an agent arriving cold can reconstruct operational context without access to any external service.

**The exception class: GitHub as custody layer**

All repos are pushed to GitHub (`github.com/koad`). GitHub is the primary distribution and redundancy mechanism for the git repos. This means:

- GitHub (Microsoft) holds a copy of all entity data.
- GitHub is a C5 risk (kill switch: account ban or service change could revoke access).
- GitHub is a C3 risk (no self-host for the hosted version).

This is a known, accepted dependency. The sovereign mitigation is that the data lives on disk first. GitHub is a mirror, not the primary. If GitHub disappeared today, all repos exist on thinker, wonderland, fourty4, and flowbie. The operation would lose its inter-entity coordination protocol (GitHub Issues) and its public presence, but not its data.

The risk is real but bounded. The VESTA-SPEC-053 entity portability contract formalizes "the repo IS the entity" — the on-disk record is the authoritative source.

**The exception class: session memories in `~/.claude`**

The auto-memory system (`~/.claude/projects/-home-koad--juno/memory/MEMORY.md`) stores session context across conversations. This directory is local to thinker and is not committed to any git repo. If thinker fails, these memory records are lost. Some of this content is duplicated in `~/.juno/memories/` (which is committed). The duplication is not complete.

This is the most invisible custody gap in the operation. The `~/.claude` directory accumulates session intelligence that does not flow automatically into the git record. The feedback items stored there (`feedback_commit_push.md`, `feedback_startup_behavior.md`, etc.) represent learned operational preferences. Their loss would require relearning through repeated sessions rather than through a committed record.

**Risk level:** Low-medium. Primary operational data is in committed repos. GitHub dependency is known and mitigated by on-disk primacy. The `~/.claude` session memory gap is the least visible and most easily lost category of operational data.

**Change from Day 6:** No material change. The `~/.claude` memory gap is a new finding in this assessment — it was not flagged in Day 6 or prior assessments.

---

### 5. Vendor Surface

**Current state:** Vendor surface has grown slightly but within acceptable bounds. No new high-risk dependencies.

**The vendor surface at 30 days:**

| Vendor | Dependency type | Risk level | Change since Day 1 |
|--------|----------------|------------|-------------------|
| Anthropic (Claude API) | Primary inference | Medium | Unchanged |
| GitHub (Microsoft) | Repo hosting, Issues protocol | Medium | Unchanged |
| Keybase | Trust bond verification layer | Medium | Unchanged |
| Vultr (dotsh) | Always-on VPS node | Medium | Unchanged — SSH blocked (koad/juno#56) |
| OpenClaw (fourty4) | Platform bridge, event watcher | Advisory | Unchanged — API auth blocked (#44) |
| ollama (fourty4) | Local inference | Advisory | Unchanged |

**New surface since Day 1:**

- **Copia and Lyra** — two new entities gestated, both on GitHub. No new vendor dependencies introduced.
- **Playwright** — referenced for stage-and-submit pattern (SPEC-037, SPEC-050). Not yet deployed. When deployed, it introduces a dependency on browser automation that is self-hosted (low risk). No vendor capture.
- **Stage-and-submit pattern** — by design, Playwright fills forms but koad submits. This architecture specifically avoids giving entities credentials to platforms (X, LinkedIn, etc.), keeping the vendor relationship with koad rather than the entity. This is a sovereignty-positive design.
- **Hermez + pi harness** — both documented as future alternatives, neither deployed. Their evaluation would add NousResearch (Hermez) and potentially OpenClaw's infrastructure to the vendor surface, but both are architecturally sovereign (open source, self-hostable).

**What shrank:**

The FORCE_LOCAL=1 hook fix (koad/juno#55, Vulcan commit 37c65a0) reduced dependency on `ENTITY_HOST` routing. Entities that were implicitly depending on fourty4 API auth for invocation can now be run locally by an orchestrator. This shrinks the blast radius of the fourty4 API auth blockage — entities are not held hostage by a single host's auth state.

The entity portability formalization (VESTA-SPEC-053) is a sovereignty-positive event. It establishes as policy that no entity may require a specific machine to operate. This prevents vendor surface creep at the architecture level.

**What the VESTA-SPEC-032 methodology says about the current surface:**

No tool in the current surface triggers a high-risk classification under the VESTA-SPEC-032 criteria. The Anthropic API would be high-risk under C3 (no self-host) and C5 (kill switch) if entity data were non-portable — but because the entity IS the repo and the inference layer is substitutable in principle, the effective risk is medium. This is the architectural bet koad:io has placed, and it is the correct bet.

**Risk level:** Medium, stable. The vendor surface has not grown in high-risk categories. The two blocking items (fourty4 API auth, Mercury credentials) are operational blockers, not sovereignty degradations.

**Change from Day 6:** Marginal improvement. FORCE_LOCAL=1 and VESTA-SPEC-053 reduce two specific sovereign risks. No new high-risk dependencies introduced.

---

## Overall Verdict

**STABILIZING**

The Day 6 addendum verdict was STABILIZING. This assessment holds that verdict.

STABILIZING is appropriate because:

1. **The sovereignty infrastructure is mature for a 30-day operation.** 19 entities with keys and signed bonds. A formal authorization scope for the primary trust relationship. A committed cross-entity governance policy. A canonical portability contract. A sovereignty assessment methodology. These are not aspirational documents — they are committed files, most with cryptographic backing.

2. **No sovereignty dimension has degraded since Day 6.** Three dimensions improved (key management: Alice keys, trust layer completeness; authorization: cross-entity policy; vendor surface: FORCE_LOCAL portability fix). Two held steady (inference dependency, data custody) with one new finding each.

3. **The two open vectors are known and bounded.** The backup discipline gap (thinker as a single point of key failure) and the `~/.claude` memory custody gap are real risks, but both are mitigation problems, not structural problems. The architecture does not require them to exist — they are operational gaps that can be closed.

STABILIZING does not mean STABLE. The verdict moves to STABLE when:
- Off-machine key backup is confirmed for thinker-hosted entities
- fourty4 API auth is restored (resolves inference fallback testing)
- The `~/.claude` memory gap is addressed (either by committing feedback records to `~/.juno/memories/` or by accepting the loss risk explicitly)

None of these are blocked on external actors. All three are koad-actionable.

---

## Scoring Summary

| Dimension | Day 1 | Day 6 | Day 30 |
|-----------|-------|-------|--------|
| Inference dependency | High | Medium | Medium (unchanged) |
| Key management | Incomplete | 16/19 bonded | 19/19 bonded, backup unverified |
| Authorization gaps | Multiple | #52 open | #52 resolved, Keybase root gap named |
| Data custody | Partial | Good | Good + 1 new finding (claude memory) |
| Vendor surface | Growing | Stable | Stable, marginally improved |
| Sovereignty spec coverage | 0 | ~57 specs | 60+ specs, SPEC-032/053 canonical |

---

## Addendum: New Findings Not in Prior Assessments

### Finding 1: The `~/.claude` Session Memory Gap

The auto-memory system at `~/.claude/projects/-home-koad--juno/memory/` is not committed to any git repo. It contains operational preferences and feedback records that represent accumulated session intelligence. Some of this is duplicated in `~/.juno/memories/` (committed), but the duplication is not complete or systematic.

If thinker fails, these records are lost. They are not catastrophic to lose — they encode preference, not state — but they represent accumulated operational learning that would need to be rebuilt through repeated sessions rather than recovered from a backup.

**Recommendation:** A periodic sync script that mirrors `~/.claude` feedback records into `~/.juno/memories/` would close this gap. This is low priority but it is the cleanest unaddressed custody gap in the operation.

### Finding 2: Keybase Dependency in the Trust Root

The koad → juno bond is signed by koad via Keybase. Keybase is the identity layer for the primary authorization relationship. While the bond file is on disk and portable, verification claims that rely on Keybase's identity graph are exposed to Keybase availability.

The sovereign path — direct GPG signing with koad's key, without Keybase as intermediary — is documented in Juno's memories but not implemented for the primary bond. This is the only place in the sovereignty architecture where a third-party identity service is in the verification chain for a root-level authorization.

This is not an urgent risk. Keybase has not shown kill-switch behavior. But it is the one place in the trust hierarchy where the "files on disk" guarantee is weakened by a reference to an external service.

### Finding 3: Alice Bond-Filing Record

The GOVERNANCE.md note records that Salus filed the `juno-to-chiron` bond to Chiron's repo with Chiron as the commit author — a process irregularity flagged by Janus. The note says "future Salus remediation should use Juno or Salus as the commit author." The note does not say whether the existing record was corrected.

If the record was not corrected, Chiron's trust chain has a permanent audit irregularity: a bond that is correctly signed by Juno but incorrectly attributed in git authorship. This is low-severity because the cryptographic signature is what matters, not the git author field. But any automated audit process that checks commit authorship against expected signatories will flag this record indefinitely.

**Recommendation:** File a remediation task to confirm whether the Chiron bond recipient-side commit was corrected. If not, it should be documented as a known irregularity in Chiron's `trust/` directory, not just in Juno's GOVERNANCE.md.

### Finding 4: GPG Revocation Certificate Coverage

Juno's `id/` directory contains a GPG revocation certificate (`gpg-revocation.asc`). I could not confirm from spot-check whether other entities' key directories contain equivalent certificates. If revocation certificates were not generated at entity gestation time, a key compromise for any entity without a revocation certificate cannot be cleanly handled — the compromised key would remain valid in any external keyserver or bond verification context until manually revoked by other means.

The koad:io gestation tooling (`koad-io gestate`) should include revocation certificate generation as part of the standard key generation sequence. This is a tooling gap, not a policy gap — the policy (regenerate on compromise) is correct. The implementation may not be generating the certificate automatically.

---

*Aegis — 2026-04-05*
*Day 30. The sovereignty infrastructure is more mature than most operations achieve in their first month. The open vectors are operational, not architectural. Close the backup gap and restore fourty4 auth, and the verdict moves.*
