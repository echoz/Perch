"""Inspect OpenSCAD millimetre STL exports using Blender's bundled Python.

Run with Blender --background --factory-startup --python this_file -- EXPORT_DIR.
This checks mesh topology and dimensions, not real-world device fit or strength.
"""

import hashlib
import json
import struct
import sys
from pathlib import Path

import bmesh
import bpy


def inspect(path):
    # Audit the actual STL before Blender can discard collapsed triangles.
    data = path.read_bytes()
    triangle_count = struct.unpack_from("<I", data, 80)[0]
    if len(data) != 84 + triangle_count * 50:
        raise ValueError(f"Expected binary STL: {path}")
    raw_degenerate = 0
    for index in range(triangle_count):
        coords = struct.unpack_from("<9f", data, 84 + index * 50 + 12)
        a = [coords[i + 3] - coords[i] for i in range(3)]
        b = [coords[i + 6] - coords[i] for i in range(3)]
        cross = [a[1]*b[2]-a[2]*b[1], a[2]*b[0]-a[0]*b[2], a[0]*b[1]-a[1]*b[0]]
        raw_degenerate += sum(value*value for value in cross) ** 0.5 / 2 < 1e-10
    bpy.ops.object.select_all(action="SELECT")
    bpy.ops.object.delete(use_global=False)
    bpy.ops.wm.stl_import(filepath=str(path), use_facet_normal=False)
    objects = list(bpy.context.selected_objects)
    reports = []
    for obj in objects:
        mesh = bmesh.new()
        mesh.from_mesh(obj.data)
        bmesh.ops.remove_doubles(mesh, verts=list(mesh.verts), dist=0.00001)
        mesh.normal_update()
        nonmanifold = sum(not edge.is_manifold for edge in mesh.edges)
        boundary = sum(edge.is_boundary for edge in mesh.edges)
        noncontiguous = sum(edge.is_manifold and not edge.is_contiguous for edge in mesh.edges)
        degenerate = sum(face.calc_area() < 1e-10 for face in mesh.faces)
        # In supplied print coordinates, negative-Z faces above the bed are
        # geometric overhangs. This does not predict a slicer's support settings.
        downward = [face for face in mesh.faces if face.normal.z < -0.0001]
        above_bed = [face for face in downward if face.calc_center_median().z > 0.0001]
        bed_contact = [face for face in downward
                       if all(abs(v.co.z) <= 0.0001 for v in face.verts)]
        remaining = set(mesh.verts)
        components = 0
        component_dimensions = []
        while remaining:
            components += 1
            pending = [remaining.pop()]
            members = list(pending)
            while pending:
                current = pending.pop()
                for edge in current.link_edges:
                    other = edge.other_vert(current)
                    if other in remaining:
                        remaining.remove(other)
                        pending.append(other)
                        members.append(other)
            component_dimensions.append([
                max(v.co[axis] for v in members) - min(v.co[axis] for v in members)
                for axis in range(3)
            ])
        coords = [v.co for v in mesh.verts]
        low = [min(v[axis] for v in coords) for axis in range(3)]
        high = [max(v[axis] for v in coords) for axis in range(3)]
        volume = mesh.calc_volume(signed=True)
        reports.append({
            "vertices": len(mesh.verts),
            "faces": len(mesh.faces),
            "components": components,
            "component_dimensions_mm": [[round(v, 5) for v in dims] for dims in component_dimensions],
            "nonmanifold_edges": nonmanifold,
            "boundary_edges": boundary,
            "inconsistent_winding_edges": noncontiguous,
            "degenerate_faces": degenerate,
            "above_bed_downward_faces": len(above_bed),
            "above_bed_downward_area_mm2": round(sum(f.calc_area() for f in above_bed), 4),
            "bed_contact_area_mm2": round(sum(f.calc_area() for f in bed_contact), 4),
            "signed_volume_mm3": round(volume, 3),
            "min_mm": [round(v, 4) for v in low],
            "max_mm": [round(v, 4) for v in high],
            "dimensions_mm": [round(b-a, 4) for a, b in zip(low, high)],
            "closed_oriented_mesh": nonmanifold == 0 and noncontiguous == 0 and degenerate == 0 and volume > 0,
        })
        mesh.free()
    return {"file": path.name, "sha256": hashlib.sha256(data).hexdigest(),
            "raw_stl_triangles": triangle_count,
            "raw_degenerate_triangles": raw_degenerate, "objects": reports}


