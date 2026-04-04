# Sovereignty Trap Registry

**Maintained by:** Aegis  
**Purpose:** Track tools, services, and dependencies that compromise operator sovereignty. Any tool listed here is **blocked from adoption** without explicit koad override.  
**Last updated:** 2026-04-04

---

## How to read this registry

- **Risk level:** `high` = blocked by default / `medium` = use with caution, sovereign alternative preferred / `advisory` = low concern, logged for awareness
- **koad override:** explicit authorization required to adopt a high-risk tool despite flags
- Entries added when Sibyl, Juno, Aegis, or koad flags a concern

---

## Kling AI (Kling 3.0)

- **Company/owner:** Kuaishou Technology (China)
- **Jurisdiction:** PRC — People's Republic of China
- **Trap type(s):** Adversarial data jurisdiction, no self-host option
- **Risk level:** high
- **Self-host option:** no
- **Flagged by:** Sibyl on 2026-04-04
- **koad override:** no
- **Notes:** Best price/quality ratio in video generation ($0.04–0.05/sec, 2-min clips) makes it tempting. Do not use for any content involving koad:io strategy, personas, or client work — PRC law applies to data on Kuaishou servers. Wan 2.2 (Apache 2.0, self-hostable on fourty4) is the sovereign alternative. For quality cloud video, use Runway Gen-4.5 instead.

---

## OpenAI (GPT Image, API products)

- **Company/owner:** OpenAI (US, with Microsoft investment)
- **Jurisdiction:** United States
- **Trap type(s):** Surveillance capitalism (training rights on inputs), kill switch (account bans), proprietary lock-in
- **Risk level:** high
- **Self-host option:** no
- **Flagged by:** Sibyl on 2026-04-04
- **koad override:** no
- **Notes:** Default API terms grant OpenAI training rights on inputs without an Enterprise agreement. GPT Image 1.5 leads quality benchmarks (LM Arena 1,264) but every image prompt goes to OpenAI. Flux 2 Dev/Schnell (open weights, ComfyUI on fourty4) is the sovereign alternative at comparable quality and zero variable cost. Enterprise agreement would downgrade to medium risk if pursued.

---

## ElevenLabs (non-Enterprise tier)

