import assert from 'node:assert/strict';
import {
  parse_cirru_edn,
  format_cirru_edn,
  init_tags,
  _$n_enum_$o_nth as enumNth,
  result_$o_ok_$q_ as isOk,
  result_$o_err_$q_ as isErr,
} from './js-out/calcit.core.mjs';
import { decode_operation } from './js-out/app.schema.mjs';
import { remove_message } from './js-out/app.updater.session.mjs';

const tags = init_tags(['sessions', 'messages', 'today']);
const db = parse_cirru_edn(`{} (:today |2026-09-26)
  :sessions $ {}
    7 $ {} $ :messages $ {} (|m1 |remove) (|m2 |keep)
    8 $ {} $ :messages $ {} (|m1 |other-session)
`);

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
  const sessions = updated.get(tags.sessions);
  assert.equal(sessions.get(7).get(tags.messages).get('m1'), null);
  assert.equal(sessions.get(7).get(tags.messages).get('m2'), 'keep');
  assert.equal(sessions.get(8).get(tags.messages).get('m1'), 'other-session');
  assert.equal(updated.get(tags.today), '2026-09-26');
}

for (const payload of ['nil', '7', '$ {}', '$ {} (:id nil)', '$ {} (:id 7)']) {
  assert.equal(isErr(decode_operation(parse_cirru_edn(`:: :session/remove-message ${payload}`))), true);
}
assert.equal(remove_message(db, 'm1', 99, 'late-op', 2), db);
console.log('Session message decoding, wire round-trip, isolation, and stale-session checks passed.');
