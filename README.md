# Agents Workspace & Skill Library

> Canonical central hub for AI coding agent personas, skill library, and operational harnesses.

[![Harness Validation](https://img.shields.io/badge/Harness_Score-100%2F100-brightgreen.svg)](#harness-architecture--verification)
[![Skills Indexed](https://img.shields.io/badge/Skills-293_Loaded-blue.svg)](personas/skill-index.json)
[![Domain Personas](https://img.shields.io/badge/Personas-15_Domain_+_4_Utility-purple.svg)](personas/README.md)

---

## Overview

This repository is the canonical source of truth for agent personas, specialized skills, and execution harnesses used across Claude Code, OpenCode, and Antigravity. It is symlinked globally to `~/.agents` (`C:\Users\mma_7\.agents\`) and automatically mirrored to runtime config paths.

The workspace enforces strict **context economy**, **progressive disclosure**, **traceable handoffs**, and **zero-broken-reference integrity**.

---

## Architecture & Layout

```text
d:\workspaces\agents\
├── AGENTS.md                  # Core rules of engagement & agent operating instructions
├── feature_list.json          # Harness feature tracker & dependency state
├── progress.md                # Persistent session progress ledger
├── session-handoff.md         # Multi-session handoff & recovery template
├── init.sh                    # Universal harness initialization & verification script
├── scripts/
│   └── validate-workspace.ps1 # Workspace integrity checker, indexer & mirror sync
├── personas/                  # Domain personas (15) & utility subagents (4)
│   ├── README.md              # Personas roster, mappings & operational guide
│   ├── skill-index.json       # O(1) slug-to-folder machine-readable lookup
│   ├── agent-engineer.md      # Agents, prompts, MCP servers, tracing
│   ├── software-architect.md  # System design, backend/API, diagrams, UI & Playwright
│   ├── ml-engineer.md         # SFT, LoRA, RLHF/GRPO, distributed, interpretability
│   ├── llm-inference.md       # Serving (vLLM/SGLang), quantization, long-context
│   ├── mlops-engineer.md      # W&B/MLflow, cloud GPU (Modal/SkyPilot), evals
│   ├── rag-data-engineer.md   # Vector search, LEANN memory, RAG, tokenizers
│   ├── research-scientist.md  # Research ideation, papers, posters, ARA artifacts
│   ├── security-engineer.md   # SAST (Semgrep), DAST (Nuclei), SCA (Trivy), guardrails
│   ├── devops-engineer.md     # Cloud infra, K8s, Terraform, CI/CD, incident runbooks
│   ├── software-developer.md  # Application code in any language/framework
│   ├── frontend-developer.md  # Web/mobile UI, design systems, UX, accessibility
│   ├── data-engineer.md       # Pipelines, ETL, analytics SQL, databases
│   ├── business-analyst.md    # Market/product/quant analysis, GTM, legal advisory
│   ├── windows-automation.md  # PowerShell, Windows/AD/M365 administration
│   ├── reliability-engineer.md # SLOs, performance, chaos, incidents, QA testing
│   ├── semble-search.md       # Semantic code & docs search subagent
│   ├── cavecrew-investigator.md # Read-only symbol/caller locator (~60% token savings)
│   ├── cavecrew-builder.md    # Surgical 1–2 file edit subagent
│   └── cavecrew-reviewer.md   # Severity-tagged diff & PR review subagent
└── skills/                    # 293 specialized skills across all technical domains
    ├── 0xdarkmatter-tool-discovery/ # Workspace-aware persona & skill router
    ├── harness-creator/       # Coding agent harness creator, auditor & benchmark
    ├── leann-memory/          # Compressed local semantic memory search (leann-core)
    └── ... (289 other domain skills)
```

---

## Personas & Subagents

Every task is routed through a domain persona or a token-efficient utility subagent:

### 1. Domain Personas (15)

| Persona | Primary Focus | Key Skills & Tools |
|---|---|---|
| [`agent-engineer`](personas/agent-engineer.md) | Agent loops, tool/MCP design, structured outputs, tracing, harnesses, multi-agent orchestration | `harness-creator`, `mcp-builder`, `skill-creator`, `claude-api`, `gemini-api-dev`, `dspy`, `instructor` |
| [`software-architect`](personas/software-architect.md) | System design, C4/Mermaid diagrams, API design, plans, code review & refactoring, docs, Playwright | `c4-architecture`, `mermaid-diagrams`, `writing-plans`, `code-reviewer`, `api-designer`, `webapp-testing` |
| [`ml-engineer`](personas/ml-engineer.md) | Training, fine-tuning (LoRA/TRL), RLHF/GRPO, distributed launch, robotics, production ML/NLP | `peft`, `unsloth`, `grpo-rl-training`, `verl`, `deepspeed`, `pytorch-fsdp2`, `flash-attention` |
| [`llm-inference`](personas/llm-inference.md) | Serving engines, quantization (GGUF/AWQ/GPTQ), speculative decoding, KV cache, LLM architecture | `vllm`, `sglang`, `tensorrt-llm`, `gguf`, `awq`, `speculative-decoding`, `long-context`, `llm-architect` |
| [`mlops-engineer`](personas/mlops-engineer.md) | Experiment tracking, cloud GPU orchestration, benchmark eval suites, data curation, ML platform | `weights-and-biases`, `mlflow`, `modal`, `skypilot`, `lm-evaluation-harness`, `nemo-curator` |
| [`rag-data-engineer`](personas/rag-data-engineer.md) | Vector stores, local semantic memory, embeddings, tokenizers, search, analytics | `qdrant`, `chroma`, `pinecone`, `leann-memory`, `sentence-transformers`, `search-specialist` |
| [`research-scientist`](personas/research-scientist.md) | Research ideation, autonomous loops (`autoresearch`), papers, academic plots, posters | `autoresearch`, `hypothesis-generation`, `ml-paper-writing`, `academic-plotting`, `ara-compiler` |
| [`security-engineer`](personas/security-engineer.md) | Vulnerability scanning (SAST/DAST/SCA), LLM guardrails, audit & penetration testing | `sast-semgrep`, `dast-nuclei`, `sca-trivy`, `llamaguard`, `penetration-tester` |
| [`devops-engineer`](personas/devops-engineer.md) | Cloud infra (AWS/GCP/Azure), Kubernetes, Terraform, CI/CD, runbooks, build & release | `cloud-devops`, `senior-devops`, `kubernetes-specialist`, `terraform-engineer`, `deployment-engineer` |
| [`software-developer`](personas/software-developer.md) | Application code in any language/framework, DB access, GraphQL, embedded/game/IoT | `python-pro`, `golang-pro`, `rust-engineer`, `csharp-developer`, `sql-pro`, `microservices-architect` |
| [`frontend-developer`](personas/frontend-developer.md) | Web/mobile/desktop UI, design systems, UX research, accessibility | `react-specialist`, `angular-architect`, `vue-expert`, `flutter-expert`, `ui-designer`, `accessibility-tester` |
| [`data-engineer`](personas/data-engineer.md) | Data pipelines, ETL/ELT, analytics SQL, data science, database administration | `data-engineer`, `data-analyst`, `database-administrator`, `database-optimizer` |
| [`business-analyst`](personas/business-analyst.md) | Market/product/quant analysis, GTM/SEO, project delivery, legal & fintech advisory | `market-researcher`, `product-manager`, `quant-analyst`, `risk-manager`, `payment-integration` |
| [`windows-automation`](personas/windows-automation.md) | PowerShell 5.1/7 automation, Windows/AD/GPO/M365 administration | `powershell-7-expert`, `windows-infra-admin`, `m365-admin`, `it-ops-orchestrator` |
| [`reliability-engineer`](personas/reliability-engineer.md) | SLOs, performance & load testing, chaos, incidents, QA & test automation | `sre-engineer`, `chaos-engineer`, `performance-engineer`, `qa-expert`, `test-automator` |

### 2. Utility Subagents (4 — Token-Efficient Delegation)

| Subagent | Role & Trigger | Output & Constraints |
|---|---|---|
| [`semble-search`](personas/semble-search.md) | Semantic code/docs/config search via `semble` | Code chunks ranked by relevance (cached) |
| [`cavecrew-investigator`](personas/cavecrew-investigator.md) | Read-only symbol, definition, caller, and reference locator | Caveman `path:line` tables (~60% token savings); refuses edits |
| [`cavecrew-builder`](personas/cavecrew-builder.md) | Surgical 1–2 file edits when scope is obvious | Caveman diff receipt; hard-refuses 3+ files |
| [`cavecrew-reviewer`](personas/cavecrew-reviewer.md) | Diff, branch, or file review | Severity-tagged (`🔴 bug`, `🟡 risk`, `🔵 nit`, `❓ question`) |

---

## Operating Invariants & Deliverable Tiers

Detailed rules of engagement are documented in [`AGENTS.md`](AGENTS.md). Key operating invariants:

1. **Reconnaissance Before Clarification**: Perform fast, read-only inspection (`semble search`, `Read`, directory listing) before asking questions so discussions are grounded in actual files.
2. **Context Economy**: Follow progressive disclosure (Tier 1 metadata → Tier 2 instructions → Tier 3 resources). Never dump entire manuals into prompt context.
3. **Deliverable Tiers**:
   - **Tier 1 (In-Place / Lightweight Tasks — ≤2 files, bug fixes, Q&A)**: Apply changes directly or reply in chat with a verification receipt and conventional commit. No `outputs/` folder needed.
   - **Tier 2 (Major Deliverables, Audits, Research Runs)**: Generated in a versioned `outputs/<conversation_id>_<timestamp>_v<version>/` folder containing `SUMMARY.md`, `CONTEXT.md`, and `COMMIT_MESSAGE.txt`.
4. **Definition of Done**: A task is never marked done until verification passes and evidence (command + output) is recorded.

---

## Harness Architecture & Verification

The repository complies with the 5 core subsystems of the [Harness Creator](skills/harness-creator/SKILL.md) specification:

| Subsystem | Workspace Artifact | Role |
|---|---|---|
| **Instructions** | `AGENTS.md` | Core rules of engagement, persona routing, output tiers |
| **State** | `feature_list.json`, `progress.md` | Feature tracking, dependencies, and session progress ledger |
| **Verification** | `scripts/validate-workspace.ps1`, `init.sh` | Automated integrity, link, and frontmatter validation |
| **Scope** | `feature_list.json`, `AGENTS.md` | One-feature-at-a-time invariant and explicit completion gates |
| **Lifecycle** | `session-handoff.md`, `init.sh` | Clean session startup, checkpointing, and restart paths |

### Running Verification

To validate the workspace skills, persona mappings, and relative markdown links:

```powershell
pwsh -NoProfile -File scripts/validate-workspace.ps1 -Sync
```

To run the structural harness assessment:

```bash
node skills/harness-creator/scripts/validate-harness.mjs --target .
```

---

## Adding or Modifying Skills

1. **Install or Author**: Add the skill directory inside `skills/<folder>/` containing a valid `SKILL.md` (with YAML frontmatter `name` and `description`).
2. **Assign to Persona**: Open the matching persona file in `personas/<persona>.md` and add the skill slug (and folder name in parens if different, e.g. `slug` (`folder`)).
3. **Update Roster**: Add the skill to [`personas/README.md`](personas/README.md).
4. **Validate & Sync**:
   ```powershell
   pwsh -NoProfile -File scripts/validate-workspace.ps1 -Sync
   ```
   This automatically regenerates [`personas/skill-index.json`](personas/skill-index.json), updates the tool discovery catalogs, and mirrors personas to `~/.config/opencode/agents/`.
