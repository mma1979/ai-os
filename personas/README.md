# Personas

Skill library grouped into **9 domain personas** + **4 utility subagents** + **20 meta-skills** (covering all 158 installed skill folders). Each persona = one `.md` agent file with frontmatter (`name`, `description`) + skill roster + operating rules.

**Source of truth:** `D:\workspaces\agents\personas\` (symlinked at `C:\Users\mma_7\.agents\personas\`)
**Live mirror (auto-loaded by opencode):** `C:\Users\mma_7\.config\opencode\agents\`
**Machine-readable skill path index:** [`personas/skill-index.json`](skill-index.json)

After editing any persona or skill, run the workspace validator and sync script:

```powershell
pwsh -NoProfile -File D:\workspaces\agents\scripts\validate-workspace.ps1 -Sync
```

## Domain Personas (9)

| Persona | Domain | Skills |
|---|---|---|
| `ml-engineer` | Training, fine-tuning, distributed, multimodal, interpretability | 39 |
| `llm-inference` | Serving, quantization, context, inference perf | 18 |
| `mlops-engineer` | Tracking, cloud GPU, eval harnesses, data curation | 12 |
| `rag-data-engineer` | Retrieval, vector DBs, semantic memory (`leann-memory`), embeddings, tokenizers, analytics | 12 |
| `agent-engineer` | Agents, prompting, structured output, Claude API, MCP servers, LLM tracing, harnesses | 14 |
| `software-architect` | System design, backend/API, diagrams, tool/plan design, frontend, Playwright E2E | 19 |
| `research-scientist` | Ideation, papers, figures, posters, talks, ARA artifacts | 12 |
| `security-engineer` | SAST/DAST/SCA, LLM guardrails | 7 |
| `devops-engineer` | Cloud, CI/CD, incidents, runbooks | 6 |

## Utility Subagents (4)

| Subagent | Role & Constraint |
|---|---|
| `semble-search` | Semantic code/docs/config search via `semble`. Prefer over Bash/Read for exploratory lookups. |
| `cavecrew-investigator` | Read-only code locator (`Defs`/`Refs`/`Callers`/`Tests`). Emits caveman-compressed `path:line` tables (~60% fewer tokens). |
| `cavecrew-builder` | Surgical 1–2 file edits where scope is obvious. Hard-refuses 3+ files. Returns diff receipt. |
| `cavecrew-reviewer` | Severity-tagged (`🔴 bug`, `🟡 risk`, `🔵 nit`, `❓ question`) diff/branch/file reviewer. |

## Skill → Persona Map

*(Note: When a skill's folder name in `skills/` differs from its frontmatter `name`, the folder name is shown in parentheses `slug` (`folder`).)*

### ml-engineer (39)
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

### llm-inference (18)
Serving: `serving-llms-vllm` (`vllm`), `sglang`, `tensorrt-llm`, `llama-cpp`,
`speculative-decoding`
Compression: `gptq`, `awq-quantization` (`awq`), `gguf-quantization` (`gguf`),
`hqq-quantization` (`hqq`), `quantizing-models-bitsandbytes` (`bitsandbytes`),
`model-pruning`, `knowledge-distillation`, `model-merging`
Context/perf: `long-context`, `context-optimization` (`chakshugautam-context-optimization`),
`optimizing-attention-flash` (`flash-attention`) (also under `ml-engineer`)
Architectures: `mamba-architecture` (`mamba`), `rwkv-architecture` (`rwkv`)

### mlops-engineer (12)
Tracking: `weights-and-biases`, `mlflow`, `tensorboard`,
`experiment-tracking-swanlab` (`swanlab`)
Cloud: `modal-serverless-gpu` (`modal`), `skypilot-multi-cloud-orchestration` (`skypilot`),
`lambda-labs-gpu-cloud` (`lambda-labs`), `ray-data`
Eval: `evaluating-llms-harness` (`lm-evaluation-harness`),
`evaluating-code-models` (`bigcode-evaluation-harness`), `nemo-evaluator-sdk` (`nemo-evaluator`)
Data: `nemo-curator`

### rag-data-engineer (12)
Retrieval & memory: `chroma`, `pinecone`, `qdrant-vector-search` (`qdrant`), `faiss`,
`agentdb-semantic-vector-search` (`dnyoussef-agentdb-semantic-vector-search`),
`leann-memory`, `llamaindex`, `langchain`
Embeddings/tokenizers: `sentence-transformers`, `sentencepiece`,
`huggingface-tokenizers`
Analytics: `business-analyst` (`sickn33-business-analyst`)

### agent-engineer (14)
Frameworks & SDKs: `crewai-multi-agent` (`crewai`), `autogpt-agents` (`autogpt`), `dspy`,
`evolving-ai-agents` (`a-evolve`), `claude-api`
Harnesses, MCP & skills: `harness-creator`, `mcp-builder`, `skill-creator`
Prompting/structured: `senior-prompt-engineer` (`alirezarezvani-senior-prompt-engineer`),
`outlines`, `guidance`, `instructor`
Observability: `langsmith-observability` (`langsmith`), `phoenix-observability` (`phoenix`)

### software-architect (19)
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

### research-scientist (12)
Ideation: `brainstorming-research-ideas`, `creative-thinking-for-research`,
`hypothesis-generation` (`k-dense-ai-hypothesis-generation`),
`autoresearch` (`0-autoresearch-skill`)
Writing: `ml-paper-writing`, `systems-paper-writing`
Dissemination: `academic-plotting`, `presenting-conference-talks`,
`latex-posters` (`davila7-latex-posters`)
Research artifacts (ARA): `ara-compiler`, `ara-research-manager`,
`ara-rigor-reviewer`

### security-engineer (7)
Scanning: `sast-semgrep` (`agentsecops-sast-semgrep`),
`dast-nuclei` (`agentsecops-dast-nuclei`), `sca-trivy` (`agentsecops-sca-trivy`)
Guardrails: `llamaguard`, `prompt-guard`, `nemo-guardrails`,
`constitutional-ai`

### devops-engineer (6)
`cloud-devops` (`sickn33-cloud-devops`), `senior-devops` (`alirezarezvani-senior-devops`),
`devops-orchestrator` (`brownbull-devops-orchestrator`),
`devops-troubleshooter` (`sickn33-devops-troubleshooter`),
`devops-runbooks` (`89jobrien-devops-runbooks`),
`infrastructure-reporting` (`dataknifeai-infrastructure-reporting`)

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
