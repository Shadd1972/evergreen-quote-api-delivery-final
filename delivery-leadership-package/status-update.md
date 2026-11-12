# Stakeholder Status Update: Evergreen Quote

**To:** Priya Ramanathan, Project Sponsor
**From:** Shadd Schutte, Delivery Lead
**Date:** Tuesday EOD, Week 3

**Shipped and slipped.** Today the API was assembled and is answering with real data through both the website (REST) and partner (GraphQL) doors, at your approved rates (auto 90, home 135, life 70); the automated tests pass 7 of 7. The tests caught a pricing error the demo hid ($50,000 of auto cover priced at $0.35/month), and it was fixed before anything moved forward. Nothing on the delivery goal slipped. **Renters coverage: no for this week.** It touches six parts of the service, not one dropdown, and there is no approved renters rate yet; I've scheduled it as the first item next round (decision memo attached). **Base image: ship this week on the current `node:22-alpine`.** The flag is moderate, the API is not internet-exposed this week, and we'll move to the patched tag in next week's upgrade window (logged as risk R9).

**Next and what I need.** Tomorrow: containerize the API, turn on automated CI, and review the site's deploy files. From you: (1) confirm by 11:00 Wednesday that you're comfortable shipping on the current base image under those conditions; (2) set a renters rate by Friday so the partner can have renters at the start of next round. You can tell the partner today that renters is scheduled, not declined.

**To:** Priya Ramanathan, Project Sponsor
**From:** Shadd Schutte, Delivery Lead
**Date:** Wednesday EOD, Week 3

**Shipped and slipped.** The API now runs in a container and gives the same answers as the development server, and automated CI runs on every push and is green on my branch. I reviewed the website's deploy files: the deploy copies the site to an S3 bucket, anyone can read it, and only the deploy role can change it. The deploy script checks out clean. One finding: the website still shows the old rates while the API uses yours, because the site doesn't call the API yet (risk R3, planned for a later round). We also used Copilot to draft one test. Its first attempt swapped out the project's test tooling and broke the existing tests. I reverted it, and the second attempt needed narrowing, but the test suite caught every problem before anything moved forward. At 14:00 an incident landed: customers were being refused quotes by an age minimum of 110 while CI on `main` was red. I routed it to engineering rather than fixing it, and flagged that a red run ships nothing, so the change must have reached customers another way (risk R11). Nothing on the delivery goal slipped.

**Next and what I need.** Tomorrow: the cluster demo, the PR from my branch to `main`, merge, and the delivery review. My merge call is go with conditions: my branch is green and doesn't contain the hotfix, but I won't merge onto a red `main`. From you and engineering: (1) confirm by Thursday's 10:00 check-in that `main` is green again; (2) confirm what is actually deployed to customers and how the hotfix got there outside the pipeline.

---
**To:** Priya Ramanathan, Project Sponsor
**From:** Shadd Schutte, Delivery Lead
**Date:** Thursday EOD, Week 3

**Shipped and slipped.** The delivery goal is met. The API ran as three copies behind one front door on a local Kubernetes cluster, with its own database, and a new home quote came back at $2,700/month, your approved rate. The work was merged to `main` through a reviewed pull request with green CI, tagged `phase-3`, and re-checked on `main`: the service name, the six demo quotes, and the partner (GraphQL) door all work. The merge-day condition was met: `main` was green and engineering confirmed what was deployed. Two delays came from the environment, not the product. The cluster couldn't start the API until we loaded our image into it, and a container left running since Wednesday held the API's port. Both were fixed in minutes. The merge also cleared an old folder of downloaded packages out of the repository, as the instructor asked. Nothing on the goal slipped.

**Next and what I need.** Tomorrow: the delivery review and lessons learned. The leadership package is complete on `main`. From you: (1) confirm my presentation slot and order for Friday; (2) the renters rate, so renters can start day one of next round; (3) a reminder that the patched base image goes in during next week's platform window (risk R9).
