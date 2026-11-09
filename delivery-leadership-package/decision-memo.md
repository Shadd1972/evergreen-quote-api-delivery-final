## Decision Memo: Renters coverage this week

**Decision owner:** Shadd Schutte, Delivery Lead
**Date:** Tuesday, Week 3
**Requested by:** Priya Ramanathan, Project Sponsor (on behalf of a partner aggregator)

## Context
A partner aggregator wants renters coverage quotable through the API by Thursday. Their integration lead described it as "one more dropdown option." This morning we tested exactly that kind of change: we asked the API for a "boat" quote and it refused with a 400 error, because the service only accepts auto, home, and life. It refuses "renters" the same way today.

## Options
1. **Yes, by Thursday.** Renters touches six places, not one: the list of allowed quote types, the rate table, the demo data, the automated tests, the partner (GraphQL) door, and the website dropdown. It also needs a renters rate, and rates are the sponsor's decision, so none has been set. To fit it in, the Thursday cluster demo would come out of this week.
2. **No this week; schedule it for the next delivery round.** This week's goal stays as agreed, and renters is planned properly with an approved rate.
3. **Accept renters without a rate.** This was rejected: we would be quoting customers a price nobody approved.

## Recommendation
Option 2: no renters this week. Schedule it as the first item in the next delivery round, starting once the sponsor sets a renters rate.

## Why
- The delivery goal hasn't changed, and every item in it is still on track. Adding six changes two days before the merge puts the whole goal at risk for one partner request.
- The cost is known, not guessed: the API's own response this morning showed what "one more option" actually involves.
- There is no approved renters rate yet, and engineering should not invent one.
- The partner gets a firm date instead of a "maybe," which is easier for them to plan around.

**What I need:** a renters rate from the sponsor by Friday, so renters can start on day one of the next round.