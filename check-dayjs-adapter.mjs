import assert from 'node:assert/strict';

import { _$L_, _$n__$M_, init_tags, result_$o_err_$q_, result_$o_ok_$q_ } from './js-out/calcit.core.mjs';
import { comp_done_task } from './js-out/app.comp.history.mjs';
import { decode_timestamp, format_timestamp } from './js-out/app.comp.navigation.mjs';
import { comp_note } from './js-out/app.comp.notes-page.mjs';

const tags = init_tags(['cursor', 'data', 'finished-time', 'time', 'text', 'id']);
const states = _$n__$M_(tags.cursor, _$L_(), tags.data, _$n__$M_());
const task = (timestamp) => _$n__$M_(tags['finished-time'], timestamp, tags.text, 'Done', tags.id, 'task-1');
const note = (timestamp) => _$n__$M_(tags.time, timestamp, tags.text, 'Note', tags.id, 'note-1');

assert.equal(result_$o_ok_$q_(decode_timestamp(1735689600000)), true);
assert.equal(result_$o_err_$q_(decode_timestamp('invalid')), true);
assert.equal(result_$o_err_$q_(decode_timestamp(null)), true);
assert.match(format_timestamp(1735689600000, 'HH:mm'), /^\d{2}:\d{2}$/);
assert.throws(() => format_timestamp(Number.NaN, 'HH:mm'), /Invalid-dayjs-timestamp/);
assert.throws(() => format_timestamp(Number.POSITIVE_INFINITY, 'HH:mm'), /Invalid-dayjs-timestamp/);
assert.doesNotThrow(() => comp_done_task(states, task(1735689600000)));
assert.throws(() => comp_done_task(states, task('invalid')), /expected number/);
assert.doesNotThrow(() => comp_note(states, note(1735689600000)));
assert.throws(() => comp_note(states, note('invalid')), /expected number/);
