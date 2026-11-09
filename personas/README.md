# Personas

Skill library grouped into 9 personas. Each persona = one `.md` agent file with
frontmatter (`name`, `description`) + skill roster + operating rules.

**Source of truth:** `C:\Users\mma_7\.agents\personas\`
**Live mirror (auto-loaded by opencode):** `C:\Users\mma_7\.config\opencode\agents\`

After editing a persona, copy it to the mirror:

```powershell
Copy-Item C:\Users\mma_7\.agents\personas\*.md C:\Users\mma_7\.config\opencode\agents\ -Force
```

## Personas

| Persona | Domain | Skills |
|---|---|---|
| `ml-engineer` | Training, fine-tuning, distributed, multimodal, interpretability | 39 |
| `llm-inference` | Serving, quantization, context, inference perf | 17 |
| `mlops-engineer` | Tracking, cloud GPU, eval harnesses, data curation | 12 |
| `rag-data-engineer` | Retrieval, vector DBs, embeddings, tokenizers, analytics | 11 |
| `agent-engineer` | Agents, prompting, structured output, LLM tracing, harnesses | 11 |
| `software-architect` | System design, backend/API, diagrams, tool/plan design, frontend | 11 |
| `research-scientist` | Ideation, papers, figures, posters, talks, ARA artifacts | 12 |
| `security-engineer` | SAST/DAST/SCA, LLM guardrails | 7 |
| `devops-engineer` | Cloud, CI/CD, incidents, runbooks | 6 |

## Skill → persona map

### ml-engineer (39)
Training frameworks: `axolotl`, `llama-factory`, `peft-fine-tuning`, `unsloth`,
`fine-tuning-with-trl`, `grpo-rl-training`, `simpo-training`, `verl-rl-training`, `openrlhf-training`, `slime-rl-training`,
`miles-rl-training`, `torchforge-rl-training`, `implementing-llms-litgpt`, `nanogpt`, `senior-ml-engineer`
Distributed: `deepspeed`, `training-llms-megatron`, `moe-training`, `distributed-llm-pretraining-torchtitan`,
`pytorch-fsdp2`, `pytorch-lightning`, `huggingface-accelerate`, `ray-train`,
`ml-training-recipes`, `optimizing-attention-flash`
Multimodal/robotics: `whisper`, `audiocraft-audio-generation`, `blip-2-vision-language`, `llava`, `clip`,
`stable-diffusion-image-generation`, `segment-anything-model`,
`fine-tuning-openvla-oft`, `fine-tuning-serving-openpi`,
`evaluating-cosmos-policy`
Interpretability: `transformer-lens-interpretability`,
`nnsight-remote-interpretability`, `pyvene-interventions`,
`sparse-autoencoder-training`

### llm-inference (17)
Serving: `serving-llms-vllm`, `sglang`, `tensorrt-llm`, `llama-cpp`,
`speculative-decoding`
Compression: `gptq`, `awq-quantization`, `gguf-quantization`, `hqq-quantization`,
`quantizing-models-bitsandbytes`, `model-pruning`, `knowledge-distillation`,
`model-merging`
Context/perf: `long-context`, `context-optimization`,
`optimizing-attention-flash` (also under ml-engineer)
Architectures: `mamba-architecture`, `rwkv-architecture`

### mlops-engineer (12)
Tracking: `weights-and-biases`, `mlflow`, `tensorboard`,
`experiment-tracking-swanlab`
Cloud: `modal-serverless-gpu`, `skypilot-multi-cloud-orchestration`,
`lambda-labs-gpu-cloud`, `ray-data`
Eval: `evaluating-llms-harness`, `evaluating-code-models`,
`nemo-evaluator-sdk`
Data: `nemo-curator`

### rag-data-engineer (11)
Retrieval: `chroma`, `pinecone`, `qdrant-vector-search`, `faiss`,
`agentdb-semantic-vector-search`, `llamaindex`, `langchain`
Embeddings/tokenizers: `sentence-transformers`, `sentencepiece`,
`huggingface-tokenizers`
Analytics: `business-analyst`

### agent-engineer (11)
Frameworks: `crewai-multi-agent`, `autogpt-agents`, `dspy`,
`evolving-ai-agents`
Harnesses: `harness-creator`
Prompting/structured: `senior-prompt-engineer`, `outlines`, `guidance`,
`instructor`
Observability: `langsmith-observability`, `phoenix-observability`

### software-architect (11)
Architecture: `senior-architect`, `software-architecture`,
`c4-architecture`, `c4-modeling`, `mermaid-diagrams`
Backend/API: `senior-backend`, `sop-api-development`
Tools/workflows: `cli-design-expert`, `tool-design`, `writing-plans`
Frontend/creative: `frontend-design`, `teardown`

### research-scientist (12)
Ideation: `brainstorming-research-ideas`, `creative-thinking-for-research`,
`hypothesis-generation`, `autoresearch`
Writing: `ml-paper-writing`, `systems-paper-writing`
Dissemination: `academic-plotting`, `presenting-conference-talks`,
`latex-posters`
Research artifacts (ARA): `ara-compiler`, `ara-research-manager`,
`ara-rigor-reviewer`

### security-engineer (7)
Scanning: `sast-semgrep`, `dast-nuclei`, `sca-trivy`
Guardrails: `llamaguard`, `prompt-guard`, `nemo-guardrails`,
`constitutional-ai`

### devops-engineer (6)
`cloud-devops`, `senior-devops`, `devops-orchestrator`,
`devops-troubleshooter`, `devops-runbooks`, `infrastructure-reporting`

## Meta skills (not persona-bound)

Always available to main thread, any persona:

- `caveman`, `caveman-commit`, `caveman-compress`, `caveman-help`,
  `caveman-review`, `caveman-stats` — communication/token modes
- `cavecrew` — subagent delegation guide (investigator/builder/reviewer)
- `tool-discovery` — routes tasks to right agent/skill
- `brainstorming` — mandatory pre-creative-work clarification
- `subagent-driven-development` — plan execution via fresh subagent per task
- `open-code-review`, `open-code-review-delegate` — git-change code review

## Skill sources

| Location | Role |
|---|---|
| `C:\Users\mma_7\.agents\skills\` | **canonical shared root** — skillstore installs + manual copies; read by all agents |
| `~\.config\opencode\skills\` | opencode-specific (symlinks → `.orchestra` research mirror + caveman dirs) |
| `C:\Users\mma_7\.claude\skills\` | Claude-side copies |
| `C:\Users\mma_7\.orchestra\skills\` | research library mirror, category folders `01-…`–`21-…` |
| `D:\workspaces\skills\` | source library + `AGENTS.md`; `research\` mirrors orchestra (`0`–`22-…`), plus standalone workflow skills |

Note: `leann-memory` is installed in `.agents\skills` but has no `SKILL.md`
(OpenClaw `instructions.md`/`claw.json` format) — available to OpenClaw, not
loadable as a skill.

## How to use

1. Main thread matches task → persona description.
2. Spawn via Task tool with `subagent_type: <persona-name>` (opencode loads
   mirrored `.md` from `~\.config\opencode\agents\`).
3. Persona loads its own skills via the skill tool, stays in lane, hands
   off out-of-scope work per its Rules section.

## Adding a skill

1. Install: copy folder into `.agents\skills\` (canonical shared root, see
   Skill sources); skillstore installs land there too.
2. Pick persona from table above; append slug under matching group.
   Slug = `SKILL.md` frontmatter `name` (dir name may differ, e.g. dir
   `davila7-senior-ml-engineer` → name `senior-ml-engineer`).
3. Copy updated persona `.md` to the opencode agents mirror.
