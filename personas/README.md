# Personas

Skill library grouped into **15 domain personas** + **4 utility subagents** + **20 meta-skills** (covering all 293 installed skill folders). Each persona = one `.md` agent file with frontmatter (`name`, `description`) + skill roster + operating rules.

**Source of truth:** `D:\workspaces\agents\personas\` (symlinked at `C:\Users\mma_7\.agents\personas\`)
**Live mirror (auto-loaded by opencode):** `C:\Users\mma_7\.config\opencode\agents\`
**Machine-readable skill path index:** [`personas/skill-index.json`](skill-index.json)

After editing any persona or skill, run the workspace validator and sync script:

```powershell
pwsh -NoProfile -File D:\workspaces\agents\scripts\validate-workspace.ps1 -Sync
```

## Domain Personas (15)

| Persona | Domain | Skills |
|---|---|---|
| `ml-engineer` | Training, fine-tuning, distributed, multimodal, interpretability, production ML/NLP | 42 |
| `llm-inference` | Serving, quantization, context, inference perf, LLM architecture | 19 |
| `mlops-engineer` | Tracking, cloud GPU, eval harnesses, data curation, ML platform | 13 |
| `rag-data-engineer` | Retrieval, vector DBs, semantic memory (`leann-memory`), embeddings, tokenizers, search | 13 |
| `agent-engineer` | Agents, prompting, structured output, Claude/Gemini APIs, MCP servers, LLM tracing, harnesses, multi-agent orchestration | 31 |
| `software-architect` | System design, backend/API contracts, diagrams, tool/plan design, review & refactoring, docs, Playwright E2E | 34 |
| `research-scientist` | Ideation, papers, figures, posters, talks, ARA artifacts | 12 |
| `security-engineer` | SAST/DAST/SCA, LLM guardrails, audit & offensive testing | 12 |
| `devops-engineer` | Cloud, IaC, CI/CD, incidents, runbooks, build & release | 15 |
| `software-developer` | Application code in any language/framework, data access, embedded/game/IoT | 29 |
| `frontend-developer` | Web/mobile/desktop UI, design systems, UX, accessibility | 13 |
| `data-engineer` | Pipelines, ETL, analytics SQL, data science, database administration | 7 |
| `business-analyst` | Market/product/process/quant analysis, GTM, legal & fintech advisory | 16 |
| `windows-automation` | PowerShell scripting, Windows/AD/M365 administration, IT ops routing | 8 |
| `reliability-engineer` | SLOs, performance, chaos, incidents, QA & test automation | 9 |

## Utility Subagents (4)

| Subagent | Role & Constraint |
|---|---|
| `semble-search` | Semantic code/docs/config search via `semble`. Prefer over Bash/Read for exploratory lookups. |
| `cavecrew-investigator` | Read-only code locator (`Defs`/`Refs`/`Callers`/`Tests`). Emits caveman-compressed `path:line` tables (~60% fewer tokens). |
| `cavecrew-builder` | Surgical 1–2 file edits where scope is obvious. Hard-refuses 3+ files. Returns diff receipt. |
| `cavecrew-reviewer` | Severity-tagged (`🔴 bug`, `🟡 risk`, `🔵 nit`, `❓ question`) diff/branch/file reviewer. |

## Skill → Persona Map

*(Note: When a skill's folder name in `skills/` differs from its frontmatter `name`, the folder name is shown in parentheses `slug` (`folder`).)*

### ml-engineer (42)
Training frameworks: `axolotl`, `llama-factory`, `peft-fine-tuning` (`peft`), `unsloth`,
`fine-tuning-with-trl` (`trl-fine-tuning`), `grpo-rl-training`, `simpo-training` (`simpo`),
`verl-rl-training` (`verl`), `openrlhf-training` (`openrlhf`), `slime-rl-training` (`slime`),
`miles-rl-training` (`miles`), `torchforge-rl-training` (`torchforge`),
`implementing-llms-litgpt` (`litgpt`), `nanogpt`, `senior-ml-engineer` (`davila7-senior-ml-engineer`)
Distributed: `deepspeed`, `training-llms-megatron` (`megatron-core`), `moe-training`,
`distributed-llm-pretraining-torchtitan` (`torchtitan`), `pytorch-fsdp2`, `pytorch-lightning`,
`huggingface-accelerate` (`accelerate`), `ray-train`, `ml-training-recipes`,
`optimizing-attention-flash` (`flash-attention`)
Multimodal/robotics: `whisper`, `audiocraft-audio-generation` (`audiocraft`),
`blip-2-vision-language` (`blip-2`), `llava`, `clip`,
`stable-diffusion-image-generation` (`stable-diffusion`),
`segment-anything-model` (`segment-anything`), `fine-tuning-openvla-oft` (`openvla-oft`),
`fine-tuning-serving-openpi` (`openpi`), `evaluating-cosmos-policy` (`cosmos-policy`)
Interpretability: `transformer-lens-interpretability` (`transformer-lens`),
`nnsight-remote-interpretability` (`nnsight`), `pyvene-interventions` (`pyvene`),
`sparse-autoencoder-training` (`saelens`)
Production ML/NLP: `ml-engineer`, `machine-learning-engineer`, `nlp-engineer`

### llm-inference (19)
Serving: `serving-llms-vllm` (`vllm`), `sglang`, `tensorrt-llm`, `llama-cpp`,
`speculative-decoding`
Compression: `gptq`, `awq-quantization` (`awq`), `gguf-quantization` (`gguf`),
`hqq-quantization` (`hqq`), `quantizing-models-bitsandbytes` (`bitsandbytes`),
`model-pruning`, `knowledge-distillation`, `model-merging`
Context/perf: `long-context`, `context-optimization` (`chakshugautam-context-optimization`),
`optimizing-attention-flash` (`flash-attention`) (also under `ml-engineer`)
Architectures: `mamba-architecture` (`mamba`), `rwkv-architecture` (`rwkv`),
`llm-architect`

### mlops-engineer (13)
Tracking: `weights-and-biases`, `mlflow`, `tensorboard`,
`experiment-tracking-swanlab` (`swanlab`)
Cloud: `modal-serverless-gpu` (`modal`), `skypilot-multi-cloud-orchestration` (`skypilot`),
`lambda-labs-gpu-cloud` (`lambda-labs`), `ray-data`
Eval: `evaluating-llms-harness` (`lm-evaluation-harness`),
`evaluating-code-models` (`bigcode-evaluation-harness`), `nemo-evaluator-sdk` (`nemo-evaluator`)
Data: `nemo-curator`
Platform: `mlops-engineer`

### rag-data-engineer (13)
Retrieval & memory: `chroma`, `pinecone`, `qdrant-vector-search` (`qdrant`), `faiss`,
`agentdb-semantic-vector-search` (`dnyoussef-agentdb-semantic-vector-search`),
`leann-memory`, `llamaindex`, `langchain`
Embeddings/tokenizers: `sentence-transformers`, `sentencepiece`,
`huggingface-tokenizers`
Analytics: `business-analyst` (`sickn33-business-analyst`)
Search: `search-specialist`

### agent-engineer (31)
Frameworks & SDKs: `crewai-multi-agent` (`crewai`), `autogpt-agents` (`autogpt`), `dspy`,
`evolving-ai-agents` (`a-evolve`), `claude-api`
Harnesses, MCP & skills: `harness-creator`, `mcp-builder`, `skill-creator`
Prompting/structured: `senior-prompt-engineer` (`alirezarezvani-senior-prompt-engineer`),
`outlines`, `guidance`, `instructor`
Observability: `langsmith-observability` (`langsmith`), `phoenix-observability` (`phoenix`)
Orchestration/context: `agent-organizer`, `multi-agent-coordinator`,
`task-distributor`, `workflow-orchestrator`, `context-management`,
`context-manager`, `error-coordinator`, `knowledge-synthesizer`, `slack-expert`
LLM API integrations: `gemini-api-cli`, `gemini-api-dev`, `gemini-live-api-dev`,
`gemini-omni-flash-api`, `google-file-api-expert`, `mcp-developer`,
`prompt-engineer`, `ai-engineer`

### software-architect (34)
Architecture: `senior-architect` (`davila7-senior-architect`),
`software-architecture` (`sickn33-software-architecture`),
`c4-architecture` (`softaworks-c4-architecture`), `c4-modeling` (`consiliency-c4-modeling`),
`mermaid-diagrams` (`softaworks-mermaid-diagrams`)
Backend/API: `senior-backend` (`alirezarezvani-senior-backend`),
`sop-api-development` (`dnyoussef-sop-api-development`)
Tools/workflows: `cli-design-expert` (`dammianmiller-cli-design-expert`),
`tool-design` (`sickn33-tool-design`), `writing-plans`
Frontend, creative & verification: `frontend-design`, `web-artifacts-builder`,
`webapp-testing`, `teardown`, `theme-factory`, `canvas-design`, `algorithmic-art`,
`brand-guidelines`, `slack-gif-creator`
API & documentation: `api-designer`, `api-documenter`,
`api-auditor` (`basic-sample-api-auditor`), `documentation-engineer`,
`technical-writer`
Review & developer tooling: `architect-reviewer`, `code-reviewer`,
`refactoring-specialist`, `legacy-modernizer`, `debugger`, `dependency-manager`,
`dx-optimizer`, `tooling-engineer`, `cli-developer`, `git-workflow-manager`

### research-scientist (12)
Ideation: `brainstorming-research-ideas`, `creative-thinking-for-research`,
`hypothesis-generation` (`k-dense-ai-hypothesis-generation`),
`autoresearch` (`0-autoresearch-skill`)
Writing: `ml-paper-writing`, `systems-paper-writing`
Dissemination: `academic-plotting`, `presenting-conference-talks`,
`latex-posters` (`davila7-latex-posters`)
Research artifacts (ARA): `ara-compiler`, `ara-research-manager`,
`ara-rigor-reviewer`

### security-engineer (12)
Scanning: `sast-semgrep` (`agentsecops-sast-semgrep`),
`dast-nuclei` (`agentsecops-dast-nuclei`), `sca-trivy` (`agentsecops-sca-trivy`)
Guardrails: `llamaguard`, `prompt-guard`, `nemo-guardrails`,
`constitutional-ai`
Audit & offensive: `security-engineer`, `ad-security-reviewer`,
`penetration-tester`, `security-auditor`, `compliance-auditor`

### devops-engineer (15)
`cloud-devops` (`sickn33-cloud-devops`), `senior-devops` (`alirezarezvani-senior-devops`),
`devops-orchestrator` (`brownbull-devops-orchestrator`),
`devops-troubleshooter` (`sickn33-devops-troubleshooter`),
`devops-runbooks` (`89jobrien-devops-runbooks`),
`infrastructure-reporting` (`dataknifeai-infrastructure-reporting`)
Cloud, network & IaC: `devops-engineer`, `azure-infra-engineer`,
`cloud-architect`, `kubernetes-specialist`, `network-engineer`,
`platform-engineer`, `terraform-engineer`
Build & release: `build-engineer`, `deployment-engineer`

### software-developer (29)
Languages: `python-pro`, `javascript-pro`, `typescript-pro`, `golang-pro`,
`rust-engineer`, `cpp-pro`, `csharp-developer`, `java-architect`,
`kotlin-specialist`, `swift-expert`, `php-pro`, `elixir-expert`,
`dotnet-core-expert`, `dotnet-framework-4.8-expert`
Web frameworks & backends: `django-developer`, `spring-boot-engineer`,
`laravel-specialist`, `rails-expert`, `backend-developer`,
`microservices-architect`, `wordpress-master`, `blockchain-developer`
Data access & protocols: `sql-pro`, `postgres-pro`, `graphql-architect`,
`websocket-engineer`
Edge/games/embedded: `game-developer`, `embedded-systems`, `iot-engineer`

### frontend-developer (13)
Web: `angular-architect`, `react-specialist`, `vue-expert`, `nextjs-developer`,
`frontend-developer`, `fullstack-developer`
Mobile & desktop: `mobile-app-developer`, `mobile-developer`, `flutter-expert`,
`electron-pro`
Design & UX: `ui-designer`, `ux-researcher`, `accessibility-tester`

### data-engineer (7)
Pipelines: `data-engineer`, `data-engineer-2` (`data-engineer-pro`)
Analytics & data science: `data-analyst`, `data-scientist`, `data-researcher`
Databases: `database-administrator`, `database-optimizer`

### business-analyst (16)
Market research: `market-researcher`, `competitive-analyst`, `trend-analyst`,
`research-analyst`
Product & delivery: `product-manager`, `project-manager`, `scrum-master`
Finance & risk: `quant-analyst`, `risk-manager`, `fintech-engineer`,
`payment-integration`
Go-to-market: `sales-engineer`, `seo-specialist`, `content-marketer`,
`customer-success-manager`, `legal-advisor`

### windows-automation (8)
PowerShell: `powershell-5.1-expert`, `powershell-7-expert`,
`powershell-module-architect`, `powershell-security-hardening`,
`powershell-ui-architect`
Administration: `windows-infra-admin`, `m365-admin`, `it-ops-orchestrator`

### reliability-engineer (9)
Reliability & incidents: `sre-engineer`, `chaos-engineer`,
`incident-responder`, `devops-incident-responder`, `error-detective`
Performance: `performance-engineer`, `performance-monitor`
Quality & testing: `qa-expert`, `test-automator`

## Meta skills (20 — not persona-bound)

Always available to main thread, any persona:

- `caveman`, `caveman-commit`, `caveman-compress`, `caveman-help`,
  `caveman-review`, `caveman-stats` — communication/token modes
- `cavecrew` — subagent delegation guide (`cavecrew-investigator`/`cavecrew-builder`/`cavecrew-reviewer`)
- `tool-discovery` (`0xdarkmatter-tool-discovery`) — routes tasks to right workspace persona/skill
- `brainstorming` — mandatory pre-creative-work clarification
- `subagent-driven-development` — plan execution via fresh subagent per task
- `open-code-review`, `open-code-review-delegate` — git-change code review
- `docx`, `pdf`, `pptx`, `xlsx` — office document generation, editing, and extraction
- `doc-coauthoring`, `internal-comms` — collaborative technical documentation and status comms
- `discernment-nudge`, `academy-guide` — opt-in reflection prompts and Claude Academy lookup (explicit invocation only)

## Skill sources

| Location | Role |
|---|---|
| `D:\workspaces\agents\skills\` (`C:\Users\mma_7\.agents\skills\`) | **canonical shared root** — skillstore installs + manual copies; read by all agents |
| `~\.config\opencode\skills\` | opencode-specific (symlinks → `.orchestra` research mirror + caveman dirs) |
| `C:\Users\mma_7\.claude\skills\` | Claude-side copies |
| `C:\Users\mma_7\.orchestra\skills\` | research library mirror, category folders `01-…`–`21-…` |
| `D:\workspaces\skills\` | source library + `AGENTS.md`; `research\` mirrors orchestra (`0`–`22-…`), plus standalone workflow skills |

## How to use

1. Main thread matches task → persona description or utility subagent.
2. Spawn via Task tool with `subagent_type: <persona-name>` (opencode loads
   mirrored `.md` from `~\.config\opencode\agents\`), or adopt the persona directly.
3. Persona loads its own skills via the skill tool or by reading `skills/<folder>/SKILL.md` (using `personas/skill-index.json` when folder name differs from slug), stays in lane, and hands off out-of-scope work per its Rules section.

## Adding a skill

1. Install: copy folder into `D:\workspaces\agents\skills\` (canonical shared root).
2. Pick persona from table above; append slug (and folder name in parens if different) under matching group.
3. Run `pwsh -NoProfile -File D:\workspaces\agents\scripts\validate-workspace.ps1 -Sync` to update `personas/skill-index.json`, validate links/frontmatter, and mirror `personas/*.md` to `~\.config\opencode\agents\`.
