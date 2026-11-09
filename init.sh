#!/bin/bash
set -e

echo "=== Harness Initialization & Workspace Verification ==="

echo "=== Running Workspace Skill & Persona Validator (lint/compile/check) ==="
pwsh -NoProfile -File scripts/validate-workspace.ps1

echo "=== Running Harness 5-Subsystem Validator (test) ==="
node skills/harness-creator/scripts/validate-harness.mjs --target .

echo "=== Verification Complete ==="
echo ""
echo "Next steps:"
echo "1. Read feature_list.json and progress.md to see current feature state"
echo "2. Pick ONE unfinished feature to work on (one-feature-at-a-time)"
echo "3. Implement only that feature and stay in scope"
echo "4. Re-run ./init.sh or scripts/validate-workspace.ps1 -Sync before claiming done"
