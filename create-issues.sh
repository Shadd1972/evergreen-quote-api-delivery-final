#!/usr/bin/env bash
# Creates the ten Evergreen Quote API board issues with done criteria.
# Run from inside your Git repo folder (the one pushed to GitHub).
# Optional: add issues to a Project board by setting PROJECT_TITLE, e.g.
#   PROJECT_TITLE="Evergreen Delivery" ./create-issues.sh
set -euo pipefail

PROJECT_ARGS=()
if [[ -n "${PROJECT_TITLE:-}" ]]; then
  PROJECT_ARGS=(--project "$PROJECT_TITLE")
fi

new_issue() {
  local title="$1" body="$2"
  echo "Creating: $title"
  gh issue create --title "$title" --body "$body" "${PROJECT_ARGS[@]}"
}

new_issue "[DATA] Seed the database and verify the six quotes in mongosh" "## Done criteria
- [ ] \`mongosh evergreen .../data/quotes-seed.js\` prints \"Inserted 6 quotes\"
- [ ] \`db.quotes.countDocuments()\` returns 6
- [ ] \`find({ type: \"auto\" })\` returns q1, q4, q6
- [ ] \`find({ tags: \"renewal\" })\` returns q1 and q5"

new_issue "[CONFIG] Set the service name via .env and apply sponsor rates" "## Done criteria
- [ ] \`.env\` has \`SERVICE_NAME=Evergreen Quote API\` and the dev server was restarted
- [ ] \`curl localhost:3000/\` returns {\"message\":\"Evergreen Quote API\",\"status\":\"ok\"}
- [ ] \`BASE_RATES\` in \`src/premium.js\` set to auto 90, home 135, life 70 (values only)
- [ ] POST auto / age 35 / coverage 50000 returns monthlyPremium 450
- [ ] \`npm test\` stays green"

new_issue "[API] Assemble the quote routes at the INSERT markers, tests green" "## Done criteria
- [ ] \`routes.js\` copied into \`src/\`; both route lines pasted at their markers in \`src/index.js\`
- [ ] \`GET /api/quotes\` returns the six seeded quotes; \`GET /api/quotes/q1\` returns q1
- [ ] Invalid input (age 5, type \"boat\") returns 400; unknown id returns 404
- [ ] Kit's one-line premium argument-order fix applied
- [ ] \`npm test\` passes 7 of 7"

new_issue "[GRAPHQL] Mount GraphQL and verify through the explorer" "## Done criteria
- [ ] \`graphql.js\` copied in; both GraphQL lines pasted; no INSERT markers remain
- [ ] \`/explorer\` loads; \`quotes\` and \`quote(id: \"q1\")\` queries return correct data
- [ ] \`createQuote\` life mutation returns monthlyPremium 700
- [ ] The same quote appears in REST \`/api/quotes\`"

new_issue "[CONTAINER] Build and run the Docker image" "## Done criteria
- [ ] Dockerfile and .dockerignore copied in; image built as \`evergreen-quote-api:1.0\`
- [ ] \`docker run --network host --env-file .env\` serves the same responses as the dev server
- [ ] Rebuild after a whitespace-only edit shows dependency layers as CACHED"

new_issue "[CI] Enable GitHub Actions workflow" "## Done criteria
- [ ] \`.github/workflows/ci.yml\` committed and pushed
- [ ] A run appears in the Actions tab and completes
- [ ] Result recorded in plain English; any red run has its failure explained
- [ ] Go/no-go decision written in \`go-no-go.md\`"

new_issue "[SITE] Review the site's S3 deploy artifacts" "## Done criteria
- [ ] Site previews locally at localhost:8080
- [ ] \`infrastructure.md\`, \`bucket-policy.json\`, \`iam-policy.json\` reviewed (what it does, who can read, who can write)
- [ ] \`bash -n deploy/deploy-to-s3.sh\` produces no output
- [ ] Site/API rate mismatch logged in the risk register"

new_issue "[CLUSTER] Demonstrate the API on kind (3 pods + database)" "## Done criteria
- [ ] kind cluster \`evergreen\` created; API image loaded
- [ ] Manifests pass \`kubectl apply --dry-run=client\`
- [ ] \`kubectl get pods\` shows 3 API pods and 1 mongo pod Running
- [ ] Via port-forward, \`/\` returns the service name and a POST returns monthlyPremium 2700
- [ ] Cluster torn down; manifests kept in \`k8s/\`"

new_issue "[REVIEW] Open PR from delivery/lead to main" "## Done criteria
- [ ] PR opened with the title and body from the guide
- [ ] Diff self-reviewed with at least one inline question comment (pairs: partner comments and approves)
- [ ] CI green on the PR; squash-merged and branch deleted
- [ ] On main, \`/\`, \`/api/quotes\` and \`/explorer\` all still work"

new_issue "[DOCS] Complete the delivery leadership package" "## Done criteria
- [ ] Vision brief, delivery goal, risk register (5+ risks), decision memo, status update, go/no-go and delivery review outline filled in
- [ ] Copilot critique (~100 words) written
- [ ] Project board link pasted into \`vision-brief.md\`
- [ ] Everything committed to main"

echo "Done: 10 issues created."