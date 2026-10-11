"""Export the parameterized concept and fit coupons with installed OpenSCAD."""

import argparse
import hashlib
import json
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "cad" / "compact_dock.scad"
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--layout", choices=("side", "rear"), default="side")
parser.add_argument("--output", default="exports/concept", help="Output directory relative to project root")
args = parser.parse_args()
OUTPUT = ROOT / args.output
OPENSCAD = "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
PARTS = (
    "base", "mast", "installed_mast", "assembled", "cradle_test", "joint_test", "card_test",
    "mast_left", "mast_right", "mast_joint_test_left", "mast_joint_test_right", "full_socket_test",
    "saddle_test_left", "saddle_test_right", "mini_pocket_tests", "shared_cable_test",
    "reference_mini", "reference_cards", "reference_headphones", "reference_cables",
    "reference_fasteners",
)
OUTPUT.mkdir(parents=True, exist_ok=True)
manifest = {
    "status": "Concept geometry; physical fit and printing unverified",
    "source": str(SOURCE.relative_to(ROOT)),
    "source_sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
    "units": "mm",
    "layout": args.layout,
    "exports": [],
}
for part in PARTS:
    path = OUTPUT / f"{part}.stl"
    path.unlink(missing_ok=True)
    command = [OPENSCAD, "--hardwarnings", "--backend", "Manifold",
               "--export-format", "binstl", "-o", str(path),
               "-D", f'part="{part}"', "-D", f'layout="{args.layout}"',
               "-D", "show_references=false", str(SOURCE)]
    result = subprocess.run(command, capture_output=True, text=True, check=False)
    (OUTPUT / f"{part}.log").write_text(result.stdout + result.stderr)
    if result.returncode != 0:
        raise SystemExit(f"Export failed for {part}:\n{result.stderr}")
    manifest["exports"].append({
        "part": part, "file": path.name,
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
    })
    print(f"Exported {part}", flush=True)

for probe in ("interference", "device_interference", "reference_interference",
              "mast_hardware_interference", "mast_halves_interference",
              "saddle_removal_interference"):
    path = OUTPUT / f"{probe}.stl"
    path.unlink(missing_ok=True)
    command = [OPENSCAD, "--hardwarnings", "--backend", "Manifold",
               "--export-format", "binstl", "-o", str(path),
               "-D", f'part="{probe}"', "-D", f'layout="{args.layout}"', str(SOURCE)]
    result = subprocess.run(command, capture_output=True, text=True, check=False)
    output = result.stdout + result.stderr
    (OUTPUT / f"{probe}.log").write_text(output)
    expected_empty = result.returncode == 1 and "Current top level object is empty" in output
    if result.returncode != 0 and not expected_empty:
        raise SystemExit(f"Unexpected probe failure: {probe}\n{output}")
    manifest[probe] = {"empty": expected_empty, "exit_code": result.returncode}
    print(f"Probed {probe}: {'empty' if expected_empty else 'inspect contact geometry'}", flush=True)

if hashlib.sha256(SOURCE.read_bytes()).hexdigest() != manifest["source_sha256"]:
    raise SystemExit("Source changed during export; rebuild required")
(OUTPUT / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
print("Build complete", manifest["source_sha256"], flush=True)