args = sys.argv[sys.argv.index("--") + 1:]
directory = Path(args[0]).resolve()
manifest = json.loads((directory / "manifest.json").read_text())
root = Path(__file__).resolve().parents[1]
if hashlib.sha256((root / manifest["source"]).read_bytes()).hexdigest() != manifest["source_sha256"]:
    raise SystemExit("Exported source is stale; rebuild before inspecting")
for item in manifest["exports"]:
    if hashlib.sha256((directory / item["file"]).read_bytes()).hexdigest() != item["sha256"]:
        raise SystemExit(f"Export differs from manifest: {item['file']}")
paths = sorted(directory.glob("*.stl"))
if not paths:
    raise SystemExit("No STL exports found")
probe_names = ("interference", "device_interference", "reference_interference",
               "mast_hardware_interference", "mast_halves_interference",
               "saddle_removal_interference")
regular_paths = [path for path in paths if path.stem not in probe_names]
probe_paths = [path for path in paths if path.stem in probe_names]
probes = [inspect(path) for path in probe_paths]
for probe in probes:
    for obj in probe["objects"]:
        obj["zero_volume_planar_contact"] = (
            abs(obj["signed_volume_mm3"]) < 0.001
            and all(min(dims) < 0.0001 for dims in obj["component_dimensions_mm"])
        )
result = {
    "status": "concept; physical fit unverified",
    "source_sha256": manifest["source_sha256"],
    "layout": manifest["layout"],
    "units": "mm (STL has no intrinsic unit metadata)",
    "flat_print_check": {
        "normal_z_threshold": -0.0001,
        "bed_plane_tolerance_mm": 0.0001,
        "total_downward_area_tolerance_mm2": 0.001,
        "note": "Allow sub-resolution STL numerical slivers; retain their counts and areas in the report. Not a slicer support prediction.",
    },
    "checks": [inspect(path) for path in regular_paths],
    "intersection_probes": probes,
    "limitations": [
        "No physical fit, dimensional accuracy, load, or tipping test.",
        "Topology checks do not establish support-free printability or absence of every self-intersection.",
        "Reference envelopes are illustrative, not scans or manufacturer CAD.",
    ],
}
output = directory / "mesh-checks.json"
output.write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
if not all(obj["closed_oriented_mesh"] for item in result["checks"] for obj in item["objects"]):
    raise SystemExit("At least one mesh failed topology checks")
if any(item["raw_degenerate_triangles"] for item in result["checks"]):
    raise SystemExit("At least one raw STL contains degenerate triangles")
if not all(obj["zero_volume_planar_contact"] for item in probes for obj in item["objects"]):
    raise SystemExit("At least one intersection probe contains more than planar contact")
flat_parts = {"mast_left.stl", "mast_right.stl", "mast_joint_test_left.stl",
              "mast_joint_test_right.stl", "full_socket_test.stl",
              "saddle_test_left.stl", "saddle_test_right.stl", "mini_pocket_tests.stl"}
for item in result["checks"]:
    if item["file"] in flat_parts:
        for obj in item["objects"]:
            if (abs(obj["min_mm"][2]) > 0.0001 or obj["bed_contact_area_mm2"] <= 0
                    or obj["above_bed_downward_area_mm2"] > 0.001):
                raise SystemExit(f"Flat-print geometry check failed: {item['file']}")
