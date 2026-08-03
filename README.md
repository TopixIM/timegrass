
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
mode=dev cr calcit.cirru --entry server -w
```

`calcit.cirru` now uses explicit entries: the default browser entry runs in
JavaScript mode and the `server` entry runs natively. `storage.cirru` remains
Cirru EDN and is loaded with `parse-cirru-edn` then written with
`format-cirru-edn`; its existing on-disk shape is preserved, with only runtime
sessions omitted as before.

Calcit 0.12.59 currently requires `recollect` 0.0.19 here. Newer recollect
releases have an upstream schema issue that blocks JS code generation; see
https://github.com/calcit-lang/recollect/issues/25 before removing the pin.

Keep the Calcit CLI and `@calcit/procs` runtime on the same version. The local
development command starts Vite with `--force` so stale optimized dependencies
cannot retain a previous runtime after an upgrade.

### License

MIT
