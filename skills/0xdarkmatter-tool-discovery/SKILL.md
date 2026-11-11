---
name: tool-discovery
description: "Recommend the right workspace personas, utility subagents, and skills for any task across all 19 personas and 293 installed skills. Triggers on: which agent, which persona, which skill, what tool should I use, help me choose, recommend agent, find the right tool."
license: MIT
allowed-tools: "Read Glob"
metadata:
  author: workspace-agents
  related-skills: harness-creator, cavecrew
---

# Tool Discovery (Workspace Persona & Skill Router)

Route any engineering, research, infrastructure, or documentation task to the right **Domain Persona**, **Utility Subagent**, or **Skill** installed in `D:\workspaces\agents\` (`~/.agents/`).

## Decision Flowchart

```text
What kind of task is this?
├── 1. Fast Code Search / Exploration?
│   ├── Semantic / intent search → Use `mcp__semble__search` (or spawn `semble-search`)
│   └── Symbol locate (`Defs`/`Refs`/`Callers`) → Spawn `cavecrew-investigator`
├── 2. Surgical 1-2 File Edit or Diff Review?
│   ├── Obvious 1-2 file edit → Spawn `cavecrew-builder`
│   └── Diff / PR / branch audit → Spawn `cavecrew-reviewer` (or load `open-code-review`)
└── 3. Domain Engineering, Architecture, or Research?
    └── Match one of the 15 Domain Personas below → Load only the 1-2 skills needed from its roster
