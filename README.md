
Timegrass
------

Time flies and tasks grow like grass.

### Workflow

https://github.com/Cumulo/calcium-workflow

### Local development

```bash
corepack enable
corepack prepare yarn@4.12.0 --activate
caps
yarn install --immutable

# browser client and static assets
yarn watch-page
yarn dev-page

# realtime server
mode=dev calcit -w calcit.cirru --entry server
```

`calcit.cirru` now uses explicit entries: the default browser entry runs in
JavaScript mode and the `server` entry runs natively. `storage.cirru` remains
Cirru EDN and is loaded with `parse-cirru-edn` then written with
`format-cirru-edn`; its existing on-disk shape is preserved, with only runtime
sessions omitted as before.

The browser keeps the nominal `ws-edn` client and applies a small typed recovery
policy on page-touch, visibility, and online events. A reconnect receives a new
server session; login then rebuilds the client cache from an empty server-side
cache, so the legacy patch protocol still converges without changing persisted
application data.

Keep the Calcit CLI and `@calcit/procs` runtime on the same version. The local
development command starts Vite with `--force` so stale optimized dependencies
cannot retain a previous runtime after an upgrade.

### Upgrade validation

Use released module tags and validate the full graph before committing:

```bash
caps --strict --ci
calcit edit format
calcit --check-only
calcit --entry server --check-only
calcit analyze deprecated
calcit test app.client/choose-recovery-action --tag client --require-match
yarn compile-page
yarn release-page
```

Never test a migration against the live `storage.cirru`. Copy it outside the
repository, then verify the same parse/persist/format/parse path used by the
server. The committed upgrade was checked against a read-only copy of the real
state; the source file's size and SHA-256 remained unchanged.

### License

MIT
