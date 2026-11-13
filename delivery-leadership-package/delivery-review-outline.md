# Delivery Review: Evergreen Quote API (Phase 3)
Presenter: Shadd Schutte, Delivery Lead · Target: 5 minutes spoken, then 3 minutes of questions

## Slide 1: Delivery goal & did we hit it?

- **Goal:** By Thursday, the Evergreen Quote API saves and prices quotes at the sponsor's approved rates through both the website (REST) and partner (GraphQL) doors, and is merged to main through a reviewed PR with green CI, proven in a container and on a local Kubernetes cluster.
- **Hit?** ☒ Yes  ☐ Partially  ☐ No
- **Why:** every "done" item in `delivery-goal.md` was checked on `main` on Thursday, and nothing slipped despite two injects.

## Slide 2: What shipped

- **The running API on `main`** (from `curl-transcript-main.txt`, Thu Nov 12):
  ```
  $ curl localhost:3000/
  {"message":"Evergreen Quote API","status":"ok"}
  $ curl localhost:3000/api/quotes/q1
  {"_id":"q1","type":"auto","age":41,"coverageAmount":50000,"monthlyPremium":96,"tags":["renewal"]}
  ```
- **Merged PR:** https://github.com/Shadd1972/evergreen-quote-api-delivery-final/pull/22
- **Green CI run** (install from the lock file + 8 tests against a throwaway MongoDB): https://github.com/Shadd1972/evergreen-quote-api-delivery-final/actions/runs/43263730006
- **Cluster demo:** 3 API pods + 1 database behind one Service; a home quote POSTed through the Service returned `monthlyPremium: 2700` (`cluster-demo-transcript.txt`).

## Slide 3: Two key decisions

- **Decision 1:** No renters coverage this week; scheduled first in the next round.
  **Why it mattered:** "one more dropdown" touched six parts of the service and had no approved rate. Saying yes would have put the whole delivery goal at risk for one partner request.
- **Decision 2:** Conditional GO on the merge: my branch was green, but I would not merge onto a red `main`.
  **Why it mattered:** merging during an open customer incident would have mixed my changes with an unresolved problem. The condition (`main` green, deployment confirmed) was met Thursday at 10:00, and the call became GO.
- (Both are in `decision-memo.md`; the full merge call is in `go-no-go.md`.)

## Slide 4: Risks & injects

- **Top risk we tracked:** R1, a demo that looks right while a number is wrong. It happened Tuesday: a tidy 201 with a $0.35 premium. The tests caught it before anything moved forward.
- **Inject #1 (Tue):** renters by Thursday + a moderate CVE on `node:22-alpine`. I said no to renters (the API's own "boat" response showed the cost) and moved it to Backlog as a next-round issue. I shipped on the current image (moderate severity, not internet-exposed, patch due next week), asked the sponsor for a renters rate, and logged R9–R10.
- **Inject #2 (Wed):** customers refused by an age minimum of 110 while CI on `main` was red. I routed it to engineering instead of fixing it, and named the contradiction: a red run ships nothing, so the change reached customers another way (R11). The tests weren't the problem; they were the defense working. **Go/no-go:** conditional GO, then GO at Thursday 10:00.
- **Copilot:** its first draft swapped the test runner, and its second invented an error message. The tests and CI caught both.

## Slide 5: What I'd do differently next round

- Seed and verify demo data before the first demo, not after.
- Agree branch names and `.gitignore` before the first commit.
- Prompt AI tools narrowly from the start (name the style; no new packages).
- Clean up containers and clusters after every demo.
- Ask how every deploy reaches customers, so nothing bypasses the pipeline.

## Q&A prep: likely questions

- **"Why didn't you ship renters?"** The API rejected "renters" exactly as it rejected "boat" on Tuesday. A yes meant changing six places two days before the merge, at a price nobody had approved. It's scheduled first next round, pending the sponsor's rate.
- **"The demo returned quotes all week; why does one red test matter?"** On Tuesday the demo returned a perfect-looking 201 while charging $0.35 for $50,000 of cover. A demo is a claim; the test is the evidence.
- **"Why ship on an image with a known CVE?"** The platform team rated it moderate, the API wasn't internet-exposed this week, and the patch lands in next week's window. It's tracked as R9 with a trigger to stop if either fact changes.
- **"How did the incident reach customers if CI was red?"** It couldn't have come from the red run, which is the point. I routed that question to engineering rather than guessing, and logged it as R11: the pipeline gate can be
