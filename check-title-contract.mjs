import assert from 'node:assert/strict';
import { execFileSync, spawnSync } from 'node:child_process';
import { copyFile, mkdir, mkdtemp, rm, symlink } from 'node:fs/promises';
import { join, resolve } from 'node:path';
import { createServer } from 'vite';

const binary = process.env.CALCIT_BIN ?? 'calcit';
const run = (...args) => execFileSync(binary, args, { encoding: 'utf8', timeout: 60000 });
const editBinary = process.env.CALCIT_EDIT_BIN ?? binary;
const edit = (...args) => execFileSync(editBinary, args, { encoding: 'utf8', timeout: 60000 });

await mkdir('.calcit', { recursive: true });
const directory = await mkdtemp(resolve('.calcit/title-contract-'));
let moduleServer;
const loadReplayModule = (output, namespace) => moduleServer.ssrLoadModule(join(output, `${namespace}.mjs`));
try {
  // Use the application's existing bundler for browser-only package imports.
  moduleServer = await createServer({
    configFile: false,
    server: { middlewareMode: true, watch: null, hmr: false, ws: false },
    ssr: { noExternal: ['bottom-tip'] },
  });
  const snapshot = join(directory, 'calcit.cirru');
  await copyFile('calcit.cirru', snapshot);
  await copyFile('deps.cirru', join(directory, 'deps.cirru'));
  await mkdir(join(directory, '.calcit'));
  await symlink(resolve('.calcit/modules'), join(directory, '.calcit/modules'), 'dir');

  const { data } = JSON.parse(run(snapshot, 'query', 'def', 'app.comp.overview/comp-title', '--format', 'json'));
  const tests = data.tests.filter(test => test.tags.includes('title-contract'));
  assert.equal(tests.length, 5, 'Replay every existing title contract');
  const sortData = JSON.parse(run(snapshot, 'query', 'def', 'app.comp.overview/task-sort-key', '--format', 'json')).data;
  const sortTests = sortData.tests.filter(test => test.tags.includes('task-sort-contract'));
  assert.equal(sortTests.length, 4, 'Replay timestamp selection, full errors, lazy fallback and ordering');
  const loginData = JSON.parse(run(snapshot, 'query', 'def', 'app.comp.login/on-submit', '--format', 'json')).data;
  const loginTests = loginData.tests.filter(test => test.tags.includes('login-contract'));
  assert.equal(loginTests.length, 2, 'Replay both attached login/signup contracts');
  const loginInputData = JSON.parse(run(snapshot, 'query', 'def', 'app.comp.login/comp-login', '--format', 'json')).data;
  const loginInputTests = loginInputData.tests.filter(test => test.tags.includes('login-input-contract'));
  assert.equal(loginInputTests.length, 1, 'Replay the mixed-cursor login input tree');
  const loginValueTests = loginInputData.tests.filter(test => test.tags.includes('login-value-contract'));
  assert.equal(loginValueTests.length, 1, 'Replay missing/nil/false/zero/empty input values through both callbacks');
  const loginRequiredTests = loginInputData.tests.filter(test => test.tags.includes('login-required-contract'));
  assert.equal(loginRequiredTests.length, 4, 'Replay required login fields without business defaults');
  const notesData = JSON.parse(run(snapshot, 'query', 'def', 'app.comp.notes-page/comp-notes-page', '--format', 'json')).data;
  const notesRouteTests = notesData.tests.filter(test => test.tags.includes('notes-route-contract'));
  assert.equal(notesRouteTests.length, 3, 'Replay required notes route fields and zero-based months');
  const keydownData = JSON.parse(run(snapshot, 'query', 'def', 'app.comp.overview/comp-global-keydown', '--format', 'json')).data;
  const keydownTests = keydownData.tests.filter(test => test.tags.includes('keydown-contract'));
  assert.equal(keydownTests.length, 1, 'Replay the attached keydown forwarding contract');
  const autoLoginData = JSON.parse(run(snapshot, 'query', 'def', 'app.client/simulate-login!', '--format', 'json')).data;
  const autoLoginTests = autoLoginData.tests.filter(test => test.tags.includes('auto-login-contract'));
  assert.equal(autoLoginTests.length, 1, 'Replay the attached automatic-login return contract');
  const renderData = JSON.parse(run(snapshot, 'query', 'def', 'app.client/dispatch-render-operation!', '--format', 'json')).data;
  assert.equal(renderData.tests.length, 3, 'Replay checked rendering dispatch, framework cursor dispatch and rejection');
  const containerData = JSON.parse(run(snapshot, 'query', 'def', 'app.comp.container/comp-container', '--format', 'json')).data;
  const containerTests = containerData.tests.filter(test => test.tags.includes('container-contract'));
  assert.equal(containerTests.length, 8, 'Replay loaded/offline boundaries, lazy router fallback, missing-field paths and scalar validation order');
  const operations = [
    ['edit', 'def', 'app.client/prepare-host-tests!', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'prepare-host-tests!', [], ['replay-auto-login-tests!'], ['replay-render-operation-tests!'], ['app.comp.overview/replay-title-tests!'], '&unit'])],
    ['edit', 'schema', 'app.client/prepare-host-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
    ['edit', 'def', 'app.comp.container/replay-container-tests!', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'replay-container-tests!', [], ...containerTests.map(test => test.code), '&unit'])],
    ['edit', 'schema', 'app.comp.container/replay-container-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
    ['edit', 'def', 'app.client/replay-auto-login-tests!', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'replay-auto-login-tests!', [], ...autoLoginTests.map(test => test.code), '&unit'])],
    ['edit', 'schema', 'app.client/replay-auto-login-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
    ['edit', 'def', 'app.client/replay-render-operation-tests!', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'replay-render-operation-tests!', [], ...renderData.tests.map(test => test.code), '&unit'])],
    ['edit', 'schema', 'app.client/replay-render-operation-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
    ['edit', 'def', 'app.comp.login/replay-login-tests!', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'replay-login-tests!', [], ...loginTests.map(test => test.code), ...loginInputTests.map(test => test.code), ...loginValueTests.map(test => test.code), ...loginRequiredTests.map(test => test.code), '&unit'])],
    ['edit', 'schema', 'app.comp.login/replay-login-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
    ['edit', 'def', 'app.comp.notes-page/replay-route-tests!', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'replay-route-tests!', [], ...notesRouteTests.map(test => test.code), '&unit'])],
    ['edit', 'schema', 'app.comp.notes-page/replay-route-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
    ['edit', 'def', 'app.comp.overview/replay-title-tests!', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'replay-title-tests!', [], ...tests.map(test => test.code), ...sortTests.map(test => test.code), ...keydownTests.map(test => test.code), ['app.comp.login/replay-login-tests!'], ['app.comp.notes-page/replay-route-tests!'], ['app.comp.container/replay-container-tests!'], '&unit'])],
    ['edit', 'schema', 'app.comp.overview/replay-title-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)"],
  ];
  const transaction = [snapshot, 'edit', 'transaction', '--code', JSON.stringify(operations), '--format', 'json'];
  const preview = JSON.parse(edit(...transaction, '--dry-run'));
  edit(...transaction, '--expect-revision', preview.scoped_revision);
  const output = join(directory, 'js-out');
  // Compile all replay roots together, then invoke each under its isolated host fixture.
  run(snapshot, '--init-fn', 'app.client/prepare-host-tests!', '--reload-fn', 'app.client/prepare-host-tests!', '--emit-path', output, 'js');
  const overview = await loadReplayModule(output, 'app.comp.overview');
  const login = await loadReplayModule(output, 'app.comp.login');
  const core = await loadReplayModule(output, 'calcit.core');
  assert.doesNotThrow(() => overview.comp_title('Title', core._PCT_none(), core._PCT_none()));
  console.log('Title optional-parameter contract passed on freshly generated JavaScript');
  const titleEvent = core.parse_cirru_edn('{} (:value |title-event)');
  const titleDispatch = () => {};
  const titleCalls = [];
  const titleComponent = overview.comp_title('Title', core._PCT_none(), core._PCT_some((event, dispatch) => {
    titleCalls.push([event, dispatch]);
  }));
  const titleTree = core.option_$o_unwrap(titleComponent.get('tree')).get(1);
  const titleClick = titleTree.get('event').get(core.turn_tag('click'));
  assert.equal(titleClick(titleEvent, titleDispatch), undefined);
  assert.deepEqual(titleCalls, [[titleEvent, titleDispatch]]);
  // Inspect the generated host callbacks without mounting a browser or writing storage.
  const inputState = core.parse_cirru_edn('{} (:username |existing-user) (:password |existing-password) (:extra |preserved)');
  const inputCursor = core.parse_cirru_edn('[] :login |panel 7');
  const inputStates = core._$n__$M_(core.turn_tag('cursor'), inputCursor, core.turn_tag('data'), inputState,
    core.turn_tag('child'), 'tag-branch', 'child', 'string-branch', 7, 'number-branch');
  // Invalid host callers must not gain get-in's permissive nil-base behavior.
  for (const invalid of [null, undefined, false, 7, 'invalid', core.parse_cirru_edn('[]'), {}]) {
    assert.throws(() => login.comp_login(invalid), /decode-map-as failed.*expected map/);
  }
  for (const cursor of [null, false, 7, 'invalid', core.parse_cirru_edn('{}')]) {
    const invalid = core._$n__$M_(core.turn_tag('cursor'), cursor, core.turn_tag('data'), inputState);
    assert.throws(() => login.comp_login(invalid), /Expected-state-cursor-List/);
  }
  const loginComponent = login.comp_login(inputStates);
  const inputs = [];
  const visit = node => {
    const value = node.get(1);
    if (node.tag.value === 'component') {
      const tree = value.get('tree');
      if (tree.tag.value === 'some') visit(tree.get(1));
      return;
    }
    assert.equal(node.tag.value, 'element');
    if (value.get('name').value === 'input') inputs.push(value);
    for (const pair of core.listToArray(value.get('children'))) {
      const child = pair.get('node');
      if (child.tag.value === 'some') visit(child.get(1));
    }
  };
  visit(core.option_$o_unwrap(loginComponent.get('tree')));
  assert.equal(inputs.length, 2);
  for (const [index, field] of ['username', 'password'].entries()) {
    const handler = inputs[index].get('event').get(core.turn_tag('input'));
    const calls = [];
    assert.equal(handler(core._$n__$M_(core.turn_tag('value'), 'edited-value'), op => { calls.push(op); }), undefined);
    assert.equal(calls.length, 1);
    assert.equal(calls[0].tag.value, 'states');
    assert.equal(calls[0].get(1), inputCursor, 'preserve the original mixed-key cursor');
    const changed = calls[0].get(2);
    assert.equal(changed.get(core.turn_tag('extra')), 'preserved', 'retain extra fields in the original state Map');
    assert.equal(changed.get(core.turn_tag(field)), 'edited-value');
    const other = field === 'username' ? 'password' : 'username';
    assert.equal(changed.get(core.turn_tag(other)), `existing-${other === 'username' ? 'user' : 'password'}`);
    assert.equal(inputState.get(core.turn_tag(field)), `existing-${field === 'username' ? 'user' : 'password'}`);
    for (const [key, expected] of [[core.turn_tag('child'), 'tag-branch'], ['child', 'string-branch'], [7, 'number-branch']]) {
      assert.equal(inputStates.get(key), expected, 'preserve Tag/String/Number branches in the original tree');
    }
    const failure = new Error(`isolated ${field} dispatch failure`);
    assert.throws(() => handler(core.parse_cirru_edn('{} (:value |changed)'), () => { throw failure; }), error => error === failure);
  }
  const notes = await loadReplayModule(output, 'app.comp.notes-page');
  const notesStates = core.parse_cirru_edn('{} (:cursor $ [] :notes |panel 7)');
  for (const [field, invalid] of ['year', 'month'].flatMap(field => ['|invalid', 'nil', 'false'].map(invalid => [field, invalid]))) {
    const route = core.parse_cirru_edn(`{} (:year ${field === 'year' ? invalid : '2026'}) (:month ${field === 'month' ? invalid : '0'})`);
    assert.throws(() => notes.comp_notes_page(notesStates, core.parse_cirru_edn('{}'), route),
      error => error.message.includes('decode-map-as failed') && error.message.includes(field));
  }
  const forwardedError = new Error('isolated keydown callback failure');
  const forwardedHandler = () => { throw forwardedError; };
  const keydownComponent = overview.comp_global_keydown(forwardedHandler);
  const keydownNode = core.option_$o_unwrap(keydownComponent.get('tree'));
  assert.equal(keydownNode.get(0).value, 'element');
  const keydownHandler = keydownNode.get(1).get('event').get(core.parse_cirru_edn('do :keydown'));
  assert.equal(keydownHandler, forwardedHandler, 'preserve the original typed callback');
  assert.throws(() => keydownHandler(core.parse_cirru_edn('{}'), () => {}), error => error === forwardedError);
  const globals = ['window', 'localStorage', 'document'].map(name => [name, Object.getOwnPropertyDescriptor(globalThis, name)]);
  const values = new Map();
  const writes = [];
  const timeline = [];
  let storageError;
  let readError;
  const storage = {
    get length() { return values.size; },
    key(index) { return [...values.keys()][index] ?? null; },
    getItem(key) {
      if (readError) throw readError;
      return values.get(key) ?? null;
    },
    removeItem(key) { values.delete(key); },
    clear() { values.clear(); },
    setItem(key, value) {
      timeline.push('storage');
      if (storageError) throw storageError;
      writes.push([key, value]);
      values.set(key, value);
    },
  };
  try {
    // Never write test credentials into a real browser storage object.
    Object.defineProperty(globalThis, 'window', { configurable: true, value: { localStorage: storage } });
    Object.defineProperty(globalThis, 'localStorage', { configurable: true, value: storage });
    const isolatedRoot = {};
    Object.defineProperty(globalThis, 'document', { configurable: true, value: {
      querySelector(selector) {
        assert.equal(selector, '.app');
        return isolatedRoot;
      },
    } });
    const client = await loadReplayModule(output, 'app.client');
    client.replay_render_operation_tests_$x_();
    client.replay_auto_login_tests_$x_();
    values.set('timegrass', '[] |incomplete-credentials');
    client.replay_auto_login_tests_$x_();
    readError = new Error('isolated storage read denial');
    client.replay_auto_login_tests_$x_();
    readError = undefined;
    values.set('timegrass', '%{}');
    assert.throws(() => core.parse_cirru_edn('%{}'));
    assert.throws(() => client.simulate_login_$x_(), 'malformed EDN must still propagate');
    values.clear();
    assert.equal(writes.length, 0, 'automatic login must not write credentials');
    overview.replay_title_tests_$x_();
    assert.deepEqual(writes, Array.from({ length: 2 }, () => [
      'timegrass', core.format_cirru_edn(core.parse_cirru_edn('[] |type-test-user |type-test-password')),
    ]));
    const handler = login.on_submit('type-test-user', 'type-test-password', false);
    const event = core.parse_cirru_edn('{}');
    timeline.length = 0;
    assert.equal(handler(event, () => { timeline.push('dispatch'); }), undefined);
    assert.deepEqual(timeline, ['dispatch', 'storage']);
    const dispatchError = new Error('isolated dispatch failure');
    timeline.length = 0;
    assert.throws(() => handler(event, () => {
      timeline.push('dispatch');
      throw dispatchError;
    }), error => error === dispatchError);
    assert.deepEqual(timeline, ['dispatch']);
    storageError = new Error('isolated storage failure');
    timeline.length = 0;
    assert.throws(() => handler(event, () => { timeline.push('dispatch'); }), error => error === storageError);
    assert.deepEqual(timeline, ['dispatch', 'storage']);
    Object.defineProperty(globalThis, 'localStorage', {
      configurable: true,
      get() { throw new Error('isolated storage access denial'); },
    });
    login.replay_login_tests_$x_();
    delete globalThis.localStorage;
    delete globalThis.window;
    login.replay_login_tests_$x_();
    assert.equal(writes.length, 3, 'unavailable storage must not write');
  } finally {
    for (const [name, descriptor] of globals) {
      if (descriptor) Object.defineProperty(globalThis, name, descriptor);
      else delete globalThis[name];
    }
  }
  console.log('All 5 title, 4 task-sort, 2 login, 1 login input tree, 1 input-value group, 4 required-login, 3 required-route, 1 keydown, 8 container, 3 render-dispatch and automatic-login contracts passed; mixed-cursor input dispatch, extra state fields, forwarding and storage failure semantics preserved.');

  for (const [argument, expectedStatus] of [
    [['Option', ':none'], 0],
    ['false', 1],
    ['nil', 1],
    [['Option', ':some', 'false'], 1],
  ]) {
    edit(snapshot, 'edit', 'def', 'app.comp.overview/run-title-tests!', '--overwrite', '--input-format', 'json-ast', '--code',
      JSON.stringify(['defn', 'run-title-tests!', [],
        ['comp-title', '|Title', ['Option', ':none'], argument],
        '&unit']));
    edit(snapshot, 'edit', 'schema', 'app.comp.overview/run-title-tests!', '--input-format', 'cirru', '--code',
      "quote $ :: 'Fn $ {} (:args $ []) (:return 'Unit)");
    const result = spawnSync(binary, [snapshot,
      '--init-fn', 'app.comp.overview/run-title-tests!',
      '--reload-fn', 'app.comp.overview/run-title-tests!', '--check-only'],
      { encoding: 'utf8', timeout: 60000 });
    assert.ifError(result.error);
    assert.equal(result.status, expectedStatus, `callback contract: ${JSON.stringify(argument)}\n${result.stdout}\n${result.stderr}`);
    if (expectedStatus !== 0) {
      assert.match(result.stdout + result.stderr, /[Tt]ype mismatch|E_DYNAMIC_NOMINAL_ARGUMENT|W_FN_ARG_TYPE/);
      assert.match(result.stdout + result.stderr, /comp-title/);
    }
  }
  console.log('Title callback contract: None accepted; nil, false and Some(false) rejected');
} finally {
  try {
    await moduleServer?.close();
  } finally {
    await rm(directory, { recursive: true, force: true });
  }
}
