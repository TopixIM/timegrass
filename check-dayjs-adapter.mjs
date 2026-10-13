import assert from 'node:assert/strict';
import { execFileSync, spawnSync } from 'node:child_process';
import { copyFile, mkdir, mkdtemp, rm, symlink } from 'node:fs/promises';
import { join, resolve } from 'node:path';
import { pathToFileURL } from 'node:url';
import dayjs from 'dayjs';
import weekOfYear from 'dayjs/plugin/weekOfYear.js';

const binary = process.env.CALCIT_BIN ?? 'calcit';
const run = (...args) => execFileSync(binary, args, { encoding: 'utf8', timeout: 60000 });
const editBinary = process.env.CALCIT_EDIT_BIN ?? binary;
const edit = (...args) => execFileSync(editBinary, args, { encoding: 'utf8', timeout: 60000 });
await mkdir('.calcit', { recursive: true });
const directory = await mkdtemp(resolve('.calcit/dayjs-adapter-'));

try {
  const snapshot = join(directory, 'calcit.cirru');
  const output = join(directory, 'js-out');
  await copyFile('calcit.cirru', snapshot);
  await copyFile('deps.cirru', join(directory, 'deps.cirru'));
  await mkdir(join(directory, '.calcit'));
  await symlink(resolve('.calcit/modules'), join(directory, '.calcit/modules'), 'dir');

  const replayFunctions = [];
  for (const target of ['app.comp.overview/comp-task', 'app.comp.history/comp-done-task', 'app.comp.notes-page/comp-note']) {
    const { data } = JSON.parse(run(snapshot, 'query', 'def', target, '--format', 'json'));
    const test = data.tests.find(test => test.name === 'accepts-tag-string-number-state-branches');
    assert.ok(test, `Missing state-key regression: ${target}`);
    assert.ok(test.tags.includes('js'), `State-key test requires the JS backend: ${target}`);
    const stateTests = data.tests.filter(item => item.name === test.name || item.tags.includes('task-state-contract') || item.tags.includes('menu-contract'));
    const replay = `${target.split('/')[0]}/replay-statekey!`;
    const operations = [
      ['edit', 'def', replay, '--input-format', 'json-ast', '--code', JSON.stringify(['defn', 'replay-statekey!', [], ...stateTests.map(item => item.code), '&unit'])],
      ['edit', 'schema', replay, '--input-format', 'cirru', '--code', "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
    ];
    const args = [snapshot, 'edit', 'transaction', '--code', JSON.stringify(operations), '--format', 'json'];
    const preview = JSON.parse(edit(...args, '--dry-run'));
    edit(...args, '--expect-revision', preview.scoped_revision);
    replayFunctions.push(replay);
  }

  for (const target of ['app.schema/decode-finished-task-view', 'app.comp.history/history-task-groups', 'app.comp.history/sort-finished-tasks', 'app.comp.overview/comp-overview']) {
    const { data } = JSON.parse(run(snapshot, 'query', 'def', target, '--format', 'json'));
    assert.ok(data.tests.length > 0, `Missing history boundary tests: ${target}`);
    const replay = `${target.split('/')[0]}/replay-${target.split('/')[1]}!`;
    const operations = [
      ['edit', 'def', replay, '--input-format', 'json-ast', '--code', JSON.stringify(['defn', replay.split('/')[1], [], ...data.tests.map(item => item.code), '&unit'])],
      ['edit', 'schema', replay, '--input-format', 'cirru', '--code', "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
    ];
    const args = [snapshot, 'edit', 'transaction', '--code', JSON.stringify(operations), '--format', 'json'];
    const preview = JSON.parse(edit(...args, '--dry-run'));
    edit(...args, '--expect-revision', preview.scoped_revision);
    replayFunctions.push(replay);
  }

  edit(snapshot, 'edit', 'def', 'app.comp.navigation/expose-dayjs-checks!', '--input-format', 'json-ast', '--code',
    JSON.stringify(['defn', 'expose-dayjs-checks!', [],
      ['date-labels', '|2026-09-14'],
      ['week-bounds', '2026', '37'],
      ['format-timestamp', '0', '|HH:mm'],
      ['decode-timestamp', '0'],
      ...replayFunctions.map(target => [target]),
      '&unit']));
  edit(snapshot, 'edit', 'schema', 'app.comp.navigation/expose-dayjs-checks!', '--input-format', 'cirru', '--code',
    "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)");
  const entry = [snapshot, '--init-fn', 'app.comp.navigation/expose-dayjs-checks!', '--reload-fn', 'app.comp.navigation/expose-dayjs-checks!'];
  try {
    run(...entry, '--emit-path', output, 'js');
  } catch (error) {
    const diagnosis = spawnSync(binary, [...entry, '--check-only', '--keep-going', '--format', 'json'], { encoding: 'utf8', timeout: 60000 });
    console.error(diagnosis.stdout || diagnosis.stderr);
    throw error;
  }

  const core = await import(pathToFileURL(join(output, 'calcit.core.mjs')).href);
  const history = await import(pathToFileURL(join(output, 'app.comp.history.mjs')).href);
  const schema = await import(pathToFileURL(join(output, 'app.schema.mjs')).href);
  const navigation = await import(pathToFileURL(join(output, 'app.comp.navigation.mjs')).href);
  const notes = await import(pathToFileURL(join(output, 'app.comp.notes-page.mjs')).href);
  const {
    _$L_,
    _$n__$M_,
    init_tags,
    result_$o_err_$q_,
    result_$o_ok_$q_,
  } = core;
  const { comp_done_task } = history;
  const {
    current_history_route,
    date_labels,
    date_time_format,
    decode_timestamp,
    format_timestamp,
    week_bounds,
  } = navigation;
  const { comp_note } = notes;

  dayjs.extend(weekOfYear);
  navigation.expose_dayjs_checks_$x_();
  console.log('Attached StateKey, state/menu and typed history boundary tests passed.');

  const tags = init_tags(['cursor', 'data', 'finished-time', 'time', 'text', 'id', 'start', 'end', 'weekday', 'week']);
  const states = _$n__$M_(tags.cursor, _$L_(), tags.data, _$n__$M_());
  const task = (timestamp) => {
    const decoded = schema.decode_finished_task_view(
      _$n__$M_(tags['finished-time'], timestamp, tags.text, 'Done', tags.id, 'task-1'));
    if (decoded.tag.value === 'err') throw new Error(decoded.get(1));
    assert.equal(decoded.tag.value, 'ok');
    return decoded.get(1);
  };
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
  console.log('Typed dayjs adapter checks passed on generated JavaScript.');
} finally {
  await rm(directory, { recursive: true, force: true });
}
