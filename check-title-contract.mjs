import assert from 'node:assert/strict';
import { execFileSync, spawnSync } from 'node:child_process';
import { copyFile, mkdir, mkdtemp, rm, symlink } from 'node:fs/promises';
import { join, resolve } from 'node:path';
import { pathToFileURL } from 'node:url';

const binary = process.env.CALCIT_BIN ?? 'calcit';
const run = (...args) => execFileSync(binary, args, { encoding: 'utf8', timeout: 60000 });
await mkdir('.calcit', { recursive: true });
const directory = await mkdtemp(resolve('.calcit/title-contract-'));
try {
  const snapshot = join(directory, 'calcit.cirru');
  await copyFile('calcit.cirru', snapshot);
  await copyFile('deps.cirru', join(directory, 'deps.cirru'));
  await mkdir(join(directory, '.calcit'));
  await symlink(resolve('.calcit/modules'), join(directory, '.calcit/modules'), 'dir');
  // The assertions live in Calcit :tests; this runner only supplies the JS host.
  const source = JSON.parse(run('cirru', 'parse-edn', '--file', snapshot));
  const tests = source[':files']["'app.comp.overview"].defs["'comp-title"].tests;
  assert.ok(tests.length > 0, 'title contract must select at least one test');
  run(snapshot, 'edit', 'def', 'app.comp.overview/run-title-tests!', '--input-format', 'json-ast', '--code',
    JSON.stringify(['defn', 'run-title-tests!', [], ...tests.map(test => test.code.__edn_quote), '&unit']));
  run(snapshot, 'edit', 'schema', 'app.comp.overview/run-title-tests!', '--input-format', 'cirru', '--code',
    "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)");
  const output = join(directory, 'js-out');
  run(snapshot, '--reload-fn', 'app.comp.overview/run-title-tests!', '--emit-path', output, 'js');
  const compiled = await import(pathToFileURL(join(output, 'app.comp.overview.mjs')).href);
  compiled.run_title_tests_$x_();
  console.log(`Title optional-parameter contract: ${tests.length} Calcit tests passed on JS`);
  for (const argument of ['false', 'nil', ['%some', 'false']]) {
    run(snapshot, 'edit', 'def', 'app.comp.overview/run-title-tests!', '--overwrite', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'run-title-tests!', [], ['comp-title', '|Title', ['%none'], argument], '&unit']));
    const result = spawnSync(binary, [snapshot, '--reload-fn', 'app.comp.overview/run-title-tests!', '--check-only'],
      { encoding: 'utf8', timeout: 60000 });
    assert.ifError(result.error);
    assert.equal(result.status, 1, `invalid callback must fail: ${JSON.stringify(argument)}`);
    assert.match(result.stdout + result.stderr, /[Tt]ype mismatch|W_FN_ARG_TYPE/);
  }
  console.log('Title callback contract: nil, false and Some(false) rejected');
} finally {
  await rm(directory, { recursive: true, force: true });
}
