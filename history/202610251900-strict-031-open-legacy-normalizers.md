# Prepare for the Calcit 0.31 strict default

- `normalize-note-record`, `normalize-task-record`, `normalize-note-map`, `normalize-task-map` and `normalize-user-tasks` accept any legacy value and pass non-Map values through unchanged (their tests check `nil`, `false`, `0` and `|`). Their schemas claimed `T -> T`, but a `map?` guard does not prove that a rebuilt map is still `T`, which the 0.31 strict checker now rejects (calcit#2187). They now declare the open `Dynamic -> Dynamic` contract they actually have.
- `app.client/validate-server-patch` returns the store produced by Recollect's patch application, which is open, while `*store` is an open `Ref`. The schema now says `Dynamic -> Result<Dynamic, ClientPatchError>` instead of claiming the input type `T` survives.
- With calcit main (including calcit#2388 for typed `dissoc`), `fix --workflow strict --verify` reports no diagnostics apart from the version preflight; before these changes it reported 26.
