# Evergreen Quote: Vision Brief

## Product
**Name:** Evergreen Quote API (Phase 3 service delivery)
**Delivery week:** 3
**Delivery Lead:** Shadd Schutte
**Engineering team (represented by):** https://github.com/Shadd1972/evergreen-quote-api-delivery-final
**GitHub Project board:** https://github.com/users/Shadd1972/projects/5/views/1 

## Who is the customer?
Two customers. First, a consumer shopping for auto, home, or life cover who gets an estimate on the Evergreen site and wants to come back to it later. Today that estimate disappears when they close the page, so their alternative is re-entering everything or calling an agent. Second, partner platforms (comparison sites, brokers) that want Evergreen quotes inside their own products. Today they have no way to request a quote except sending customers to our page.

## What pain does Evergreen Quote remove?
For customers: "I already got a quote, why do I have to start over?" Phases 1 and 2 shipped a page that calculates a number and forgets it. A quote service that remembers means a quote is saved, retrievable, and priced the same way every time. For partners: "We can't offer your quotes without a way to plug in." The API gives them a direct connection (GraphQL) with the same validation and pricing as our own site, so a quote is the same quote wherever it is requested.

## What does "good" look like at end of the week?
- The API returns the six known quotes, saves new ones, and rejects bad input (e.g., age under 18) with a clear message.
- Premiums use the sponsor-approved rates (auto 90, home 135, life 70); the test suite is green.
- The same quote can be created and read through both the website door (REST) and the partner door (GraphQL).
- The service runs identically in a container and as three copies on a local Kubernetes cluster.
- Work is merged to main through a reviewed pull request with a green automated test run.

## What are we explicitly NOT doing this week?
- No new features beyond the provided pieces: we assemble, we don't author.
- No live production or cloud (AWS/EKS) deployment of the API; the cluster demo is local.
- No connecting the marketing site to the API (its old rates are a logged risk, not a fix).
- No user accounts, login, or payment.

## How will we know if it worked?
This week: every "good" bullet above can be shown live on Thursday from main, with the merged PR and green CI run as evidence. Beyond this week: customers retrieve saved quotes instead of re-entering them, at least one partner can request a quote without our page, and premiums match the approved rates in every channel.

