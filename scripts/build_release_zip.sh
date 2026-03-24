#!/usr/bin/env bash
set -euo pipefail

REF_NAME="${1:?git ref (tag/commit) is required}"
ZIP_NAME="${2:?zip name is required}"

# Ensure the target ref exists in local checkout before archiving.
git rev-parse --verify "$REF_NAME" >/dev/null 2>&1

git archive --format=zip --output "$ZIP_NAME" "$REF_NAME" -- \
  . \
  ':(exclude).github' \
  ':(exclude).github/**'
