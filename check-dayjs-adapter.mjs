import assert from 'node:assert/strict';

import { result_$o_err_$q_, result_$o_ok_$q_ } from './js-out/calcit.core.mjs';
import { decode_timestamp, format_timestamp } from './js-out/app.comp.navigation.mjs';

assert.equal(result_$o_ok_$q_(decode_timestamp(1735689600000)), true);
assert.equal(result_$o_err_$q_(decode_timestamp('invalid')), true);
assert.equal(result_$o_err_$q_(decode_timestamp(null)), true);
assert.match(format_timestamp(1735689600000, 'HH:mm'), /^\d{2}:\d{2}$/);
assert.throws(() => format_timestamp(Number.NaN, 'HH:mm'), /Invalid-dayjs-timestamp/);
assert.throws(() => format_timestamp(Number.POSITIVE_INFINITY, 'HH:mm'), /Invalid-dayjs-timestamp/);
