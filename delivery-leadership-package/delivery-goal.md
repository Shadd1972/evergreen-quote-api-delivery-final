# Delivery Goal: Evergreen Quote

## Goal

> By Thursday end of day, the Evergreen Quote API saves and prices quotes at the sponsor's approved rates through both the website (REST) and partner (GraphQL) doors, and is merged to main through a reviewed PR with green CI, proven in a container and on a local Kubernetes cluster.

## "Done" looks like

- The API answers every documented route: list, fetch by id, create with a computed premium.
- Bad input is rejected with a clear message (e.g., age under 18, unknown quote type), and an unknown id returns 404.
- Premiums use the sponsor's rates (auto 90, home 135, life 70): auto, age 35, $50,000 cover returns 450.
- The same data answers through GraphQL, with the explorer at `/explorer`.
- `npm test` passes; the safety net holds.
- The containerized API serves the same answers as the dev server, and the CI run on the merge commit is **green**.
- The cluster demo shows three API pods behind one Service.
- A reviewed PR is merged, branch deleted.
- `delivery-leadership-package/` is complete and committed.

## Out of scope (this week)

- Writing new features or code beyond the provided kit pieces and the kit's one-line fix.
- Deploying the API to a live cloud environment (AWS/EKS); the cluster demo is local only.
- Connecting the marketing site to the API or updating its old rates (logged as risk R3).
- A live S3 deploy of the site, unless the instructor calls "go" by Wednesday's check-in.
- User accounts, login, payments, or saving quotes per customer.
