# Perch

Follow the global working agreements and their applicable companion instructions.
Read `cad/README.md` for current geometry, assumptions, and physical checks still
needed. `cad/compact_dock.scad` owns the parameters; generated meshes and Blender
scenes must be regenerated after source changes. `README.md` documents the build.

## Version control

- Keep CAD source, documentation, build/review scripts, compact evidence JSON and
  the explicitly allowed documentation figures in Git. `.gitignore` keeps mesh
  exports, print ZIPs, Blender scenes/backups, other renders and local caches out.
- Preserve original source/mesh hashes and revision scope in historical audit
  records. Do not relabel old evidence as a fresh review after a rebuild.
- Put checked print packages in a separately tagged GitHub candidate release;
  physical validation status must remain explicit. Do not silently replace an
  existing release's artifacts or introduce a license without user direction.

## Current brief

- Design a 3D-printable, freestanding tabletop charging station for a Yoto Mini
  wearing an Adventure Jacket, kids' JBL headphones, and about 20 Yoto cards.
- Minimize the occupied footprint with the devices and charging cables installed,
  while retaining stability and easy access for a child.
- Cards may be stored together in one bin; individual display slots are unnecessary.
- The current arrangement is literal side by side, aligned at the front: one
  card container on the LEFT and the Yoto Mini immediately on the RIGHT, with
  headphones behind. The user explicitly corrected the staggered side-bin
  interpretation; do not revert to that arrangement to reduce footprint.
- Center the headphone mount and hanging headset on the whole base's left-to-right
  centerline so the station looks balanced from the front. Keep the approved
  sculpted pockets and verify the moved socket, headset and cable route.
- The card container should match the Yoto cradle's outer front-to-back depth, with
  higher walls than the initial shallow bin. Keep the outer compartment fronts
  and backs aligned; retain accessible card tops and verify headphone clearance.
- Shape the card container with a high back and smoothly descending side rims
  toward a shorter front. Prefer a continuous, softened outline to stepped
  cutaways while preserving the usable cavity and matched compartment depths.
- Give the Mini cradle the same organic treatment: a smooth, shallow rounded
  recess in the base instead of separate angular clips. Preserve jacket fit,
  accessible charging, and easy removal while softening the base outline.
- Make the base and both holders read as one softly rounded, continuous body,
  like two pockets carved into jelly. Blend the exterior transitions broadly,
  raise the walls slightly, and keep functional cavity clearances independent
  from those aesthetic curves. Quantify any footprint or material tradeoff.
- The user explicitly requested that the card and player holders join seamlessly:
  remove the narrow valley/crease between their shoulders with continuous rounded
  geometry while preserving the exact usable cavities and accepted card fit.
- Extend that sculpted surface behind both holders, around the headphone-mast
  socket and all the way to every outer base edge. The rear should read as part
  of the same organic body. Keep the keyed insertion opening, collar seating and
  right-hand cable passage usable; check the earcups and cable routes against the
  larger curved surface. Preserve the compact footprint and stable underside.
- Connect the insertion mound directly into the backs of both holders with a
  broad, smooth raised transition, like the accepted join between the two pockets.
  Merely sharing the bottom plate does not satisfy this visual connection.
- Compare occupied device/cable bounds and tipping directions; a wider base
  alone does not prove a lower center of mass.
- Precise, repeatable fit is a priority. Parameterize each functional clearance
  separately and verify critical interfaces with small test prints using the
  intended printer, material, and orientation before printing the full station.
- The user confirmed a Bambu Lab X1C with the stock nozzle and print bed, using
  PLA. The stock nozzle is 0.4 mm; the specific build plate and PLA product have
  not been identified. Do not infer a plate variant from "default".
- The prior discussion used JBL Junior 470NC as the headphone model. Confirm the
  actual hardware and measurements before fixing fit-critical geometry.
- The user measured the jacketed Mini section that sits in the pocket as
  75.08 mm wide × 44.91 mm deep on 2026-10-10. Its height and rounded edge profile,
  edition, headphone hanging envelope, and connector clearances remain unverified.
- The user has now reported a printed base: the card holder fits well, but the
  Mini pocket was too wide and loose front-to-back. The selected W0.1 opening
  is now integrated into the base with independent width and depth clearances.
  Preserve the successful card fit; do not infer a dimensional correction from
  the photo. Record physical fit feedback in `cad/README.md`.
- The user has tried the measured 0.3 mm-per-side Mini sample and found slight
  sideways looseness, roughly 0.5 mm by their uncertain estimate. Preserve its
  depth and corner radius in the new W0.2/W0.1 width trials. Do not treat that
  estimate as an exact subtraction. The user selected W0.1 on 2026-10-11:
  75.28 × 45.51 mm opening, 0.1 mm width clearance per side, 0.3 mm depth
  clearance per side, and the retained 6.3 mm inside corner radius. Preserve
  the 55.4 × 49.6 mm card cavity and aligned outer shoulders independently of
  the smaller Mini cut. Selection does not prove full-height removal or charging
  access; only the earlier 0.3 sample has explicit physical-fit feedback.
  `cad/mini_width_tests.scad` is the supplementary width-trial entrypoint; it
  consumes the authoritative measured/sample settings from `compact_dock.scad`.
- Replace the two side-layout underside cable troughs and old headphone rear
  opening with one shared rear-entry trough feeding a rounded through-hole just
  RIGHT of the headphone-mast socket, viewed from the front (moved from the left
  at the user's request on 2026-10-11). It must carry two
  USB-C leads for the Mini and headphones. Both device plugs are right-angle;
  their body sizes are unknown. Keep passage dimensions adjustable and provisional,
  and include a small cable-passage test before claiming that the elbows fit.
- The user confirmed that the Mini's USB-C socket is on the RIGHT when facing
  its screen. Its exact position, connected plug dimensions and cable bends
  still need measurement.

- Print the mast as two lengthwise halves with their mating faces on the bed.
  The user chose a mechanical connection with optional silicone. The current
  candidate uses recessed screws and hex nuts; the mechanical joint must work dry.
  Do not rely on unverified silicone adhesion to PLA or introduce a silicone film
  between the hard mating faces. Verify the split peg, fastener pockets and socket
  with the matching test pieces before a full print.
- Give the headphone saddle low front and back retaining lips in the same softly
  rounded design language as the base. Keep the usable headband channel separate
  from lip thickness, preserve easy upward removal, and verify the revised halves
  still print flat. Use a small saddle test with the actual headphones before
  claiming retention; the modeled headband dimensions are still assumptions.

## Worker routing exception

- Use the shared GPT-6.1-Sol worker defaults for research and routine support work.
- Use GPT-6-Astra for delegated 3D/CAD modeling, geometric layout, fit, and
  printability decisions. Choose effort for the assignment using the shared
  orchestration guidance.
- Keep this exception scoped to the modeling work; do not change the global
  worker defaults or the parent model. Assign one writer to overlapping models.

## Modeling evidence

- Treat marketplace specifications and prior conceptual dimensions as references,
  not proof that the user's devices fit. Label estimates and unverified geometry.
- Compare the full loaded envelope, including headphone overhang and cable bends,
  rather than only the printed base dimensions.
- Verify access to charging ports, controls, card insertion, and device removal.
- Keep the silicone-jacket cradle easy to remove; use measured clearance rather
  than treating compression of the jacket as dimensional accuracy. Check the
  actual 20-card stack and connected cable envelopes when sizing storage.
- Preserve source attribution and the license of any model actually remixed.
- Distinguish digital geometry checks from a physical fit test and printed result.
