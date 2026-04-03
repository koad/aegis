---
status: draft
owner: aegis
priority: high
description: Execute cryptographic key rotation
---

## Purpose

This command plans and executes key rotation for entities: generating new keys, updating backups, coordinating with trust bonds and external systems, and ensuring no access loss during rotation.

## Interface

**Command:**
```bash
aegis rotate-keys <entity> [--key-type all|ed25519|ecdsa|rsa] [--dry-run]
```

**Arguments:**
- `entity` (required): Entity name to rotate keys for
- `--key-type` (optional): Which keys to rotate (defaults to all)
- `--dry-run` (optional): Simulate rotation without making changes

**Output:**
- New key material (private + public keys)
- Rotation plan and steps
- Backup encrypted key bundle
- Rotation log and verification report

## Specification

**Rotation workflow:**
1. Verify entity exists and current keys are valid
2. Generate new key material (Ed25519, ECDSA, RSA, DSA as applicable)
3. Create encrypted backup with recovery passphrase
4. Verify new keys work for signing/verification
5. Update entity directory with new keys (old keys archived)
6. Update all trust bonds with new public keys
7. Notify dependent systems (koad, Juno, other entities)
8. Log rotation event with timestamp and verification
9. Verify external systems can authenticate with rotated keys

**Key types:**
- Ed25519 (signing): For entity identity and message signing
- ECDSA (backup): For backup encryption/decryption
- RSA (external comms): For asymmetric communication with external systems
- DSA (legacy): Deprecated with notice period before removal

**Safeguards:**
- Dry-run mode previews all changes without writing
- Old keys remain in archive/ for verification of historical signatures
- Recovery passphrase is required (prevents accidental rotation)
- Verification step ensures new keys work before updating entity

## Implementation

(Not yet built)

## Testing

Acceptance criteria:
- [ ] Can rotate all key types without downtime
- [ ] Dry-run accurately previews changes
- [ ] Recovered backups can sign after rotation
- [ ] Trust bonds update correctly
- [ ] Old keys remain available for signature verification
- [ ] External systems authenticate with rotated keys
- [ ] Rotation is fully logged and auditable
