# Perch CAD and assembly guide

`compact_dock.scad` is the authoritative parameter source, in millimetres. This is
an editable concept, **not a verified fit or production-ready print**. No external
model or STL was remixed. The current `layout="side"` places one card container
on the **left**, the jacketed Mini on the **right**, and headphones behind,
centered on the base when viewed from the front. The outer pocket shoulders
align; the selected Mini opening is inset inside its preserved outer shape.
`layout="rear"` retains the earlier comparison.

The original Perch design source and resulting meshes are licensed under
**CC BY-NC-SA 4.0** for noncommercial printing and remixing, with attribution and
the required ShareAlike terms when shared. See the [license scope and attribution
notice](../LICENSE-SCOPE.md) and [full license](../LICENSE.txt). Include both files
in future print packages; the existing candidate ZIPs retain their original bytes
and have accompanying license files in the release.

## Physical fit feedback — 2026-10-07

The user supplied a photograph of a printed base with cards and a jacketed Mini.
They report that the **card holder fits well**, while the **Mini pocket is too
wide and also loose front-to-back**. At that point the gaps and jacketed dimensions
were unmeasured. The printed revision and slicer scale have not been confirmed;
the source cavity at that stage was 83.6 × 49.6 mm. Do not derive a millimetre
correction from the perspective photograph. The selected correction is below.

Preserve the successful card fit during the next revision. Width and depth need
independent correction, followed by a shallow complete Mini-pocket test including
the corners; the existing width-only cradle gauges cannot verify depth. The
subsequent selection and full-base integration are recorded below.

