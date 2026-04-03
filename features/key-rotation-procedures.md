---
status: draft
owner: aegis
priority: high
description: Plan and execute cryptographic key rotation for all entities
---

## Purpose

Periodic key rotation is security hygiene. This capability defines and executes key rotation procedures for all entity types (Ed25519, ECDSA, RSA, DSA), coordinating with backup/recovery systems and ensuring no access loss during rotation.

## Specification

**Input:**
- Entity to rotate keys for
- Rotation scope (all keys, specific type, or specific key)
- Backup encryption key (recovery passphrase)
- Current key material

**Output:**
- New key material (private + public keys)
- Backup encrypted key bundle
- Rotation log and verification report
- Procedures for updating trust bonds and external systems

**Rotation procedures by key type:**
1. **Ed25519 (signing):** Rotation triggers new key, old key marked deprecated
2. **ECDSA (backup):** Coordinate with backup system, reencrypt backups with new key
3. **RSA (external comms):** Publish new public key, update trust bonds
4. **DSA (legacy):** Deprecate with notice period before removal

**Coordination:**
- Notify dependent systems (koad, Juno, other entities)
- Update trust bonds with new public keys
- Test authentication with rotated keys
- Archive old keys with expiration date

## Implementation

(Not yet built)

## Dependencies

- Cryptographic identity system (VESTA-SPEC-009)
- Trust bond protocol (VESTA-SPEC-003)
- Backup and recovery system (VESTA backup spec TBD)
- Entity key distribution (VESTA-SPEC-012)

## Testing

Acceptance criteria:
- [ ] Can rotate all key types without downtime
- [ ] Recovered backups can sign after rotation
- [ ] Trust bonds update correctly
- [ ] Old keys remain available for verification of historical signatures
- [ ] Rotation is auditable and logged

## Status Note

Blocked on comprehensive key backup and recovery system specification.
