---
name: cloud-devops
description: "Cloud infrastructure and DevOps workflow covering AWS, Azure, GCP, Kubernetes, Terraform, CI/CD, monitoring, and cloud-native development."
source: personal
risk: safe
domain: cloud-devops
category: workflow-bundle
version: 2.0.0
---

# Cloud/DevOps Workflow Bundle

## Overview

End-to-end cloud and DevOps workflow for infrastructure provisioning, container orchestration, CI/CD pipelines, observability, security scanning, and incident operations, grounded in the workspace's installed skills.

## Workspace Skill Routing for DevOps Phases

| Phase | Workspace Skills & Personas to Load |
|---|---|
| **1. Architecture & Diagrams** | `senior-architect` (`davila7-senior-architect`), `c4-architecture` (`softaworks-c4-architecture`), `mermaid-diagrams` (`softaworks-mermaid-diagrams`) |
| **2. Cloud & IaC Provisioning** | `senior-devops` (`alirezarezvani-senior-devops`), `devops-orchestrator` (`brownbull-devops-orchestrator`) |
| **3. GPU & ML Cloud Compute** | `skypilot-multi-cloud-orchestration` (`skypilot`), `modal-serverless-gpu` (`modal`), `lambda-labs-gpu-cloud` (`lambda-labs`) — hand off to `mlops-engineer` |
| **4. Security & Container/IaC Scanning** | `sca-trivy` (`agentsecops-sca-trivy`), `sast-semgrep` (`agentsecops-sast-semgrep`), `dast-nuclei` (`agentsecops-dast-nuclei`) — hand off to `security-engineer` |
| **5. Incident Response & Runbooks** | `devops-troubleshooter` (`sickn33-devops-troubleshooter`), `devops-runbooks` (`89jobrien-devops-runbooks`), `infrastructure-reporting` (`dataknifeai-infrastructure-reporting`) |

## Workflow Phases

### Phase 1: Cloud & IaC Design
1. Define network topology (VPC, subnets, security groups, least-privilege IAM).
2. Manage state remotely with locking (e.g., S3 + DynamoDB / GCS backend for Terraform).
3. Separate environment configurations (`dev`, `staging`, `prod`) using modules or workspaces.
4. Generate C4 Deployment diagrams (`c4-architecture`) before applying high-blast-radius changes.

### Phase 2: Containerization & Kubernetes
1. Author multi-stage, non-root `Dockerfile` builds with pinned base image digests.
2. Scan container images and Kubernetes manifests using `sca-trivy` (`trivy image`, `trivy config`).
3. Define resource `requests`/`limits`, `livenessProbe`/`readinessProbe`, `PodDisruptionBudget`, and `HorizontalPodAutoscaler`.

### Phase 3: CI/CD Pipelines
1. Enforce fast fail-gates: Lint → Unit Test → SAST/SCA (`sast-semgrep`, `sca-trivy`) → Build → Staging Deploy → Smoke Test → Prod Rollout.
2. Prefer progressive delivery (canary or blue/green) with automated rollback triggers on error-rate spikes.
3. Track DORA metrics (Deployment Frequency, Lead Time for Changes, Change Failure Rate, MTTR).

### Phase 4: Observability, Incidents & Runbooks
1. Instrument golden signals (Latency, Traffic, Errors, Saturation) and structured JSON logs.
2. Triage production incidents systematically using `devops-troubleshooter`.
3. Document repeatable operational and recovery procedures with `devops-runbooks` and summarize capacity/health with `infrastructure-reporting`.

## Quality Gates
- [ ] Blast radius and rollback path documented before mutating infrastructure
- [ ] IaC validated (`terraform fmt -check`, `terraform validate`, `trivy config`)
- [ ] CI/CD pipeline includes automated rollback and secret scanning
- [ ] Runbooks and health reporting updated (`devops-runbooks`, `infrastructure-reporting`)
