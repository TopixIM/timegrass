import assert from 'node:assert/strict';
import { execFileSync, spawnSync } from 'node:child_process';
import { copyFile, mkdir, mkdtemp, rm, symlink } from 'node:fs/promises';
import { join, resolve } from 'node:path';

const binary = process.env.CALCIT_BIN ?? 'calcit';
const run = (...args) => execFileSync(binary, args, { encoding: 'utf8', timeout: 60000 });

const { _PCT_none } = await import('./js-out/calcit.core.mjs');
const { comp_title } = await import('./js-out/app.comp.overview.mjs');
assert.doesNotThrow(() => comp_title('Title', _PCT_none(), _PCT_none()));
console.log('Title optional-parameter contract passed on generated JavaScript');

await mkdir('.calcit', { recursive: true });
const directory = await mkdtemp(resolve('.calcit/title-contract-'));
try {
  const snapshot = join(directory, 'calcit.cirru');
  await copyFile('calcit.cirru', snapshot);
  await copyFile('deps.cirru', join(directory, 'deps.cirru'));
  await mkdir(join(directory, '.calcit'));
  await symlink(resolve('.calcit/modules'), join(directory, '.calcit/modules'), 'dir');

  for (const argument of ['false', 'nil', ['Option', ':some', 'false']]) {
    run(snapshot, 'edit', 'def', 'app.comp.overview/run-title-tests!', '--overwrite', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'run-title-tests!', [],
        ['comp-title', '|Title', ['Option', ':some', ['<>', '|Child']], argument],
        '&unit']));
    run(snapshot, 'edit', 'schema', 'app.comp.overview/run-title-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)");
    const result = spawnSync(binary, [snapshot, '--reload-fn', 'app.comp.overview/run-title-tests!', '--check-only'],
      { encoding: 'utf8', timeout: 60000 });
    assert.ifError(result.error);
    assert.equal(result.status, 1, `invalid callback must fail: ${JSON.stringify(argument)}`);
    assert.match(result.stdout + result.stderr, /[Tt]ype mismatch|E_DYNAMIC_NOMINAL_ARGUMENT|W_FN_ARG_TYPE/);
  }
  console.log('Title callback contract: nil, false and Some(false) rejected');
} finally {
  await rm(directory, { recursive: true, force: true });
}