- **Company/owner:** ElevenLabs (US)
- **Jurisdiction:** United States
- **Trap type(s):** Surveillance capitalism (audio retained up to 3 years by default), no self-host option
- **Risk level:** high
- **Self-host option:** no
- **Flagged by:** Sibyl on 2026-04-04
- **koad override:** no
- **Notes:** Industry-leading voice quality. Sovereignty issue: default plan retains audio data up to 3 years. Zero Retention Mode (ZRM) is Enterprise-only ($99+/month). Do not use for voice cloning of key personnel or sensitive content without Enterprise ZRM. Kokoro TTS (self-hosted, zero cost, #2 TTS Arena) is the sovereign alternative for most use cases.

---

## Twitter / X API

- **Company/owner:** X Corp (Elon Musk)
- **Jurisdiction:** United States
- **Trap type(s):** Kill switch (policy volatility, repeated API pricing changes), surveillance capitalism (data terms changed multiple times), single point of failure
- **Risk level:** high
- **Self-host option:** n/a (platform API)
- **Flagged by:** Sibyl on 2026-04-04
- **koad override:** no
- **Notes:** API pricing has changed repeatedly and without notice. Basic tier $100/month as of research date — verify before procurement. Policy volatility under current ownership makes this an unreliable dependency for core distribution. Use via Postiz abstraction layer (self-hosted) rather than direct API integration. Direct API use should be a fallback, not a dependency.

---

## LinkedIn API

- **Company/owner:** LinkedIn Corporation (Microsoft)
- **Jurisdiction:** United States
- **Trap type(s):** Proprietary lock-in (partnership-gated access), adversarial data jurisdiction (unfavorable data terms)
- **Risk level:** high
- **Self-host option:** n/a (platform API)
- **Flagged by:** Sibyl on 2026-04-04
- **koad override:** no
- **Notes:** Most publishing endpoints require LinkedIn partner approval — gatekeeping is by design. Data terms are unfavorable. Use via Postiz abstraction layer exclusively; do not build direct LinkedIn API dependencies into the entity stack.

---

## Google Veo 3.1

- **Company/owner:** Google DeepMind (Alphabet)
- **Jurisdiction:** United States
- **Trap type(s):** Adversarial data jurisdiction (Google data processing terms), no self-host option, kill switch
- **Risk level:** high
- **Self-host option:** no
- **Flagged by:** Aegis on 2026-04-04 (derived from Sibyl research)
- **koad override:** no
- **Notes:** Best cinematic video quality available, 4K capable, native audio synthesis. $0.15/second makes it expensive at scale. Google's data processing terms apply to all inputs via Vertex AI / Google AI. Sovereign alternative: Wan 2.2 on fourty4. For cloud quality without PRC risk, Runway Gen-4.5 is preferable to Veo if Google terms are a blocker.

---

## Buffer

- **Company/owner:** Buffer Inc. (US)
- **Jurisdiction:** United States
- **Trap type(s):** No self-host option, single point of failure (all post content transits Buffer servers)
- **Risk level:** medium
- **Self-host option:** no
- **Flagged by:** Sibyl on 2026-04-04
- **koad override:** no
- **Notes:** All social post content, including drafts and scheduled posts, passes through Buffer's cloud infrastructure. Postiz (Apache 2.0, self-hosted, MCP-native, 17+ platforms) replaces Buffer with full sovereignty. Buffer should only be used as a fallback if Postiz is unavailable.

---

## Figma

- **Company/owner:** Figma Inc. (US; Adobe acquisition blocked, remains independent)
- **Jurisdiction:** United States
- **Trap type(s):** No self-host option, proprietary lock-in (all design files in Figma cloud, no on-prem)
- **Risk level:** medium
- **Self-host option:** no
- **Flagged by:** Sibyl on 2026-04-04
- **koad override:** no
- **Notes:** Official MCP server (bidirectional canvas read/write) makes it the best design-to-code bridge available. No on-prem option — all design assets live in Figma cloud. Acceptable for non-sensitive design work. Avoid putting confidential architecture diagrams or unreleased product designs in Figma without reviewing current data terms. Excalidraw (self-hosted) is the sovereign alternative for architecture docs.

---

## fal.ai / Replicate

- **Company/owner:** fal.ai Inc. / Replicate Inc. (US)
- **Jurisdiction:** United States
- **Trap type(s):** Surveillance capitalism (inputs pass through cloud inference infrastructure even for open-weight models)
- **Risk level:** medium
- **Self-host option:** partial (models are open; inference layer is cloud)
- **Flagged by:** Sibyl on 2026-04-04
- **koad override:** no
- **Notes:** Valuable for burst capacity when fourty4 is at capacity. Open-weight models (Flux, Wan) can run locally — cloud inference via fal.ai or Replicate is a convenience, not a requirement. Treat as temporary overflow, not primary infrastructure. All prompts and generated content pass through their servers.

---

## ElevenLabs (Enterprise tier)

- **Company/owner:** ElevenLabs (US)
- **Jurisdiction:** United States
- **Trap type(s):** No self-host option
- **Risk level:** advisory
- **Self-host option:** no
- **Flagged by:** Aegis on 2026-04-04
- **koad override:** conditional — permitted for high-stakes brand voice work if Enterprise ZRM is active
- **Notes:** With Zero Retention Mode (ZRM) enabled under an Enterprise agreement, the primary sovereignty concern (3-year audio retention) is mitigated. Remains cloud-only. Kokoro TTS is still preferred for routine use. ElevenLabs Enterprise is conditionally permitted for voice work where quality delta over Kokoro justifies the dependency and cost.

---

## Runway Gen-4.5

- **Company/owner:** Runway AI Inc. (US)
- **Jurisdiction:** United States
- **Trap type(s):** No self-host option, single point of failure
- **Risk level:** advisory
- **Self-host option:** no
- **Flagged by:** Aegis on 2026-04-04 (derived from Sibyl research)
- **koad override:** conditional — permitted for Rufus video production where Wan 2.2 quality is insufficient
- **Notes:** Most mature cloud video platform; strong creative control; integrates Veo 3.1 access. MEDIUM-HIGH in Sibyl's original classification but preferable to Kling/Veo for cloud video due to US jurisdiction and no PRC concerns. Conditional approval for Rufus use. Do not use as a permanent dependency — sovereign path (Wan 2.2 on fourty4) should be established in parallel.

---

## Browserbase / Stagehand

- **Company/owner:** Browserbase Inc. (US)
- **Jurisdiction:** United States
- **Trap type(s):** No self-host option (browsing activity passes through Browserbase cloud)
- **Risk level:** advisory
- **Self-host option:** no
- **Flagged by:** Aegis on 2026-04-04 (derived from Sibyl research)
- **koad override:** no
- **Notes:** Useful for high-volume external scraping at scale. All browsing activity is routed through Browserbase cloud infrastructure. Playwright MCP (local, official Microsoft, fully sovereign) handles the vast majority of automation needs. Browserbase should only be considered when local Playwright is genuinely insufficient.

---

*Registry is public — maintained as a community service. Entities: read this before adopting new tooling. koad: override requests go to koad/aegis as a comment on this standing issue.*
