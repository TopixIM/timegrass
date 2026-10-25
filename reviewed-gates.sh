set -euo pipefail
export VITE_BASE_URL=./
# Original: Validate Calcit snapshot, types, and tests
calcit calcit.cirru fix --workflow strict --verify --format edn
calcit calcit.cirru --check-only
calcit calcit.cirru test --tag :client --require-match
calcit calcit.cirru --entry server --check-only
calcit calcit.cirru --entry server test --exclude-tag :js --require-match
calcit calcit.cirru analyze weak-types --only coverage --summary-only --format json
calcit calcit.cirru --entry server analyze weak-types --only coverage --summary-only --format json
calcit calcit.cirru analyze weak-types --only schema-dynamic,code-dynamic --intent unresolved --summary-only --format json
calcit calcit.cirru --entry server analyze weak-types --only schema-dynamic,code-dynamic --intent unresolved --summary-only --format json
calcit calcit.cirru analyze weak-types --only deprecated-call --summary-only
calcit calcit.cirru --entry server analyze weak-types --only deprecated-call --summary-only
calcit calcit.cirru analyze weak-types --only dynamic-method --summary-only --format json | jq -e '.data.summary.findings == 0'
calcit calcit.cirru --entry server analyze weak-types --only dynamic-method --summary-only --format json | jq -e '.data.summary.findings == 0'
yarn compile-page
yarn release-page
# Original: Verify generated JavaScript contracts
yarn check-dayjs-adapter
yarn check-title-contract
yarn check-session-messages
yarn check-typed-database
mkdir -p dist-server && cp -v calcit.cirru package.json deps.cirru dist-server/
