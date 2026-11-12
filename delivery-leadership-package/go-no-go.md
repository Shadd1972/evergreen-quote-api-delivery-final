# Go / No-Go: Merge Decision

**Date / time:** Tuesday, November 10, 2026 · ~14:45 (after Inject #2)
**Decision:** ☐ GO   ☐ NO-GO   ☒ GO WITH CONDITIONS

## CI evidence

- Latest run on `dev` (my working branch; the guide's `delivery/lead`): **green** · link: https://github.com/Shadd1972/evergreen-quote-api-delivery-final/pull/22
- Latest run on `main`: **red** since the "validation hotfix" (Run #31). The test step rejects every quote because the minimum age was set to 110. My branch does not contain that change.
- Workflow file: `.github/workflows/ci.yml`
- What the workflow actually checked: check out the code → set up Node 22 → start a MongoDB 7 service container → install dependencies from the lock file (`npm ci`) → run the API test suite (`npm test`, 8 tests including today's Copilot-drafted test). It runs on every push, and on pull requests into `main`.

## What "GO" would mean

- Merge `dev` → `main` through a reviewed PR, squash, delete branch.
- Tag the merge commit `phase-3`.

## What "NO-GO" would mean

- Hold the merge until: `main` is green again (the age hotfix reverted or corrected), and engineering confirms what is actually deployed to customers and how the hotfix reached them while CI was red.
- Owner of that condition: Engineering team (on-call). I own updates to the sponsor and support.
- Re-evaluate at: Thursday 10:00 daily check-in.

## My call

Go with conditions: my branch is green and doesn't contain the hotfix, but I won't merge onto a red `main`, because that would mix my changes with an unresolved customer incident. The one thing driving the call is the red run on `main`; the tests blocked the bad change, which is the safety net working. If `main` is green by Thursday's 10:00 check-in and engineering has confirmed what's deployed, this becomes a straight GO; if `main` is still red, it becomes a NO-GO and I'll escalate to the sponsor.

## Update: Thursday 10:00
Condition met: main is green and engineering confirmed what is deployed.
Call is now GO for merging dev -> main today.
