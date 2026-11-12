# Incident Comms: Inject #2 (Wed ~14:00)
 
**Observed:** Support reports every quote request returns 400 ("age is less
than minimum allowed value (110)"). Separately, CI on main has been red for
~40 minutes since the validation hotfix; the test step rejects the same 110
minimum. A red run ships nothing, so the change customers are hitting
reached them some other way.
**Asking:** Can the engineering team confirm what is actually deployed in
front of customers right now, and whether anything went out outside the
pipeline (a branch deploy or a manual change)?
**Owner:** Engineering on-call owns the investigation and the fix; I own
communication to the sponsor and support.
**Air cover:** The deploy review and my 15:30 check-in can move. Nothing
else today outranks restoring quotes.