```

**Core Rule:** Personas define the *role, reporting contract, and handoff boundaries*. Skills (`skills/<folder>/SKILL.md`) provide the *concrete workflow, recipes, and references*.

---

## 1. Domain Personas (15) & Utility Subagents (4)

| Persona / Subagent | When to Activate / Spawn | Key Skills (Slug → Folder if different) |
|---|---|---|
| **`ml-engineer`** | Pretrain, fine-tune (LoRA/QLoRA/TRL), RLHF/GRPO/verl, distributed launch (DeepSpeed/FSDP2/Megatron/TorchTitan), multimodal/VLA robotics, interpretability | `peft-fine-tuning` (`peft`), `unsloth`, `grpo-rl-training`, `verl-rl-training` (`verl`), `deepspeed`, `pytorch-fsdp2`, `optimizing-attention-flash` (`flash-attention`), `transformer-lens-interpretability` (`transformer-lens`) |
| **`llm-inference`** | Serve LLMs (vLLM/SGLang/TRT-LLM/llama.cpp), quantize (AWQ/GPTQ/GGUF/HQQ/bnb), speculative decoding, long-context/KV-cache optimization | `serving-llms-vllm` (`vllm`), `sglang`, `tensorrt-llm`, `gguf-quantization` (`gguf`), `awq-quantization` (`awq`), `speculative-decoding`, `long-context`, `context-optimization` (`chakshugautam-context-optimization`) |
| **`mlops-engineer`** | Experiment tracking (W&B/MLflow/SwanLab), cloud GPU orchestration (Modal/SkyPilot/Lambda), LLM/code eval harnesses, data curation | `weights-and-biases`, `mlflow`, `skypilot-multi-cloud-orchestration` (`skypilot`), `modal-serverless-gpu` (`modal`), `evaluating-llms-harness` (`lm-evaluation-harness`), `nemo-curator` |
| **`rag-data-engineer`** | RAG pipelines, vector DBs (Qdrant/Chroma/Pinecone/FAISS/AgentDB), local semantic memory (`leann-memory`), embeddings, tokenizers, analytics | `llamaindex`, `langchain`, `qdrant-vector-search` (`qdrant`), `leann-memory`, `sentence-transformers`, `huggingface-tokenizers`, `business-analyst` (`sickn33-business-analyst`) |
| **`agent-engineer`** | Agent workflows (CrewAI/AutoGPT/DSPy), Claude API/SDKs, MCP servers, structured output (Instructor/Outlines/Guidance), tracing, harnesses & skills | `harness-creator`, `mcp-builder`, `skill-creator`, `claude-api`, `dspy`, `instructor`, `outlines`, `langsmith-observability` (`langsmith`), `phoenix-observability` (`phoenix`) |
| **`software-architect`** | System design, C4/Mermaid diagrams, backend/API design, CLI/tool design, implementation plans, React/shadcn UI bundles, Playwright E2E testing | `c4-architecture` (`softaworks-c4-architecture`), `mermaid-diagrams` (`softaworks-mermaid-diagrams`), `sop-api-development` (`dnyoussef-sop-api-development`), `tool-design` (`sickn33-tool-design`), `writing-plans`, `frontend-design`, `webapp-testing` |
| **`research-scientist`** | Research ideation, hypothesis generation, autonomous loops (`autoresearch`), ML/systems paper writing, plots, LaTeX posters, talks, ARA artifacts | `autoresearch` (`0-autoresearch-skill`), `hypothesis-generation` (`k-dense-ai-hypothesis-generation`), `ml-paper-writing`, `systems-paper-writing`, `academic-plotting`, `latex-posters` (`davila7-latex-posters`), `ara-compiler` |
| **`security-engineer`** | SAST (`Semgrep`), DAST (`Nuclei`), SCA/container/IaC scanning (`Trivy`), LLM guardrails (`LlamaGuard`, `PromptGuard`, `NeMo Guardrails`, `Constitutional AI`) | `sast-semgrep` (`agentsecops-sast-semgrep`), `dast-nuclei` (`agentsecops-dast-nuclei`), `sca-trivy` (`agentsecops-sca-trivy`), `llamaguard`, `nemo-guardrails` |
| **`devops-engineer`** | Cloud infra (AWS/GCP/Azure), Kubernetes, Terraform, CI/CD orchestration, incident troubleshooting, runbooks, DORA/infra reporting | `cloud-devops` (`sickn33-cloud-devops`), `senior-devops` (`alirezarezvani-senior-devops`), `devops-orchestrator` (`brownbull-devops-orchestrator`), `devops-troubleshooter` (`sickn33-devops-troubleshooter`), `devops-runbooks` (`89jobrien-devops-runbooks`) |
| **`software-developer`** | Implement application code in any language/framework; DB access, GraphQL, embedded/game/IoT | `python-pro`, `javascript-pro`, `typescript-pro`, `golang-pro`, `rust-engineer`, `csharp-developer`, `java-architect`, `sql-pro`, `microservices-architect` |
| **`frontend-developer`** | Web/mobile/desktop UI, design systems, UX research, accessibility | `angular-architect`, `react-specialist`, `vue-expert`, `nextjs-developer`, `flutter-expert`, `ui-designer`, `accessibility-tester` |
| **`data-engineer`** | Data pipelines, ETL/ELT, analytics SQL, data science, database administration | `data-engineer`, `data-engineer-2` (`data-engineer-pro`), `data-analyst`, `database-administrator`, `database-optimizer` |
| **`business-analyst`** | Market/product/quant analysis, GTM/SEO, project delivery, legal & fintech advisory | `market-researcher`, `product-manager`, `quant-analyst`, `risk-manager`, `payment-integration` |
| **`windows-automation`** | PowerShell 5.1/7 scripting, Windows/AD/GPO/M365 administration, IT ops routing | `powershell-7-expert`, `powershell-module-architect`, `windows-infra-admin`, `m365-admin` |
| **`reliability-engineer`** | SLOs, performance/load testing, chaos, incident response, QA & test automation | `sre-engineer`, `chaos-engineer`, `performance-engineer`, `qa-expert`, `test-automator` |
| **`semble-search`** | Semantic code/docs/config search across repositories | Built-in `semble search` / `semble find-related` workflow |
| **`cavecrew-investigator`** | Read-only symbol/call-site locator with ~60% token compression | Controlled via `cavecrew` meta-skill |
| **`cavecrew-builder`** | Surgical 1–2 file edits with diff receipt | Controlled via `cavecrew` meta-skill |
| **`cavecrew-reviewer`** | Compact severity-tagged (`🔴`/`🟡`/`🔵`/`❓`) diff review | Controlled via `cavecrew` meta-skill |

---

## 2. Meta-Skills Quick Reference (Any Persona)

| Category | Skills (`slug` → `folder` if different) |
|---|---|
| **Planning & Execution** | `brainstorming`, `writing-plans`, `subagent-driven-development` |
| **Code Review & Delegation** | `open-code-review`, `open-code-review-delegate`, `cavecrew` |
| **Token Efficiency Modes** | `caveman`, `caveman-commit`, `caveman-compress`, `caveman-review`, `caveman-stats`, `caveman-help` |
| **Office & Documents** | `docx`, `pdf`, `pptx`, `xlsx`, `doc-coauthoring`, `internal-comms` |

---

## 3. Resolving Skill Paths (`slug` vs. `folder`)

70+ skills in `D:\workspaces\agents\skills\` have a directory name that differs from their YAML frontmatter `name` (e.g., `optimizing-attention-flash` lives in `skills/flash-attention/SKILL.md`).
- **Always check `personas/skill-index.json`** or `./references/skills-catalog.md` before calling `Read` on a skill path if the folder name is not identical to the slug.

## Additional Resources

- `./references/agents-catalog.md` — Full catalog of all 13 workspace personas and subagents
- `./references/skills-catalog.md` — Complete mapping of all 293 skills (`slug`, `folder`, `persona`, and `description`)
