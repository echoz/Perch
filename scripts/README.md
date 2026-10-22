# Perch authoring workflow

These project-specific commands export the [Perch CAD source](../cad/README.md),
inspect those exports, render review views and compose the overview image. They
share Perch's part names, manifests and output directories; they are one authoring
workflow, not independently supported general-purpose mesh tools.

## Requirements and commands

Run from the repository root. The current setup uses Python 3, OpenSCAD at
`/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD` with the Manifold backend,
and Blender at `/Applications/Blender.app/Contents/MacOS/Blender`. The compositor
also needs Pillow and the macOS Arial font at the path recorded in its source.
Other platforms have not been verified. Installation is a separate action.

```sh
python3 scripts/build_concept.py
/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python scripts/inspect_meshes.py -- exports/concept
/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python scripts/render_preview.py -- .
python3 scripts/compose_preview.py
```

| Entry point | Inputs, outputs and behavior |
| --- | --- |
| [build_concept.py](build_concept.py) | Reads `cad/compact_dock.scad`; replaces named STL/log outputs and writes a hash manifest in `exports/concept`. Supports `--layout side` or `rear` and `--output`. Stops on export errors or changed source. |
| [inspect_meshes.py](inspect_meshes.py) | Runs inside Blender. Checks the directory's manifest/source hashes, imports its STL files and writes `mesh-checks.json`. Rejects the topology, interference and selected flat-part failures defined in its source. |
| [render_preview.py](render_preview.py) | Runs inside Blender. Reads the supplied root's export set and writes PNGs plus a derived `.blend` scene. Accepts `--exports` and `--previews` after the root argument. |
| [compose_preview.py](compose_preview.py) | Reads default `exports/concept/mesh-checks.json` and default preview images; overwrites `previews/concept-review.png`. It has no alternate-directory arguments. |
| [check_documentation.sh](check_documentation.sh) | Read-only documentation gate described below; it does not export or inspect geometry. |

The first four commands write outputs, including some tracked evidence and
curated figures. Use a separate worktree or output directory when preserving an
earlier candidate. The compositor remains tied to the default directories. The
width samples use separate OpenSCAD invocations in the [CAD guide](../cad/README.md);
the main export command does not build them.

## Documentation verification

```sh
sh scripts/check_documentation.sh
```

The wrapper pins EngineeringRules **v0.1.10**, commit
`756987b0d0e4bf8245abe05611f43aab8ffc700e`, and verifies the checker and dependency
manifest hashes before invoking its isolated Python environment. By default it
uses `~/.local/share/engineering-rules/0.1.10`. `PERCH_DOCUMENTATION_TOOLS` may select
another checkout of that exact release with its prepared `.build/docs-venv`.
The wrapper takes no arguments and always checks this repository's
[schema 2 inventory](../.documentation-rules.json). Missing or mismatched tools
fail; normal checking never installs, downloads or upgrades anything.

Version 0.1.10 leaves the documentation checker and review skill unchanged. Its
SwiftPM release-build changes do not apply to this non-Swift project.

Prepare the source checkout and hash-pinned Python environment separately using
the [release's documentation setup](https://github.com/echoz/EngineeringRules/blob/v0.1.10/README.md#documentation-gate).
The checker requires the exact parser versions from that release. Its scope is
declared source-root README presence and local Markdown destinations, not HTML,
remote URLs, heading anchors, inventory completeness or prose accuracy. Use the
shared engineering-review workflow for those semantic judgments. Install that
skill separately from the same release and record its revision and file hashes;
the documentation wrapper does not install or verify the skill.

## Manual naming review

Perch's OpenSCAD, Python, shell and HTML/CSS sources are outside SwiftRules'
`review-candidates` collector. Apply the released engineering-review skill to
every introduced or changed declaration and to unchanged names whose meaning
changes. Follow the owning global guidance when assessing identity and revision
subjects and lifetimes. Keep the scope, findings, meaningful retentions and gaps
with the exact candidate's independent review evidence. A text search only
supplements this semantic pass.

The existing Blender references use its framework-defined `bpy.context` API:

| Name/use | Owning source | Judgment |
| --- | --- | --- |
| `bpy.context.selected_objects` | [inspect_meshes.py](inspect_meshes.py) | Retain: Blender's selected-object collection supplies the imported meshes to inspect. |
| `bpy.context.scene` | [render_preview.py](render_preview.py) | Retain: Blender's active scene owns the render configuration. |
| `bpy.context.object` | [render_preview.py](render_preview.py) | Retain both uses: Blender supplies the active imported mesh or newly created ground object. |
| `bpy.context.view_layer.update()` | [render_preview.py](render_preview.py) | Retain all three uses: Blender updates evaluated scene state before subsequent geometry/bounds operations. |

These framework meanings do not waive review of future names or constitute a
full semantic audit of every identifier. The collector cannot provide automated
evidence for these languages. Unchanged declarations outside the candidate,
generated meshes/scenes, historical evidence, binary assets and third-party
implementations are outside the source naming review. Public identities, selector
strings and persisted output formats remain unchanged.

## Evidence limits

Inspect command diagnostics and the resulting manifest/report, not just the exit
code. Blender's geometry checks do not prove support-free slicing, dimensional
accuracy, physical grip, strength, cable access or loaded stability. Rendering is
illustrative. Rebuilding does not recreate the bespoke or independent historical
audits. Preserve their original hashes and [physical validation status](../cad/README.md).
There is no automatic ZIP/release pipeline. Published packages remain immutable.

Python helpers are outside the design's CC license grant; see
[license scope](../LICENSE-SCOPE.md).
