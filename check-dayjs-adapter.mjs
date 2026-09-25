import assert from 'node:assert/strict';
import dayjs from 'dayjs';
import weekOfYear from 'dayjs/plugin/weekOfYear.js';

import { _$L_, _$n__$M_, init_tags, result_$o_err_$q_, result_$o_ok_$q_ } from './js-out/calcit.core.mjs';
import { comp_done_task } from './js-out/app.comp.history.mjs';
import { current_history_route, date_labels, date_time_format, decode_timestamp, format_timestamp, week_bounds } from './js-out/app.comp.navigation.mjs';
import { comp_note } from './js-out/app.comp.notes-page.mjs';

dayjs.extend(weekOfYear);

const tags = init_tags(['cursor', 'data', 'finished-time', 'time', 'text', 'id', 'start', 'end', 'weekday', 'week']);
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

const expectedWeek = dayjs().year(2026).week(37);
const bounds = week_bounds(2026, 37);
assert.equal(date_time_format, 'YYYY-MM-DDTHH:mm:ss ZZ');
assert.equal(bounds.nthAt(1, tags.start), expectedWeek.startOf('week').format(date_time_format));
assert.equal(bounds.nthAt(0, tags.end), expectedWeek.endOf('week').format(date_time_format));
assert.throws(() => week_bounds(Number.NaN, 37), /Invalid-dayjs-week/);

const currentBounds = current_history_route().get(tags.data);
assert.match(currentBounds.get(tags.start), /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2} [+-]\d{4}$/);
assert.match(currentBounds.get(tags.end), /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2} [+-]\d{4}$/);

const expectedDate = dayjs('2026-09-14');
const labels = date_labels('2026-09-14');
assert.equal(labels.nthAt(2, tags.weekday), expectedDate.format('ddd'));
assert.equal(labels.nthAt(1, tags.week), expectedDate.week());
