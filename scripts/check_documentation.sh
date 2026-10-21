#!/bin/sh
# Check the declared Perch documentation with one verified source release.
set -eu

fail() {
    printf '%s\n' "Documentation check unavailable: $*" >&2
    exit 2
}

[ "$#" -eq 0 ] || fail "this wrapper takes no arguments"
perch_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
tool_root=${PERCH_DOCUMENTATION_TOOLS:-"$HOME/.local/share/engineering-rules/0.1.9"}
revision=f80213f14acf839b6d5ba9f131d4c113182e2592
checker_hash=a581576ff1fb6bd56e80785ebed9d028ea7a3ace986b97a20b4587b2cd2515fb
requirements_hash=6fd7cf677f2a33fc6d78057d60cf9ea9df01d21e85a1de4ccde742b1d57b584b

[ -d "$tool_root" ] || fail "install the verified EngineeringRules v0.1.9 source checkout first"
actual_revision=$(git -C "$tool_root" rev-parse --verify HEAD 2>/dev/null) || fail "tool checkout is not readable"
[ "$actual_revision" = "$revision" ] || fail "expected EngineeringRules v0.1.9 at $revision; found $actual_revision"

verify_file() {
    [ -f "$tool_root/$1" ] || fail "missing tool file: $1"
    actual_hash=$(shasum -a 256 "$tool_root/$1") || fail "cannot hash tool file: $1"
    actual_hash=${actual_hash%% *}
    [ "$actual_hash" = "$2" ] || fail "tool file differs from the pinned release: $1"
}

verify_file Scripts/check-docs.py "$checker_hash"
verify_file Configuration/documentation-requirements.txt "$requirements_hash"
documentation_python="$tool_root/.build/docs-venv/bin/python"
[ -x "$documentation_python" ] || fail "the release's documentation Python environment is missing"

# Isolation avoids importing from the caller's working directory or PYTHONPATH.
# Bytecode writes are disabled so checking does not modify the shared installation.
exec "$documentation_python" -I -B "$tool_root/Scripts/check-docs.py" \
    --root "$perch_root" --config .documentation-rules.json
