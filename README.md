# CodeRifts-governed API project

Signed, offline-verifiable authorization for API-contract changes. Only a granted change can proceed. Three tools: preflight_change_set, verify_receipt, get_decision_details.

## Use this template

This repository is a GitHub template. Use this template creates a new repository from these files. There is no Firebase Studio button on this page. Firebase Studio's documentation, updated 2026-09-24, says new workspace creation and user signup have been disabled since 2026-06-22.

## Three steps

1. On https://github.com/coderifts/template, choose Use this template and create the new repository.
2. The copy already contains `openapi.yaml`, `.coderifts.yml`, and `.github/workflows/coderifts.yml`. Add the repository secret `CODERIFTS_API_KEY`. The workflow runs on pull requests. It does not change branch protection.
3. Require both checks named below. Until both are required, a red check is a report. It does not stop the merge.

## Required checks

Two contexts, both required on the protected branch:

- `CodeRifts / contract-gate` is the name of the `always()` job in `.github/workflows/coderifts.yml`. That job name is the context. The action step above it is not the context.
- `CodeRifts / issuer` is the check posted by the CodeRifts GitHub App. It is a different check from the workflow job.

`npx coderifts setup-required-check` prints the `gh` command. It does not change branch protection unless `--apply` is passed. This page does not pass `--apply`. The procedure is in [ENFORCEMENT.md](https://github.com/coderifts/contract-gate/blob/main/ENFORCEMENT.md).

The workflow file says the same limit in its header: it does not enable branch protection, and it does not make the check required.

## Files

- `openapi.yaml` — two paths, the same bytes as [coderifts/example](https://github.com/coderifts/example) `openapi.yaml`.
- `.coderifts.yml` — Startup Lean, the first template `coderifts init` lists. The CLI names no template "default".
- `.github/workflows/coderifts.yml` — written by `coderifts init --agents` from CLI 8.6.8. The action ref is `coderifts/contract-gate@v0`.
- The seven agent-rule files, the two host hooks, and the three MCP configs are the same command's output.
