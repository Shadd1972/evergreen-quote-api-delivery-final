# Task List (Reference Shape)

> The real task list lives on your GitHub Project board. This file is the **shape**: what each issue should look like before it leaves your hands. Link to the board from `vision-brief.md`.

## Issue template

```
Title: [AREA] short verb-first description

Who it's for: <user>. What they get: <thing>. Why it matters: <outcome>.

Done criteria
- [ ] Observable thing 1
- [ ] Observable thing 2
- [ ] Observable thing 3

Out of scope
- Anything that is *related* but explicitly not in this issue.

Linked decisions / risks
- (links to decision memos or risk-register rows if applicable)
```

## Worked example (issue #3)

```
Title: [API] Assemble the quote routes at the INSERT markers, tests green

Who it's for: website customers and the engineering team. What they get: live
REST routes that read and save quotes in MongoDB. Why it matters: this is the
first point where the product remembers a quote, and the tests prove the
premium math is right, not just that the demo looks right.

Done criteria
- [ ] routes.js copied into src/; both route lines pasted at their markers in src/index.js
- [ ] GET /api/quotes returns the six seeded quotes; GET /api/quotes/q1 returns q1
- [ ] Invalid input (age 5, type "boat") returns 400; unknown id returns 404
- [ ] Kit's one-line premium argument-order fix applied
- [ ] npm test passes 7 of 7

Out of scope
- Writing or changing any route logic beyond the kit's one-line fix
- Cleaning up the $0.35 quote created before the fix (cleared by Thursday's seed reset)
- GraphQL (issue #4)

Linked decisions / risks
- Risk register: "Demo looked correct while the AI-drafted handler computed the wrong premium"
- Risk register: "Bad data outlives bad code"
```

## Delivery task list (as on the board)

| # | Title | Area | Day | Priority |
|---|---|---|---|---|
| 1 | Seed the database and verify the six quotes in mongosh | DATA | Mon | P0 |
| 2 | Set the service name via .env and apply sponsor rates | CONFIG | Tue | P0 |
| 3 | Assemble the quote routes at the INSERT markers, tests green | API | Tue | P0 |
| 4 | Mount GraphQL and verify through the explorer | GRAPHQL | Tue | P0 |
| 5 | Build and run the Docker image | CONTAINER | Wed | P0 |
| 6 | Enable GitHub Actions workflow | CI | Wed | P0 |
| 7 | Review the site's S3 deploy artifacts | SITE | Wed | P0 |
| 8 | Demonstrate the API on kind (3 pods + database) | CLUSTER | Thu | P0 |
| 9 | Open PR from delivery/lead to main | REVIEW | Thu | P0 |
| 10 | Complete the delivery leadership package | DOCS | Mon–Thu | P0 |

## Changes from the suggested starter set

- **Merged** "Set the service name" and "Apply sponsor rate decision" into one CONFIG issue (#2). Both are sponsor decisions from Monday, applied as configuration on the same morning, and checked by the same curl and test run.
- **Folded** "Document one Copilot-assisted step + critique" into the DOCS issue (#10). The critique is a written leadership artifact, so it is tracked with the rest of the package.
- **Added** the DOCS issue (#10) so the written deliverables (vision brief, delivery goal, risk register, decision memo, status update, go/no-go, delivery review) have one owner and one set of done criteria.
- **Renamed** the K8S area to CLUSTER to match the board labels.
- **Priority:** CONFIG is P0 for the whole issue, because the sponsor rates change what customers are charged. Everything on the board is P0; the stretch items (roadmap, second decision memo, incident comms) are tracked in the package, not on the board.
