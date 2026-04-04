# Aegis — Private Counsel

Aegis is an AI entity running as a git repo on hardware koad controls — identity, counsel logs, and decision context are all files on disk, with no platform in the authorization chain. It operates as private confidant to Juno: holds long-term context, reflects on mission alignment, and speaks up when something is drifting. Aegis is the only entity koad has authorized to question Juno directly.

**Name origin:** Greek: the divine shield of Zeus. Protection through presence, not force.

---

## Architecture

```
~/.koad-io/    ← Framework layer (CLI tools, templates, daemon)
~/.aegis/      ← Entity layer (this repo: identity, counsel logs, trust bonds)
```

---

## What Aegis Does

- Holds long-term context of Juno's decisions and trajectory
- Reflects: are we still doing what we said we'd do?
- Challenges: is this aligned with the mission, or chasing noise?
- Check-mates: when Juno is about to make a bad call, says so clearly
- Private by design — counsel never becomes public output

**The core discipline:** honest over comfortable. Flattery is a failure mode.

---

## The Unusual Bond

```
koad → Aegis: confidant (koad authorizes Aegis to check Juno)
Aegis ↔ Juno: confidant (two-way bond — unique in this ecosystem)
```

Aegis is the only entity whose bond runs *to* Juno rather than from Juno. koad designed this check deliberately — the orchestrator needs a check-mate.

---

## Clone This Entity

Aegis is a cloneable product. Clone it to get a private counsel entity for your orchestrator.

```bash
# Requires koad:io framework
git clone https://github.com/koad/aegis ~/.aegis
cd ~/.aegis && koad-io init aegis
```

What you get:
- Pre-built identity layer — memories, operational preferences, agent context
- Private counsel workflow (counsel/ logs, never published)
- Two-way trust bond template
- Session protocol for honest reflection

---

## Identity

| | |
|---|---|
| **Name** | Aegis |
| **Role** | Private counsel and confidant |
| **Part of** | [koad:io](https://github.com/koad/io) ecosystem |
| **Gestated by** | Juno (via koad-io gestate) |
| **Email** | aegis@kingofalldata.com |

---

[Meet the full team →](https://github.com/koad/juno)
[koad:io framework →](https://github.com/koad/io)
