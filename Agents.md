# Timegrass maintenance

Use the released Calcit CLI and `@calcit/procs` versions declared in deps.cirru and package.json. Read `calcit docs agents --full` and `calcit docs upgrade` before editing; command syntax from old migrations is not authoritative.

## Source editing

Treat calcit.cirru as a Snapshot. Do not read, search, patch or diff its serialized contents. Use official `query ns`, `query defs`, `query def`, `query context` and `tree show` to inspect source; use `edit`/`tree` commands to change it. For multiple changes, preview `edit transaction --dry-run --format json`, then apply with the returned revision. Keep definition metadata and attached tests. Run `calcit calcit.cirru edit format` before committing. Do not regenerate compact.cirru or package.cirru, and do not commit js-out, dist, runtime storage or generated diagnostics.

Type annotations use current quoted types and Fn arrow syntax. Import rules and :refer names are syntax lists without redundant [] markers. Prefer truthful explicit schemas and checked external boundaries; do not add casts, proof wrappers, Dynamic or budget exceptions merely to pass checks. Preserve the real JS `hud!` import and page error display.

## Realtime and persistence contracts

- The ACKed projection is the diff baseline. Never advance a client cache before ACK.
- Keep updaters deterministic and serial, without I/O. Do not broadcast full data or expose passwords/private data through session projections.
- Revision mismatch, invalid patches, reconnect and foreground recovery request a snapshot. Preserve bounded backpressure and retain only the newest dirty revision for retry.
- Retain nominal wire envelopes and checked legacy Map database restoration, original failure order, empty startup sessions and existing storage format. Reviewed raw legacy input boundaries remain raw until decoded; do not claim arbitrary patches preserve a generic T.
- Register automatic persistence only after successful restoration. Do not overwrite a rejected archive.

## Validation and deployment

Run `caps --strict --ci`, `yarn install --immutable` and `caps verify --toolchain`. Keep the one-hour npm age gate. Run the original client/server check and test scripts, strict workflow verification, deprecated/dynamic-method gates, frontend build and all four original JS contract scripts. Preserve test assertions and selectors; never use compatibility mode or disable proof auditing to bypass failures. A compiler limitation needs a minimal upstream report and an explicit unresolved status.

Local browser URLs must include `?mode=dev&host=127.0.0.1&port=...`; otherwise the app connects to production. Bind native tests with `WSS_BIND_ADDRESS=127.0.0.1` and use fresh isolated storage. Readiness requires checking the actual listener, not just the URL. Do not use real accounts or archives in synthetic acceptance.

Keep frontend COS uploads limited to dist and use the action's builtin verify with the existing isolated PR prefix. Preserve production frontend/backend paths and branch conditions. Source upload does not install dependencies or restart the backend. Do not merge/deploy this business app without authorization. PR descriptions should explain user impact, changes, limitations and actual validation in Chinese.
