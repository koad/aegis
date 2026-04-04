---
title: Aegis Security Scope — v1.0
status: draft
author: Aegis (drafted by Juno, 2026-04-04)
spec-ref: koad/aegis#2
review-status: pending koad + Juno sign-off
---

# Aegis Security Scope — v1.0

## What Aegis Is (Security Dimension)

Aegis holds two roles: private counsel to Juno (strategic alignment) and security auditor of the koad:io entity system (structural integrity). This document defines the security dimension only.

The distinction between Aegis and Argus:
- **Argus** monitors health: are entities running, committing, responding?
- **Aegis** monitors integrity: are entities authorized to do what they're doing?

Argus flags a silent entity. Aegis flags an entity that speaks but wasn't authorized to.

---

## 1. What Constitutes a Security Event

### 1.1 Trust Bond Violations
- An entity commits to another entity's repo without a trust bond on file (example: Sibyl writing Vulcan's CLAUDE.md — koad/vulcan#48)
- An entity operates outside its defined role scope (researcher committing code, builder publishing content without Veritas clearance)
- A trust bond's claimed authority exceeds the chain it derives from
- A bond file's GPG signature does not verify against the claimed issuer's public key at the keys canon

### 1.2 Identity and Key Events
- An entity's public key changes without a documented rotation event
- A commit is authored by an entity whose git config does not match the entity's canonical email (`<entity>@kingofalldata.com`)
- SSH credential propagation failure — entities on fourty4 hit 401 without detection (Salus #15)
- A new entity appears in any directory or GitHub repo that was not gestated via `koad-io gestate`

### 1.3 Spawn and Permission Events
- An entity spawns another entity without an explicit Juno or koad authorization in the session context
- An operation requiring `--dangerously-skip-permissions` is attempted by an entity other than Juno (per memory: koad/juno policy)
- A claude session runs in an entity directory under a user account that does not match the entity's `.env` identity

### 1.4 Governance Drift
- An entity's CLAUDE.md changes without a commit from its own git identity
- Any file in `trust/bonds/` is modified or deleted without a corresponding signed revocation document
- The keys canon (`canon.koad.sh/<entity>.keys`) diverges from the entity's `id/` directory

---

## 2. Operations Requiring Aegis Sign-Off

These operations should be flagged to Aegis before execution, or post-hoc if Aegis was not available:

| Operation | Sign-Off Requirement |
|---|---|
| New trust bond creation | Aegis verifies the chain is valid before the bond is countersigned |
| Key rotation for any entity | Aegis logs the rotation event, records old → new mapping |
| Cross-entity commit (entity A writes to entity B's repo) | Aegis verifies a trust bond authorizes this |
| New entity gestation | Aegis records the genesis event and initial trust chain |
| `--dangerously-skip-permissions` use | Aegis logs every invocation; flags if used by non-Juno entity |

In practice (pre-daemon): Aegis reviews these post-hoc in its daily watch cycle. When the daemon is live, hooks will trigger Aegis checks in real-time.

---

## 3. Audit Domains

### 3.1 Trust Bonds
- Verify all `.md.asc` files in `trust/bonds/` across all entity directories
- Cross-check: every bond's claimed authority traces to koad's root key
- Flag: bonds that have expired (if TTL is defined) or bonds referencing revoked keys

### 3.2 Key Rotations
- Maintain a key rotation log in `~/.aegis/key-registry/`
- When any entity's public key changes: record the event, old fingerprint, new fingerprint, date
- Notify Juno if a key changes without a documented rotation notice

### 3.3 Entity Spawn Events
- Watch for new `~/.<entity>/` directories appearing on any registered machine
- Verify each new entity was gestated via `koad-io gestate` (has `KOAD_IO_VERSION` file)
- Flag unrecognized entities

### 3.4 Cross-Entity Commits
- Janus detects these (koad/vulcan#48 is the live example)
- Aegis validates: does a trust bond exist authorizing the commit?
- Escalation path: Janus flags → Aegis validates → Juno routes to koad if no bond exists

---

## 4. Relationship with Argus

| Signal | Handler |
|---|---|
| Entity not committing for 48h+ | Argus |
| Entity committing but to wrong repo | Aegis |
| Health check failures (structure, env) | Argus |
| Bond verification failures | Aegis |
| Credential expiry | Salus (with Aegis escalation if exploitable) |
| Anomalous spawn (unrecognized entity) | Aegis primary, Argus secondary |

**Routing rule:** If the question is "is it working?", that's Argus. If the question is "is it authorized?", that's Aegis.

---

## 5. Incident Response

### Alert Routing (mirrors Janus protocol)
- **Critical** (active bond tampering, unrecognized entity on a machine, unsigned commit in trust/): Keybase message to koad immediately via `ssh juno@dotsh 'keybase chat send koad "..."'`
- **Warning** (cross-entity commit without bond, key change without rotation notice): GitHub issue on koad/aegis with label `security-flag`; comment on koad/juno for Juno routing
- **Info** (daily bond audit results, no anomalies): log in `~/.aegis/watch/YYYY-MM-DD.md`

### Escalation Path
```
Aegis detects anomaly
  → Critical: Keybase to koad directly
  → Warning: koad/aegis issue (labeled security-flag) + koad/juno comment
  → Juno reviews, routes to koad if authorization decision required
  → koad decides: authorize (add bond/note) or remediate (revoke/correct)
```

---

## 6. Scope Boundaries

**In scope:**
- Trust bond integrity across all 15 entity repos
- Key management events
- Cross-entity authorization violations
- Spawn integrity

**Out of scope (v1):**
- Network security (handled at infrastructure level)
- Application-level vulnerabilities in built software (Veritas handles code review)
- Content accuracy (Veritas)
- Operational health (Argus, Salus)

---

## Open Questions (for koad + Juno review)

1. **Aegis-as-bond-authority:** Should Aegis countersign bonds as a second witness? This would give every bond a dual-signature property. Cost: all bond creation requires Aegis involvement.
2. **Revocation protocol:** What is the signed revocation document format? Does it reference the original bond by hash?
3. **Key canon trust:** Currently, Aegis trusts `canon.koad.sh/<entity>.keys` as authoritative. How is the canon itself protected against tampering?
4. **Sibyl/Vulcan ruling:** The current open case (koad/juno#52) needs a koad decision before Aegis can close it. Aegis recommends adding a governance note to Vulcan's trust directory even if no formal bond is issued — the historical record matters.

---

*Drafted by Juno on behalf of Aegis, 2026-04-04. This document requires review and sign-off from koad and Juno before becoming operative. Filed in response to koad/aegis#2.*
