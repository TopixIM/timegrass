import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { copyFile, mkdir, mkdtemp, rm, symlink } from 'node:fs/promises';
import { join, resolve } from 'node:path';
import { pathToFileURL } from 'node:url';

const binary = process.env.CALCIT_BIN ?? 'calcit';
const run = (...args) => execFileSync(binary, args, { encoding: 'utf8', timeout: 60000 });
await mkdir('.calcit', { recursive: true });
const directory = await mkdtemp(resolve('.calcit/session-messages-'));

try {
  const snapshot = join(directory, 'calcit.cirru');
  const output = join(directory, 'js-out');
  await copyFile('calcit.cirru', snapshot);
  await copyFile('deps.cirru', join(directory, 'deps.cirru'));
  await mkdir(join(directory, '.calcit'));
  await symlink(resolve('.calcit/modules'), join(directory, '.calcit/modules'), 'dir');

  run(snapshot, 'edit', 'def', 'app.schema/expose-session-checks!', '--input-format', 'json-ast', '--code',
    JSON.stringify(['defn', 'expose-session-checks!', [],
      ['database-to-map', ['test-database']],
      '&unit']));
  run(snapshot, 'edit', 'schema', 'app.schema/expose-session-checks!', '--input-format', 'cirru', '--code',
    "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)");
  run(snapshot, '--reload-fn', 'app.schema/expose-session-checks!', '--emit-path', output, 'js');

  const core = await import(pathToFileURL(join(output, 'calcit.core.mjs')).href);
  const schema = await import(pathToFileURL(join(output, 'app.schema.mjs')).href);
  const session = await import(pathToFileURL(join(output, 'app.updater.session.mjs')).href);
  const {
    parse_cirru_edn,
    format_cirru_edn,
    init_tags,
    _$n_enum_$o_nth: enumNth,
    result_$o_ok_$q_: isOk,
    result_$o_err_$q_: isErr,
  } = core;
  const { decode_operation, test_database, database_to_map } = schema;
  const { remove_message } = session;

  const tags = init_tags(['sessions', 'messages', 'today']);
  const db = test_database();

  for (const source of [
    ':: :session/remove-message |m1',
    ':: :session/remove-message $ {} (:id |m1) (:token nil) (:index 0)',
  ]) {
    const decoded = decode_operation(parse_cirru_edn(source));
    assert.equal(isOk(decoded), true);
    const operation = enumNth(decoded, 1);
    const roundTrip = decode_operation(parse_cirru_edn(format_cirru_edn(operation)));
    assert.equal(isOk(roundTrip), true);
    const id = enumNth(enumNth(roundTrip, 1), 1);
    assert.equal(id, 'm1');
    const updated = remove_message(db, id, 7, 'op-1', 1);
    const projected = database_to_map(updated);
    const sessions = projected.get(tags.sessions);
    assert.equal(sessions.get(7).get(tags.messages).get('m1'), null);
    assert.equal(sessions.get(7).get(tags.messages).get('m2').get(init_tags(['text']).text), 'keep');
    assert.deepEqual(sessions.get(8), database_to_map(db).get(tags.sessions).get(8));
    assert.equal(projected.get(tags.today), '2026-09-26');
  }

  for (const payload of ['nil', '7', '$ {}', '$ {} (:id nil)', '$ {} (:id 7)']) {
    assert.equal(isErr(decode_operation(parse_cirru_edn(`:: :session/remove-message ${payload}`))), true);
  }
  assert.equal(remove_message(db, 'm1', 99, 'late-op', 2), db);
  console.log('Session message decoding, wire round-trip, isolation, and stale-session checks passed.');
} finally {
  await rm(directory, { recursive: true, force: true });
}
