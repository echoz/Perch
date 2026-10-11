# Yoto charging station

An adjustable tabletop concept for a jacketed Yoto Mini, about 20 loose cards,
and kids' JBL headphones. The jacketed Mini's seated width and depth are now
measured; other hardware dimensions remain assumptions. This is not a verified
complete fit or a sliced print profile.

![Current charging station concept](previews/concept-review.png)

The first reported base print fits the cards well, but the player pocket was too
loose in width and depth. The measured jacketed section is 75.08 × 44.91 mm.
The user selected **W0.1**: the full base now has a **75.28 × 45.51 mm** Mini
opening with a **6.3 mm inside corner radius**. Width clearance is 0.1 mm per
side; depth remains 0.3 mm per side, following the earlier sample's feedback.
The card cavity, external footprint and aligned organic shoulders are preserved.
The [width samples](https://github.com/echoz/Yoto/releases/download/w01-candidate/yoto-mini-width-tests.zip) remain available as a
record of the selection. Full-height removal and connected cables still need
checking on the finished print.

The side-layout base now has one shared rear-entry underside trough feeding a
rounded opening right of the mast socket, viewed from the front. Both USB-C plugs
are right-angle and unmeasured. `shared_cable_test.stl` reproduces the provisional 24 × 18 mm opening,
12 mm wide trough and bridge so the actual cables can be checked together.
The card and player shoulders also join with one continuous rounded slope; the
former narrow groove is filled. The card cavity retains its accepted dimensions.
The sculpted body continues behind the holders, around the mast socket and out
to every perimeter edge. The underside remains flat; the charging passage is
kept clear within the rear curves.

The [original fit-test ZIP](https://github.com/echoz/Yoto/releases/download/w01-candidate/yoto-fit-tests.zip) contains the earlier Mini
pocket trials and the shared cable-passage sample. The
[complete concept ZIP](https://github.com/echoz/Yoto/releases/download/w01-candidate/yoto-concept-print-parts.zip) contains the selected
W0.1 cavity. It remains a candidate pending a full print and the remaining cable,
mast and headphone checks.

The current design, parameters, fit coupons, and assembly limitations are described
in [the CAD guide](cad/README.md). Edit [the OpenSCAD source](cad/compact_dock.scad),
then regenerate the meshes; the Blender file is a review scene derived from that
source. The default side layout is the current candidate. The rear layout is a
comparison.

## Version control and print downloads

Git tracks the editable CAD, build/review scripts, fit decisions, compact JSON
evidence records and the documentation figures. STL meshes, print ZIPs, Blender
scenes and their backups, other renders, logs, slicer jobs and local environments
are ignored. Existing ignored files remain on disk.

The [W0.1 candidate release](https://github.com/echoz/Yoto/releases/tag/w01-candidate)
preserves the three checked print ZIPs separately from Git history. It is marked
as a prerelease because the revised full station still needs physical checks.
Only the base changes from the preceding print candidate; the mast halves are
unchanged. Do not overwrite a published candidate: attach future print packages
to a new tag after their source and mesh hashes have been checked.

JSON manifests and audit reports are retained evidence for their recorded source
and mesh hashes, including explicitly historical revisions. Rebuilding does not
recreate independent reviews or establish physical fit. The scripts below export
meshes and render previews; the original ZIP packaging, width-preview rendering
and bespoke audit steps are not yet a complete automated release pipeline.

## Rebuild and inspect

These commands use the installed OpenSCAD and Blender applications on this Mac.
Run from the project root. Application execution may require the host's normal
approval because these applications do not initialize inside the restricted shell.

```sh
python3 scripts/build_concept.py
/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python scripts/inspect_meshes.py -- exports/concept
/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python scripts/render_preview.py -- .
```

For the comparison, export with `--layout rear --output exports/rear-comparison`,
inspect that directory, and render with `--exports exports/rear-comparison
--previews previews/rear-comparison` after the root argument. The image composition
script uses Python with Pillow installed: `python3 scripts/compose_preview.py`.

For the selected width sample, export the supplementary entrypoint separately:

```sh
mkdir -p exports/mini-width-tests
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD --hardwarnings --backend Manifold --export-format binstl -D 'part="mini_width_0_1"' -o exports/mini-width-tests/mini_width_0_1.stl cad/mini_width_tests.scad
```

Use `mini_width_0_2` for the alternative or `mini_width_tests` for both. Preserve
100% scale. These commands reflect the tested local Mac setup; OpenSCAD must
support the Manifold backend, Blender supplies its Python modules, and Pillow is
needed only for the composed overview. Other platforms are not verified.

`exports/concept/manifest.json` records the source and mesh hashes.
`exports/concept/mesh-checks.json` records raw STL degeneracy, mesh topology,
dimensions, and simplified collision-probe results. These digital checks do not
prove physical fit, access during movement, print strength, or loaded stability.

The current fit integration is checked in `selected-mini-fit-checks.json` and
`independent-mini-fit-review.json`. The earlier full-perimeter sculpt is checked
in `full-sculpt-checks.json` and independently
reviewed in `independent-full-sculpt-review.json`. Earlier cable-route and holder-join
reviews remain in the repository and package as historical evidence, with their revision scope
identified. `fit-test-sections.json` records the small samples' measured mesh
dimensions; `holder-join-sections.json` retains the original join profiles.

`exports/concept/fit-clearance-checks.json` records the independent full-pocket
and full-height keyed-opening intersection checks and their exact source/mesh hashes. These checks use a
0.01 mm numerical inset; they validate the CAD cavities, not the real devices.

The station prints as `base.stl`, `mast_left.stl` and `mast_right.stl`. Both mast
halves are already oriented flat and join with three M3×20 socket-cap screws and
three M3 full hex nuts. The ZIP includes the small split-joint and full-depth
socket tests, plus a short saddle pair for checking the rounded retaining lips
with your real headphones. Print those tests first. Do not print `mast.stl`, the assembled mesh or
any reference-device/hardware meshes for this split build.

The CAD guide describes the assembly, optional silicone seam treatment and
remaining physical checks. No slicer profile or verified load rating is supplied.
