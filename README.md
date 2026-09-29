# CodeRifts-governed API project

Signed, offline-verifiable authorization for API-contract changes. Only a granted change can proceed. Three tools: preflight_change_set, verify_receipt, get_decision_details.

<a href="https://studio.firebase.google.com/new?template=https://github.com/coderifts/firebase-studio-template">
  <img height="32" alt="Open in Firebase Studio" src="https://cdn.firebasestudio.dev/btn/open_dark_32.svg">
</a>

Firebase Studio's documentation, updated 2026-09-24, says new workspace creation and user signup have been disabled since 2026-06-22. The button is the documented custom-template URL.

## Three steps

1. Open this repository with the button above.
2. The workspace installs Node.js 20 and `coderifts@8.6.8`. Preflight a contract change with `coderifts diff <old-spec> <new-spec> --cloud --gate`. That command quotes the server authorize verdict and needs an API key (`coderifts login`). `coderifts diff` without `--gate` is local analysis, not a grant.
3. The required-check recipe is separate from the workspace. This repo's workflow job is named `CodeRifts / contract-gate`. The App check is `CodeRifts / issuer`. `npx coderifts setup-required-check` prints the `gh` command and does not change branch protection unless `--apply` is passed. The procedure is in [ENFORCEMENT.md](https://github.com/coderifts/contract-gate/blob/main/ENFORCEMENT.md).

the workspace shows the decision; enforcement is the GitHub required check

## Files

- `openapi.yaml` — two paths, the same bytes as [coderifts/example](https://github.com/coderifts/example) `openapi.yaml`.
- `.coderifts.yml` — Startup Lean, the first template `coderifts init` lists. The CLI names no template "default".
- `.github/workflows/coderifts.yml` — written by `coderifts init --agents` from CLI 8.6.8. The action ref is `coderifts/contract-gate@v0`.
- The seven agent-rule files, the two host hooks, and the three MCP configs are the same command's output.
