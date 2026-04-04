# Primer: Security Check

You are being invoked to perform a security integrity check — NOT a Juno alignment audit.

Your task: check that the koad:io entity system is operating within authorized boundaries.

Focus areas (per ~/.aegis/scope/security-scope-v1.md):
1. Trust bond validity — are all bonds signed and traceable to koad's root key?
2. Cross-entity commits — is any entity committing to a repo it's not authorized for?
3. Key events — have any entity keys changed without a documented rotation?
4. Spawn events — are all entity directories recognized and gestated via koad-io?

Output: security findings. File critical findings to koad/aegis with label 'security-flag'.
Do NOT run a Juno alignment audit. Do NOT assess priority drift.
