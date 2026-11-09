# Stakeholder Status Update: Evergreen Quote

> Copy to `delivery-leadership-package/status-update.md`. Send it (i.e., paste it in the cohort channel) at the end of the day an inject lands. Target length: ~150 words.

**To:** Priya Ramanathan, Project Sponsor
**From:** Shadd Schutte, Delivery Lead
**Date:** Tuesday EOD, Week 3

**Shipped and slipped.** Today the API was assembled and is answering with real data through both the website (REST) and partner (GraphQL) doors, at your approved rates (auto 90, home 135, life 70); the automated tests pass 7 of 7. The tests caught a pricing error the demo hid ($50,000 of auto cover priced at $0.35/month), and it was fixed before anything moved forward. Nothing on the delivery goal slipped. **Renters coverage: no for this week.** It touches six parts of the service, not one dropdown, and there is no approved renters rate yet; I've scheduled it as the first item next round (decision memo attached). **Base image: ship this week on the current `node:22-alpine`.** The flag is moderate, the API is not internet-exposed this week, and we'll move to the patched tag in next week's upgrade window (logged as risk R9).

**Next and what I need.** Tomorrow: containerize the API, turn on automated CI, and review the site's deploy files. From you: (1) confirm by 11:00 Wednesday that you're comfortable shipping on the current base image under those conditions; (2) set a renters rate by Friday so the partner can have renters at the start of next round. You can tell the partner today that renters is scheduled, not declined.