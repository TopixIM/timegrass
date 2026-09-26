import assert from 'node:assert/strict';
import {
  parse_cirru_edn, format_cirru_edn, init_tags,
  _$n_enum_$o_nth as enumNth,
  result_$o_ok_$q_ as isOk,
  result_$o_err_$q_ as isErr,
} from './.calcit/js-server/calcit.core.mjs';
import { test_database, database_to_map, load_database, decode_operation } from './.calcit/js-server/app.schema.mjs';
import { updater } from './.calcit/js-server/app.updater.mjs';
import { twig_user } from './.calcit/js-server/app.twig.user.mjs';

const tags = init_tags(['users', 'sessions', 'tasks', 'working', 'finished', 'notes', 'text', 'password', 'user', 'router', 'name', 'data', 'pending?', 'today']);
const at = (value, ...keys) => keys.reduce((v, k) => v.get(tags[k] ?? k), value);
let db = test_database();
let sequence = 0;
function dispatch(source, id = `op-${++sequence}`, sid = 7) {
  // Exercise actual EDN wire decoding, including nominal Struct/Enum round trips.
  const decoded = decode_operation(parse_cirru_edn(source));
  assert.equal(isOk(decoded), true, source);
  const wire = decode_operation(parse_cirru_edn(format_cirru_edn(enumNth(decoded, 1))));
  assert.equal(isOk(wire), true, source);
  db = updater(db, enumNth(wire, 1), sid, id, 1790406000000);
  return database_to_map(db);
}

let projected = dispatch(':: :task/create-working |created', 'task-js');
assert.equal(at(projected, 'users', 'u1', 'tasks', 'working', 'task-js', 'text'), 'created');
projected = dispatch(':: :task/update-working $ {} (:id |task-js) (:text |edited)');
assert.equal(at(projected, 'users', 'u1', 'tasks', 'working', 'task-js', 'text'), 'edited');
projected = dispatch(':: :task/pend |task-js');
assert.equal(at(projected, 'users', 'u1', 'tasks', 'working', 'task-js', 'pending?'), true);
projected = dispatch(':: :task/finish-working |task-js');
assert.equal(at(projected, 'users', 'u1', 'tasks', 'working', 'task-js'), null);
assert.equal(at(projected, 'users', 'u1', 'tasks', 'finished', 'task-js', 'text'), 'edited');
projected = dispatch(':: :task/put-back |task-js');
assert.equal(at(projected, 'users', 'u1', 'tasks', 'working', 'task-js', 'text'), 'edited');
dispatch(':: :note/add |note', 'note-js');
projected = dispatch(':: :note/edit $ {} (:id |note-js) (:text |edited-note)');
assert.equal(at(projected, 'users', 'u1', 'notes', 'note-js', 'text'), 'edited-note');
projected = dispatch(':: :router/change $ {} (:name :notes) (:data $ {} (:year 2026) (:month 8))');
assert.equal(at(projected, 'sessions', 7, 'router', 'name').toString(), ':notes');
// Date-based note filtering uses the native server's date FFI and is covered
// by native definition tests and the real local browser/server smoke.
projected = dispatch(':: :router/change $ {} (:name :home)');
const publicUser = twig_user(at(projected, 'users', 'u1'));
assert.equal(at(publicUser, 'password'), null);
assert.equal(at(publicUser, 'tasks'), null);
assert.equal(at(publicUser, 'name'), 'Alice');

// Persisted wire format remains a legacy Map. Startup drops stale sessions.
const loaded = load_database(parse_cirru_edn(format_cirru_edn(projected)));
assert.equal(isOk(loaded), true);
const restored = database_to_map(enumNth(loaded, 1));
assert.deepEqual(at(restored, 'users'), at(projected, 'users'));
assert.equal(at(restored, 'sessions').len(), 0);
assert.equal(at(restored, 'today'), at(projected, 'today'));
assert.equal(isErr(load_database(parse_cirru_edn('{} (:users $ {} (|bad $ {} (:id |other)))'))), true);

projected = dispatch(':: :note/remove |note-js');
assert.equal(at(projected, 'users', 'u1', 'notes', 'note-js'), null);
projected = dispatch(':: :task/remove-working |task-js');
assert.equal(at(projected, 'users', 'u1', 'tasks', 'working', 'task-js'), null);
dispatch(':: :session/disconnect');
const disconnected = db;
dispatch(':: :task/create-working |ignored');
assert.equal(db, disconnected);
console.log('Typed database business operations, wire round trips, persistence, privacy, and stale-session checks passed.');