The user clarified that this is **not a taper**: the side edges form a rounded
rectangle and the jacket follows those curves. This supersedes the earlier taper
interpretation. The exact edge profile and radii remain unmeasured. The original
cavity's 6.8 mm plan-view corner radius is an assumption, not a verified match
to those curves. Establish jacketed width, depth and the local rounded profile
before revising the fit; do not introduce a taper based on the earlier description.
Yoto's [earlier Mini specifications](https://eu.yotoplay.com/fr/lp/travel-music)
give a nominal 70 × 70 × 40 mm overall player size, not a jacketed bottom profile.
The [2024 Adventure Jacket listing](https://us.yotoplay.com/products/mini-adventure-jacket)
does not provide a dimensioned bottom profile. A bounded search of creator models
found no verified jacketed reference CAD. These findings do not
replace measurements of this player's jacket or establish its edition.

## Measured Mini pocket tests — 2026-10-10

The user measured the jacketed section that sits in the pocket as **75.08 mm
wide × 44.91 mm deep**. The original 83.6 × 49.6 mm opening had nominal
total spare space of 8.52 mm across and 4.69 mm front-to-back, before allowing for
printed dimensional error or rounded edges. The original 82 × 48 mm device
assumption is superseded by this measurement for local fit. Only the historical
rear comparison and legacy gauges retain the original body assumptions.

`mini_pocket_tests` contains three separate complete pockets. Unlike the legacy
width-only gauges, these test both axes and the provisional rounded corners.

| Label: clearance per side | Inside width × depth | Provisional inside radius |
| --- | --- | --- |
| 0.3 | 75.68 × 45.51 mm | 6.3 mm |
| 0.5 | 76.08 × 45.91 mm | 6.5 mm |
| 0.7 | 76.48 × 46.31 mm | 6.7 mm |

Each has a 2 mm floor, 8 mm walls above the floor and 2.4 mm wall thickness.
The three-part layout occupies 81.28 × 205.13 × 10 mm. The assumed 6 mm body
corner radius is still unmeasured; there is no modeled taper. Labels are on
external tabs. Print flat at 100% scale in the intended PLA profile. Start with
the 0.7 pocket and work down, selecting easy removal with little unwanted play
without squeezing the jacket. Report the label and whether any remaining
restriction is at the corners, width or depth. These shallow tests do not prove
full-height sculpted-rim removal or actual jacket edge curvature.

The user has now tried the **0.3 mm sample** and reports that its fit is nice,
but the width still needs a small adjustment. They reiterated the 75.08 mm
width measurement. The label adds 0.3 mm at each side in both axes, giving a
nominal 75.68 × 45.51 mm cavity. They clarified that the width is slightly loose,
estimating perhaps 0.5 mm of sideways play, with uncertainty. Treat that as an
approximate observation, not a verified amount to subtract or a new clearance
setting. Retain the tested depth while narrowing only the width in the next
samples, leading to the W0.1 selection below.

### Width refinement after the 0.3 sample

The next complete-pocket samples hold depth at **45.51 mm** and inside corner
radius at **6.3 mm**, while reducing only the width. They retain the 2 mm floor,
8 mm walls above it and 2.4 mm wall thickness. The same provisional corner
radius isolates the width change; it does not establish the real jacket radius.

| Label | Inside width × depth | Width clearance per side | Narrower than the old 0.3 sample |
| --- | --- | --- | --- |
| W0.2 | 75.48 × 45.51 mm | 0.2 mm | 0.2 mm overall |
| W0.1 | 75.28 × 45.51 mm | 0.1 mm | 0.4 mm overall |

The user selected **W0.1** on 2026-10-11. The full base now uses its exact
**75.28 × 45.51 mm opening and R6.3 corners**. Only the width allowance drops
to 0.1 mm per side; depth stays at 0.3 mm per side. These are CAD allowances,
not claims of printer accuracy. The earlier explicit physical feedback applies
to the 0.3 sample; the W0.1 message records the user's selection.

The separate `mini_width_tests.scad` entrypoint and its individual or combined
STLs remain in [the width-test ZIP](https://github.com/echoz/Perch/releases/download/w01-candidate/yoto-mini-width-tests.zip).
Reprinting them is optional unless the material, profile or scale changes.
The combined pair occupies 80.28 × 133.42 × 10 mm; each separate sample occupies
80.28/80.08 × 63.71 × 10 mm including its label tab. These are geometry bounds,
not sliced print-time or material estimates. See [the labeled pair](../previews/mini-width-tests.png).

For a focused rebuild, export `mini_width_tests.scad` with
`-D 'part="mini_width_0_2"'`, `-D 'part="mini_width_0_1"'`, or its default
`part="mini_width_tests"` for both. `exports/mini-width-tests/manifest.json`
records both source hashes. Mesh and sampled-section checks in that directory
verify the intended dimensions, corners and flat orientation; physical fit
remains separate from digital evidence.

### Selected fit integrated — 2026-10-11

The Mini cut is centered at `[32.2,30.8]`, with its floor at Z=8. Width and depth
clearances are independent. The successful card cavity stays **55.4 × 49.6 mm,
R0.8**, centered at `[-46.3,30.8]`. Both outer shoulder envelopes and the full
**160 × 121.8 mm footprint** stay fixed. The Mini opening is inset by 4.16 mm
on each lateral side and 2.045 mm front/back relative to the former opening;
this fills the excess space while preserving the organic exterior, joined
holders, socket mound and aligned outer fronts and backs.

The measured Mini proxy and its attached right-side charging reference now
follow the narrower body. Height, body edge profile and real connector position
remain provisional. `selected-mini-fit-checks.json` records the current exports,
complete cavity/passage probes and exact unchanged-part comparisons;
`independent-mini-fit-review.json` records the separate review. The selected
sample's dimensions do not alone prove removal over the full sculpted rim or
access with both actual right-angle cables connected.

## Current geometry

The current base is one softly sculpted solid with both precise cavities cut
**after** exterior blending. Broad shoulders merge the pockets, shared ridge,
base and mast socket. The raised surface continues through the rear of the base
to every outer edge, with a flat printing underside. This is actual exported
geometry, not a shading effect.

| Illustrative default | Sculpted side design | Rear comparison |
| --- | --- | --- |
| Printed base width × depth | 160 × 121.8 mm | 93 × 93.4 mm |
| Loaded reference envelope | 167.74 × 139.8 × 206 mm | 150 × 118 × 206 mm |
| Card cavity width × depth | 55.4 × 49.6 mm | 87 × 18 mm |
| Mini cavity width × depth | 75.28 × 45.51 mm | 83.6 × 49.6 mm |
| Card orientation | Portrait, facing forward | Landscape |
| Card crest targets above floor | 32 mm front / 65 mm back | 32 mm |
| Mini crest targets above floor | 8 mm front / 18 mm back | Separate shallow guards |
| Mast installation translation | `[0,71,8.6]` | `[0,82.05,8.6]` |
| Headband seat center | `[0,101.8,196]` | `[0,80,196]` |

Compared with the preceding thin-wall design, the sculpted base adds **10.6 mm
width and 6 mm depth**. Some base growth occupies space already needed by the
headphones and cable. The preceding full sculpt enclosed **286.595 cm³**.
Filling the excess Mini opening brings this to **294.459 cm³**, an increase of
**7.864 cm³ / 2.744%**, while retaining the 160 × 121.8 mm footprint. These are
solid CAD volumes, not filament consumption or cost. Updating the measured-body
charging reference reduces modeled loaded width from 171.2 to 167.74 mm;
actual plug projection and
cable slack remain unmeasured, so this does not establish the real loaded size.
Use the actual slicer profile for material and print-time estimates.

The mast, socket, saddle and headphone reference share the base centerline X=0,
independent of the Mini position. Centering them does not change the current
loaded envelope, which is bounded in X by the base and Mini cable reference.

The wider footing does not establish a lower center of mass or a tipping
threshold. The nominal headphone centerline has 20 mm of base behind it. Actual
combined mass, cable loads and child interaction remain unmeasured. Portrait
cards also have a higher center than landscape cards.

## Sculpted shape and preserved fit

Both pockets have complete usable XY cavities. The card cavity keeps 0.8 mm
rounded corners; the selected Mini cavity has **6.3 mm inside corner radius**,
copied from W0.1 independently of its width allowance. Exterior shaping does not
shrink these cavities. Their floor is Z=8, with a flat underside at Z=0.

The side design retains **6 mm local pocket blend bands** and a **9 mm shared
ridge** between the original shaping boundaries. The gap between the straight
cavity sides is now 13.16 mm. The card cavity extends from Y=6 to Y=55.6;
the Mini opening extends from Y=8.045 to Y=53.555. The original pocket bands
span Y=0..61.6; the added rear landscape and
socket connection continue beyond them to Y=121.8. The old 3 mm uniform-wall
assumption does not describe this solid: shoulder and ridge thicknesses vary.

The card and Mini heights in the table are **outer crest targets**. A 2 mm eased
rise leads outward from each opening edge to its crest, then the shoulder curves
down into the base. Opening edges are nominally 2 mm below those targets: about
30/63 mm for cards and 6/16 mm for the Mini, above the pocket floor. Edge pillowing
and intersections between raised regions modify the local heights. The actual
highest base mesh point is approximately Z=73. The exterior is sampled on a
0.3 mm grid; the final cavity cuts remain exact polygonal CAD boundaries.
The exterior shoulders are rounded, but the vertical cavity cuts leave crisp
inner opening edges. These are not fully rolled lip fillets; inspect their feel
on a test print before accepting the final surface finish.

The shared surface blends overlapping raised regions. A broad rounded mound now
encloses the socket housing, leaving only a nominal 0.48 mm exposed bearing rim.
The exterior mound blends over a 26 mm band, merging into a low rolling rear
surface and the pillowed perimeter. The socket cavity and mating peg have not
been rounded or resized; the collar still seats at Z=41.98. The base perimeter
has an 8 mm XY corner radius and approaches a nominal 2 mm edge height.

Card exposure varies with the rim and the loose cards' positions. At the front,
the 85.6 mm cards extend roughly 54–56 mm above the crest/opening edge; at the
back that falls to roughly 21–23 mm. There is no single exposure height for the
whole bin. The illustrated 20-card stack is placed near the front, independently
of the larger bin depth.

### Seamless holder join — 2026-10-10

The user requested removal of the remaining visible gap between the holders.
Although they were already connected at the base, their separate shoulders left
a deep narrow valley. A local rounded bridge now fills that valley, descending
continuously from the taller card shoulder into the lower Mini rim. The join
follows both rounded corner outlines and fades into the existing front and back
shoulders within Y=0..61.6, leaving the shared cable opening clear.

At that revision this added actual material, without changing either cavity, mast connection,
cable passage or fit samples. The 160 × 121.8 mm footprint is unchanged; solid
CAD volume increased by about **3.90 cm³ / 1.85%** relative to the shared-route
base before the join. Mesh sections at the front, middle and rear of the shared
wall descend across the former valley. Exact cavity cuts still happen after
exterior shaping; physical fit and the printed surface finish remain unverified.

### Full perimeter and connected socket mound — 2026-10-11

The rear surface now curves from the holder backs around the insertion mound and
out to both side edges and the rear edge. An additional rounded fore–aft bridge
fills the low crease between both holders and the mound, so the connection is
raised and visible rather than only shared at the bottom plate. It starts at
the pocket rear crests and meets the mound before the collar's seating area.
Its lateral edges ease out inside the headphone gap and before the cable well.

The precise pocket cuts happen after the exterior shaping. The right cable hole
retains a recessed 8 mm deck; the underside trough keeps its 12 × 4.6 mm section,
and its rear relief opens through the full height of the raised surface. The
flat underside, centered mast key and collar seating plane are preserved.
See the [rear view](../previews/base-rear.png) and
[connections from above](../previews/base-cable-route.png).

`full-sculpt-checks.json` records the preceding sculpt mesh, dimensions, sampled connection
profiles and preserved sample hashes. `independent-full-sculpt-review.json`
records that revision's separate geometry review. Current complete pocket, key-opening,
cable-opening and underside-route masks supplement the six assembly probes.
These checks establish the exported geometry only; actual fit, cable bending,
print finish, filament use, strength and loaded stability still require testing.

## Parameters and unverified hardware

The current side-layout Mini reference uses **75.08 × 44.91 mm** measured local
width/depth; its **78 mm height and R6 body corners remain assumptions**. The
opening has independent **0.1 mm width / 0.3 mm depth clearance per side** and
an explicit **R6.3** radius matching W0.1. The preserved outer shoulder envelope
is **83.6 × 49.6 mm, R6.8**, independent of the functional opening. Only the
historical rear comparison and legacy gauges use the former 82 × 48 mm body.
Silicone compression is not part of the fit strategy.

Cards use 85.6 × 54 mm edges and an assumed **16 mm total stack** of about 20 cards.
`card_width_allowance_total` is **1.4 mm total** along the horizontal card face.
The side bin independently retains its accepted 49.6 mm depth. Stack thickness and
`card_stack_allowance_total` remain separate; the latter is **2 mm total** in the
rear comparison. The stack's front offset is an explicit illustrative pose,
`side_card_stack_front_offset=1`, not a fitted divider. Measure real card warping
and handling room. The unchanged card coupons test stack fit, not the full bin.

The headphone hypothesis is 150 mm wide, 76 mm deep and 180 mm high, with a
104 mm inner gap and 89 mm cup height. The cup height is a published JBL reference
supplied during design; all hardware, hanging pose, adjustment and headband contact
must still be confirmed. The reference arc and straight extensions are simplified.

The central headband seat remains **Z=196 mm**, derived from the assumed headset
height, connector and floor allowance. Rounded retaining lips reach **Z=199.5**.
The mast body is **190.9 mm** long from its relieved peg tip to the highest lip
and installs at Z=8.6. Cup bottoms sit at Z=26. Both mast halves print flat,
**26 mm** high. These values do not prove cable bend radius or
removal clearance. The rear sculpt extends beneath the headphone envelope;
its height there is checked against the assumed Z=26 cup bottoms. The former
2.2 mm plan-view gap behind the local card shoulder is no longer a clearance
description for the complete curved body.
The mast socket starts at **0.35 mm per side** clearance and uses a directional,
gravity-seated key. The mast-to-base socket has no latch or fastener; the two
mast halves are clamped together with three recessed screws and nuts.

## Shared charging route — updated 2026-10-11

The user requested one rear-entry underside trough feeding a rounded through-hole
**right of the headphone-mast socket**, with two USB-C leads emerging there. This
supersedes the initial left-side location at the user's request on 2026-10-11. Both
actual device plugs are right-angle; their molded body dimensions and orientation
are not yet measured. This side-layout revision replaces both old underside lanes
and the old headphone opening at the rear. The rear comparison retains its prior
routing for historical comparison.

The provisional passage throat is **24 × 18 mm, R4**, centered at **X=39, Y=75**.
Its unrounded throat bounds are X=27..51 and Y=66..84. Each mouth expands outward
by 1 mm with a rounded edge. A small recessed deck preserves the original 8 mm
passage height while the surrounding surface rises smoothly into the socket mound
and rear landscape. The old shoulder-to-hole gap figures do not describe this
continuous surface. The opening preserves the card and Mini cavities and the
mast socket. It is not a connector clamp or a fitted elbow pocket.

One **12 mm wide × 4.6 mm deep** underside trough joins this hole to the rear edge.
Its minimum nominal interior roof is 3.4 mm thick, increasing where the sculpt
rises above the original deck. The rear roof terminates with a full-height
relief beginning 6 mm before the back edge, avoiding a thin feathered roof at the
pillowed perimeter. Two reference Ø4 mm cords lie side by side at Z=2.3, leaving
0.3 mm above the bed plane and below the nominal channel roof. Real cord diameters,
printed bridge sag and table clearance still need checking.

The bridge span is now 12 mm instead of the old 6 mm lanes. `shared_cable_test`
is **40 × 57 × 8 mm** and reproduces the local deck, passage, trough intersection
and minimum bridge roof. Its open rear relief has the same width and length;
it does not reproduce the thicker raised landscape or surrounding access slopes.
The full-base relief cuts through the entire new surface. Print
it flat with the intended base settings. Pass each real right-angle plug through
while the other cable is already threaded, then check that both cords sit in the
trough and the sample sits flat. A plug's entire elbow and its turning movement
must fit; the metal USB-C tip alone is not a sufficient measurement. The 24 × 18 mm
opening is a starting trial, not a verified plug fit.

The reference leads share the underside route and separate above the opening.
The Mini lead travels toward the right-hand port; the headphone lead crosses
behind the mast socket at Y=90 toward its assumed left-earcup connector. The
headphone and Mini cords use underside centers X=36 and X=42, respectively,
before separating above the opening. The elbow
shapes, waypoints and bends are illustrative routing hypotheses. Above the hole,
the reference cords rise over the new surface with clearance for their full
modeled radius, then descend toward their connectors. Actual plug
projection, bend radius and cable slack remain unmeasured. Both devices still
connect manually using independent leads; there is no blind electrical dock.

The user confirmed the Mini socket is on the right when facing its screen. Its
height and fore/aft position remain assumptions. Check charging access with the
measured player in the selected pocket before another full-base print.

## Outputs and coordinates

Select `layout` and `part` in OpenSCAD, or override them on the command line:

```sh
openscad -o base.stl -D 'layout="side"' -D 'part="base"' compact_dock.scad
```

| `part` | Output |
| --- | --- |
| `assembled` | Base and installed mast, no reference devices by default |
| `base` | Base in print coordinates, bottom Z=0 |
| `mast_left` / `mast_right` | Current mast halves, mating faces on bed Z=0 |
| `mast` | Complete upright mast for inspection; do not print for the split build |
| `installed_mast` | Mast alone in assembly coordinates |
| `mini_pocket_tests` | Three complete shallow pockets for the measured 75.08 × 44.91 mm jacketed section |
| `shared_cable_test` | Small shared-passage and underside-trough sample for both right-angle plugs |
| `cradle_test` | Legacy width-only gauges for the superseded 82 mm width assumption |
| `mast_joint_test_left` / `mast_joint_test_right` | Short matching halves with the actual split peg, collar and lower screw |
| `full_socket_test` | Three full-depth socket gauges, 0.2/0.35/0.5 mm per-side trials |
| `saddle_test_left` / `saddle_test_right` | Short matching saddle halves with the actual upper screw; flat print orientation |
| `joint_test` | Legacy short socket gauges and solid peg; superseded for the split build |
| `card_test` | Three stack gauges, not the full storage-bin depth |
| `reference_mini` / `reference_cards` / `reference_headphones` | Simplified device envelopes |
| `reference_cables` | Both modeled connector/lead envelopes |
| `reference_fasteners` | Three nominal purchased screws/nuts in assembly coordinates; never print |
| `reference_mini_cable` / `reference_headphone_cable` | One lead envelope |
| `interference` | Base ∩ installed mast; expected empty |
| `device_interference` | Structure ∩ devices/leads; no positive volume expected |
| `reference_interference` | Pairwise reference collisions; expected empty |
| `mast_hardware_interference` | Mast material ∩ nominal hardware; only bearing contact expected |
| `mast_halves_interference` | Left ∩ right in assembled pose; only the X=0 mating plane expected |
| `saddle_removal_interference` | Mast ∩ continuous upward nominal headband sweep; expected empty |
| `info` | Echo derived dimensions, joint stack and transforms |

X runs left/right, Y toward the back, Z upward. The base spans X=−80..80 and
Y=0..121.8. At the current side defaults:

- Mini center: X=32.2, Y=30.8, bottom Z=8; cavity X=−9.6..74, Y=6..55.6.
- Card cavity: X=−74..−18.6, Y=6..55.6, centered X=−46.3, Y=30.8.
- Card-stack reference: center X=−46.3, Y=15; bottom Z=8, top Z=93.6.
- Headphone bounds: X=−75..75, Y=63.8..139.8, Z=26..206; cups end at Z=115.
- Mini elbow body reference: X=73.2..91.2, Y=32.8..42.8, Z=25..38.5;
  its cable descends outside the base near X=87.2. These are unmeasured placeholders.
- Shared cable opening: center X=39, Y=75; mouth X=26..52, Y=65..85.

All reference outputs and `installed_mast` already use assembly coordinates.
`show_references=true` provides background preview ghosts. Re-query `info` and
regenerate outputs after parameter changes. Loaded bounds include every modeled
connector and lead, but exclude real cable slack, earcup yaw, hands and motion.

## Coupon-first build and verification

The printer is a Bambu Lab X1C with stock 0.4 mm nozzle, using PLA. Plate variant,
PLA product and profile remain unknown. Use the intended material, plate, layer
height, cooling and orientation for coupons and full parts. Never slice the
assembled or device-reference files as station print parts.

1. Measure the jacketed Mini, real corner profile, controls and charging port.
   Confirm the headphone model, hanging envelope and connected plugs/cables.
2. W0.1 is selected and integrated into the full base. Its opening is
   75.28 × 45.51 mm, R6.3. Preserve the intended PLA profile and 100% scale;
   scaling would change both selected axes and the successful card fit.
   Original Mini trials remain available for a new fit investigation. The
   legacy `cradle_test` uses the old assumed width and cannot validate this fit.
   Also print `shared_cable_test` and check both real right-angle plugs and cords
   together; its passage size and the actual cable bends are still provisional.
3. The full card cavity already has accepted physical-fit feedback and is unchanged.
   `card_test` remains optional for a changed stack. Labels 0.4/0.7/1.0 are **total**
   stack-depth trials. Their open end cannot
   verify card-face width; use a closed-width gauge or a shallow complete pocket
   for that. They do not reproduce the larger side bin's storage volume or access.
4. Print `mast_joint_test_left`, `mast_joint_test_right` and `full_socket_test`.
   Assemble the two short halves with one M3×20 screw and M3 nut, checking dry
   mating-face contact, pocket fit, nut capture and driver access. Socket labels
   0.2/0.35/0.5 are **per-side** trials. Check full peg insertion, collar seating,
   removal and play. This verifies the local fit only, not full-mast stiffness.
   The legacy `joint_test` does not reproduce the current split joint.
   Also print `saddle_test_left` and `saddle_test_right`; join them with one of the
   same M3×20 screws and M3 nuts. Check the real headband width, curved seating,
   feel of the lips and easy upward removal before printing the whole mast. This
   held test piece does not establish full-station resistance to bumps or tipping.
5. Slice `base`, `mast_left` and `mast_right` separately. Keep the supplied flat
   mating faces of both mast halves on the bed. Inspect the base cable bridges
   and thin edges, and the halves' first layers, bores, pocket rims and saddle tips.
   Digital overhang checks are not slicer or physical-print certification.
6. Dry-assemble with both leads connected. Test controls, playing-card insertion,
   card extraction and the full Mini lift/removal sweep. The front opening edge
   is roughly 6 mm above the floor, followed by the higher rounded crest; the exact
   required lift depends on the measured jacket. Check cable pinches, retention,
   strength, touched edges and loaded stability. Do not lift by the removable mast.

Six probes cover assembly joints, structure/reference overlaps, reference
pairs, mast hardware, the split mating plane and headband removal. Pairwise checks omit each lead's intentional connection to its own device;
they still check cross-device cable collisions. Full-cavity clearance must also
be evaluated independently of smaller device proxies. Exact floor contact may
export as zero-volume triangles at Z=8; distinguish it from real overlap.

No digital check proves real fit, print accuracy, actual cable bends, removal
access, strength, heat aging, tipping resistance or child-use suitability. Keep
those limits separate from manifold export and successful reference checks.

## Earlier one-piece mast audit — 2026-10-06

Audited the centered source with SHA256
`31e20730c96393e280170c304cd52623929afa9334433a5dcda79639447983f2`.
This historical audit describes the earlier complete mast. The subsequent split
mechanical design below resolves its seating ambiguity and changes the print
orientation. Other hardware-fit and physical-test limitations remain. The old
source hash is retained to distinguish these findings from current verification.
No slicer toolpath, printed coupon or load test was available for this audit.

| Interface | Current design allowance | What remains to establish |
| --- | --- | --- |
| Jacketed Mini | 0.8 mm per side; 83.6 × 49.6 mm cavity, R6.8 | Real jacket dimensions/corners; full-pocket insertion and removal |
| Cards | 1.4 mm total face-width allowance; 55.4 × 49.6 mm cavity | Actual cards and a gauge closed at both width ends |
| Mast key | 30 × 10 mm peg, 30.7 × 10.7 mm hole; 0.35 mm per side | Full 34 mm engagement, rocking, insertion and a deliberate axial seat |
| Cable lanes | 6 mm wide × 4.6 mm deep around an assumed 4 mm cable | Only 0.6 mm vertical headroom; actual cable diameter and printed bridge sag |

**Resolve the mast seating first.** The socket floor is Z=8 and its top is Z=41.98.
The 34 mm peg places the collar underside at Z=42. This leaves only 0.02 mm between
bottom seating and collar seating, a Boolean allowance rather than a deliberate
printing tolerance. Choose the intended seating surface and give the other stop
explicit relief. The hole mouth and peg tip also lack insertion lead-ins; the
existing bevel changes only the housing exterior. These are proposed corrections,
not implemented changes.

The mast's 0.7 mm total lateral play over 34 mm engagement gives a clearance-only
tilt scale of about 1.18 degrees, potentially several millimetres at the saddle.
Actual collar contact, friction and loading change this; it is not a measured
wobble result. The current 12 mm joint coupon checks the keyed XY shape, but does
not reproduce the full engagement or tall-mast rocking. Test a full-engagement
joint before choosing the final clearance. The Mini coupons likewise check width,
not the final cavity's depth, corners or removal over the crest.

**The design has small printing overhangs and bridges.** The collar underside is
horizontal at mast print Z=34 (assembly Z=42). It projects 2 mm beyond the peg on
straight sides and about 3.66 mm over the clipped key corner. The saddle flare
reaches approximately 46.4 degrees from the build vertical. Its ends taper thin:
at assembly X=28.5/Y=101.8 the vertical thickness is about 0.43 mm, falling to
0.13 mm at X=28.7. Inspect or revise these ends for the intended line width and
surface finish; nominal saddle width does not establish printable tip thickness.

The base has two 6 mm roof spans over the underside cable lanes, with 3.4 mm
interior roof thickness and about 3.124 mm before the right rear opening. The
merged left rear opening has no narrow leftover roof ledge. The rounded wall
crests also taper near their peaks; they are not uniform 3 mm walls. The socket's
straight upper wall reduces from 3 mm to 2.4 mm at its outer bevel.

Structurally, the mast is a cantilevered support retained at its socket. The shaft
leans about 13.6 degrees from vertical and the saddle center lies 30.8 mm behind
the socket center. This produces bending under load even though the front view
is centered. No load capacity, stiffness or tipping threshold is established.
Printing upright places the 188 mm mast on its 30 × 10 mm keyed footprint;
adhesion, layer orientation and the collar/saddle toolpaths require evaluation.

Before a full print: measure the jacket and connected cables; choose the mast
seating datum; test a shallow complete Mini pocket, a closed-width card gauge,
a full-engagement joint, and a representative cable bridge. Slice the base and
mast separately using the actual X1C/PLA profile. Inspect short-span bridge
direction, collar support, saddle tips, rim paths and bed adhesion. The nominal
clearances above are not claims of printer dimensional accuracy. General guidance
on calibration, geometry and print orientation is consistent with
[Prusa's design guidance](https://help.prusa3d.com/article/modeling-with-3d-printing-in-mind_164135).
The bed-facing peg also needs a check for first-layer expansion, described in
[Prusa's elephant-foot explanation](https://help.prusa3d.com/article/elephant-foot-compensation_114487);
those pages do not establish an X1C-specific compensation value.


## Split mast with mechanical fasteners — current candidate

The mast now has two lengthwise halves clamped together with **three M3×20
DIN 912 / ISO 4762 socket-cap screws and three DIN 934 M3 full hex nuts**. Use a
2.5 mm hex key. Screw length is measured under the head; the recessed stack is
sized without washers. This mast revision preserved the base, device cavities,
cable routes, centered saddle position and loaded envelope of its predecessor.
The later shared cable revision above changes the base routing and cable references.

The hard mating faces meet directly at X=0, with no adhesive gap. Screws clamp
the faces; their clearance holes allow some assembly movement, so align the
outer edges and dry-fit the assembled peg before tightening. Hex recesses locate
the nuts against rotation. Assemble and tighten before hanging the headphones;
the illustrated earcups obstruct lateral access to the lower screws when loaded.
Tighten gently by hand after verifying the coupon;
no torque or load capacity has been established. Assemble outside the base and
keep the peg's mating surfaces free of silicone and squeeze-out.

| Feature | Nominal geometry |
| --- | --- |
| Each full mast half, supplied print orientation | 190.9 × 57.3 × 26 mm |
| Each short mast joint-test half | 61.3522 × 18.0553 × 17 mm |
| Each saddle-test half | 50.4722 × 39 × 26 mm |
| Full-depth socket gauges | Three pieces, each 40 × 29 × 36.98 mm |
| Through bore | Ø3.4 mm |
| Screw-head pocket | Ø6.2 mm × 3.4 mm deep |
| Hex-nut pocket | 5.8 mm across flats × 3.4 mm deep |
| Distance between screw-head and nut bearing faces | 17.2 mm |
| Nominal thread beyond nut | 0.4 mm; tip remains 0.6 mm inside outer face |
| Peg floor clearance when collar seats | 0.6 mm |
| Peg tip lead-in | 1.2 mm long, 0.6 mm inset per side |

Nominal hardware dimensions are [Ø5.5 × 3 mm for the socket head](https://www.accu.co.uk/api/product-datasheet?id=642039)
and [5.5 mm across flats × 2.4 mm for the nut](https://www.accu.co.uk/api/product-datasheet?id=268686).
These references do not establish fit for a particular printed pocket or fastener
batch. Pocket floors retain a conservative analytical wall bound of about 1.55 mm;
the rounded exterior makes local pocket-mouth rims thinner. Verify both printing
and clamping on the coupon rather than treating that bound as a strength rating.

The collar underside now seats at Z=41.98 on the socket rim. Peg bottom is Z=8.6,
above the Z=8 floor; the central headband seat stays Z=196. The straight mating-key region starts
after its 1.2 mm lead-in. Socket clearance remains 0.35 mm per side pending the
new full-depth tests. Both halves must be aligned and seated together: seam gaps,
first-layer expansion or uneven tightening can change the assembled key size.

Both supplied half STLs have the mating face on Z=0. Screw holes and exterior
recesses run vertically in that print orientation; the geometry check finds no
above-bed downward faces for the current side layout. The rounded saddle replaces
the former feathered tips with finite-thickness ends. Check the actual X1C/PLA
toolpaths, pocket rims and layer finish before claiming support-free printing.
See [flat print layout](../previews/mast-print-layout.png) and
[joint-test pieces](../previews/mast-joint-test.png).

**Optional silicone:** prove the mechanical connection dry first. A small
accessible exterior seam bead may provide damping or sealing; no structural
reinforcement or PLA adhesion is assumed. Do not spread a layer between the hard
mating faces or fill the enclosed joint. [Dow's silicone reference](https://www.dow.com/en-us/pdp.dowsil-7091-adhesive-sealant.02436621h.html)
describes a flexible, moisture-cured material but does not establish adhesion to
PLA. [Dow's one-part weatherproofing sealant data](https://www.dow.com/content/dam/dcc/documents/en-us/productdatasheet/62/62-16/62-1636-01-dowsil-791-silicone-weatherproofing-sealant.pdf)
also illustrates the limitation on totally confined curing. Follow the actual
chosen product's substrate and full-cure instructions; these are material
references, not a recommendation to buy either product.

The current side-layout halves and joint coupons have zero detected above-bed
downward faces. The rear comparison has one near-vertical numerical triangle of
about 0.000103 mm²; its count is retained in the report. The flat-print check
allows a total 0.001 mm² numerical area, with a normal-Z threshold of −0.0001.
This numerical allowance does not establish a printable overhang threshold.

## Rounded retaining saddle — 2026-10-07

Front and back rolls rise **3.5 mm above the curved seat**, blending across
6 mm bands outside an independent **27 mm clear channel**. The channel assumes
25 mm headband depth plus 1 mm clearance per side; it is not a measured hardware
fit. Surface grid rows explicitly include channel boundaries and roll crests,
so adjusting the headband parameter does not interpolate the lips into the
requested channel. The top surface uses the original polygonal crown profile.

The saddle is now **52 mm wide × 39 mm deep**. Its plan-view outline and top
edges are rounded; the raised rolls fade smoothly into the seat and shoulders.
The previous feathered ends have been trimmed to retain material. Central seat
height and headset pose stay unchanged, with the lips reaching Z199.5 beneath
the modeled headphone top at Z206. At that revision the loaded envelope remained
**183.2 × 139.8 × 206 mm**, including the then-current cable references. The base,
device cavities and cable paths were unchanged by the saddle revision. The mast encloses about **72.89 cm³**
of solid CAD volume, an increase of **10.82 cm³ / 17.43%** over the previous
split mast. This is geometry volume, not sliced filament consumption or print time.

See the [rounded saddle close-up](../previews/saddle-detail.png) and
[saddle fit-test halves](../previews/saddle-test.png). The test pair includes the
actual upper screw connection; it verifies local fit and touch when printed in
the same orientation. It does not establish full-mast strength or resistance to
headphone sliding under a bump or cable tug.

The nominal reference headband has a clear straight-up removal path. The new
sweep probe starts 0.02 mm above tangential contact and follows the modeled band
continuously through 13.52 mm lift. This checks model clearance, not real padding,
ear-cup movement, cable slack, friction or the lift needed under every pose.
Physical retention and removal must still be checked with the actual headphones.

Current source and export hashes are recorded in the manifest. Mesh checks
separate positive-volume interference from intended contact at the mating plane,
bearing faces and socket rim. The connection has not yet been physically printed,
sliced, tightened, loaded or checked for long-term PLA creep.
