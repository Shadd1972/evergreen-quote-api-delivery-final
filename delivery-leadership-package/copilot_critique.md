# Copilot Critique
**Critique owner:** Shadd Schutte, Delivery Lead
**Date:** November 10, 2026 - Phase 3 Capstone Day 3
**Executed by:** Shadd Schutte

**Task given to Copilot:** Draft one test: a POST to `/api/quote` with no `coverageAmount` returns 400.

## What did Copilot get right?
On the second attempt, with a prompt that named the file's existing style, Copilot wrote the test the way the rest of the file is written (Node's built-in test runner and assertions) and correctly expected the API to reject the request with a 400. The structure was usable with small changes.

## What did it get wrong?
- **First attempt:** it went far beyond the request. It replaced the project's test runner with a different tool (Vitest), installed 35 packages that brought 5 security warnings, and broke the existing test suite. I reverted all of it.
- **Second attempt:** it invented the exact error message ("Invalid quote data") instead of checking what the API actually returns, and it removed two fields when I asked for one, so it tested a broader case than requested.

## Would you ship its output as-is?
No. The first draft would have broken the pipeline, and the second would have failed in CI. I kept the test only after narrowing it to the case I asked for and checking just that an error is returned. It now passes (8 of 8), and I confirmed it fails when the expected status is wrong, so it earns its place.

## What in your pipeline checks Copilot's output?
The automated test suite, which runs locally with `npm test` and in GitHub Actions on every push. It caught Copilot's mistake immediately, the same safety net that caught Tuesday's AI-drafted $0.35 pricing bug. Copilot's output is a draft; the tests decide whether it ships.