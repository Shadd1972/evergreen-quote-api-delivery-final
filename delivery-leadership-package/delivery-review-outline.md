# Delivery Review: Evergreen Quote API (Phase 3)
Presenter: Shadd Schutte, Delivery Lead
 
## Slide 1: Delivery goal & whether we hit it
Goal: by Thursday, the API saves and prices quotes at the sponsor's rates
through REST and GraphQL, merged to main via a reviewed PR with green CI,
proven in a container and on a local Kubernetes cluster.
Result: HIT. Every "done" item was checked on main on Thursday.
 
## Slide 2: What shipped
- curl transcript on main: delivery-leadership-package/curl-transcript-main.txt
- Merged PR: https://github.com/Shadd1972/evergreen-quote-api-delivery-final/pull/22
- Green CI run: https://github.com/Shadd1972/evergreen-quote-api-delivery-final/actions/runs/43263730006
- Cluster demo: 3 API pods + 1 database behind one Service; POST returned 2700
 
## Slide 3: Two key decisions and why
1. Renters coverage: NO this week, scheduled next round. It touched six parts
   of the service and had no approved rate.
2. Conditional GO on the merge: my branch was green, but I would not merge
   onto a red main during an open customer incident.
 
## Slide 4: Risks and how I handled the injects
- R1 happened Tue: the demo showed a 201 while the premium was $0.35; the
  tests caught it.
- Inject #1: scope request + base-image CVE -> decision memo, ship on the
  current image (moderate, not internet-exposed), ask the sponsor for a rate.
- Inject #2: incident -> routed, not fixed. Named the contradiction: a red
  run ships nothing, so the change reached customers another way.
- Copilot: first draft swapped the test runner; the tests and CI caught it.
 
## Slide 5: What I'd do differently next round
- Seed and verify demo data before the first demo, not after.
- Agree branch names and .gitignore before the first commit.
- Prompt AI tools narrowly from the start (name the style; no new packages).
- Ask how every deploy reaches customers, so nothing bypasses the pipeline.