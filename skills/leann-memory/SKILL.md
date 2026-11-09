---
name: leann-memory
description: >
  High-performance local semantic search and memory index (97% storage compression)
  using leann-core. Use when indexing or searching local notes, markdown memories,
  past decisions, or document corpora with local sentence-transformers embeddings.
---

# LEANN Memory Search

You have access to LEANN (`leann-core`), a high-performance semantic search engine with 97% storage compression. Use it to index and search memories, notes, documents, and knowledge bases locally with zero external API latency.

## When to Use

- User asks to search memories, notes, or local markdown knowledge bases
- User wants to recall past decisions, conversations, or project facts
- Building a lightweight persistent semantic memory index over workspace docs (`MEMORY.md`, `outputs/`, `docs/`)

## Prerequisites Check

Verify LEANN is installed before first use:

```bash
which leann || pip install leann-core
```

## Build or Update an Index

The index is idempotent — re-running `leann build` only processes changed files:

```bash
leann build workspace-memory \
  --docs ./MEMORY.md ./memory/ \
  --embedding-model all-MiniLM-L6-v2 \
  --embedding-mode sentence-transformers
```

For continuous background indexing:

```bash
leann watch workspace-memory
```

## Search Workflow

1. Query the index in non-interactive JSON mode:

```bash
leann search workspace-memory "<query>" --top-k 5 --json --non-interactive
```

2. Parse the JSON array (`id`, `score`, `text`, `metadata.file_path`, `metadata.source`).
3. Present results with exact file/source attribution. Increase `--top-k` to 10–15 if broader context is needed.
