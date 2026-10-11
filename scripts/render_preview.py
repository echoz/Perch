"""Render the exported concept geometry without modifying a live Blender scene.

Blender --background --factory-startup --python scripts/render_preview.py -- ROOT
The assembled STL and each reference STL must share the OpenSCAD coordinate frame.
"""

import argparse
import json
import math
import sys
from pathlib import Path

import bpy
from mathutils import Vector


parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("root")
parser.add_argument("--exports", default="exports/concept")
parser.add_argument("--previews", default="previews")
args = parser.parse_args(sys.argv[sys.argv.index("--") + 1:])
ROOT = Path(args.root).resolve()
EXPORTS = ROOT / args.exports
PREVIEWS = ROOT / args.previews
PREVIEWS.mkdir(parents=True, exist_ok=True)
manifest = json.loads((EXPORTS / "manifest.json").read_text())
bpy.ops.object.select_all(action="SELECT")
bpy.ops.object.delete(use_global=False)
scene = bpy.context.scene
scene.name = "Yoto · " + manifest["layout"] + " layout"
scene.unit_settings.system = "METRIC"
scene.unit_settings.scale_length = 1
scene.unit_settings.length_unit = "MILLIMETERS"


def material(name, color, roughness=0.52):
    mat = bpy.data.materials.new(name)
    mat.diffuse_color = (*color, 1)
    mat.use_nodes = True
    principled = next(n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
    principled.inputs["Base Color"].default_value = (*color, 1)
    principled.inputs["Roughness"].default_value = roughness
    return mat


def load(name, filename, mat):
    bpy.ops.wm.stl_import(filepath=str(EXPORTS / filename), global_scale=0.001, use_facet_normal=False)
    obj = bpy.context.object
    obj.name = name
    obj.data.materials.append(mat)
    return obj


printed = material("Printed dock · illustrative PLA color", (0.16, 0.39, 0.37))
metal = material("Purchased fasteners · dimensional reference", (0.34, 0.36, 0.38), 0.3)
mini_mat = material("Jacketed Mini · assumed envelope", (0.48, 0.36, 0.63))
card_mat = material("Twenty cards · assumed stack", (0.90, 0.59, 0.19))
headphone_mat = material("Headphones · assumed envelope", (0.26, 0.29, 0.34))
cable_mat = material("Cables · assumed routing", (0.08, 0.10, 0.13))
floor_mat = material("Studio ground", (0.83, 0.85, 0.86), 0.75)

printed_objects = [
    load("Dock base · concept geometry", "base.stl", printed),
    load("Headphone mast · concept geometry", "installed_mast.stl", printed),
]
fasteners = [load("Three M3 screws and nuts · purchased hardware", "reference_fasteners.stl", metal)]
assembly_objects = [*printed_objects, *fasteners]
auxiliary_objects = []
references = [
    load("Jacketed Mini · illustrative dimensions", "reference_mini.stl", mini_mat),
    load("20 cards · illustrative dimensions", "reference_cards.stl", card_mat),
    load("JBL headset · envelope only", "reference_headphones.stl", headphone_mat),
]
if (EXPORTS / "reference_cables.stl").exists():
    references.append(load("Connected cables · assumed", "reference_cables.stl", cable_mat))


def bounds(objects):
    corners = [obj.matrix_world @ Vector(corner) for obj in objects for corner in obj.bound_box]
    low = Vector([min(c[i] for c in corners) for i in range(3)])
    high = Vector([max(c[i] for c in corners) for i in range(3)])
    return low, high


bpy.context.view_layer.update()
low, high = bounds([*printed_objects, *references])
center = (low + high) / 2

bpy.ops.mesh.primitive_plane_add(size=200, location=(0, 0, -0.0006))
ground = bpy.context.object
ground.name = "Studio ground · not printable"
ground.data.materials.append(floor_mat)

world = bpy.data.worlds.new("Concept studio")
scene.world = world
world.use_nodes = True
background = next(n for n in world.node_tree.nodes if n.type == "BACKGROUND")
background.inputs["Color"].default_value = (0.78, 0.82, 0.86, 1)
background.inputs["Strength"].default_value = 0.35


def area_light(name, pos, power, size):
    data = bpy.data.lights.new(name, "AREA")
    data.energy = power
    data.shape = "DISK"
    data.size = size
    obj = bpy.data.objects.new(name, data)
    scene.collection.objects.link(obj)
    obj.location = pos
    obj.rotation_euler = (center - obj.location).to_track_quat("-Z", "Y").to_euler()


area_light("Large softbox", (0.1, -0.25, 0.45), 12, 0.35)
area_light("Fill", (-0.3, -0.05, 0.18), 5, 0.3)
area_light("Rear rim", (0.08, 0.35, 0.38), 9, 0.25)
camera_data = bpy.data.cameras.new("Review camera")
camera = bpy.data.objects.new("Review camera", camera_data)
scene.collection.objects.link(camera)
scene.camera = camera
camera_data.type = "ORTHO"
camera_data.clip_start = 0.0001
camera_data.clip_end = 100

try:
    scene.render.engine = "CYCLES"
    scene.cycles.device = "CPU"
    scene.cycles.samples = 40
    scene.cycles.use_denoising = True
except TypeError:
    scene.render.engine = "BLENDER_EEVEE"
scene.render.resolution_x = 1100
scene.render.resolution_y = 1000
scene.render.resolution_percentage = 100
scene.render.image_settings.file_format = "PNG"
scene.render.film_transparent = False
scene.render.image_settings.color_mode = "RGB"
scene.view_settings.view_transform = "AgX"
scene.view_settings.exposure = -2.2


def frame_camera(objects, direction, focus_bounds=None):
    low, high = focus_bounds if focus_bounds is not None else bounds(objects)
    target = (low + high) / 2
    camera.location = target + Vector(direction).normalized() * 0.8
    camera.rotation_euler = (target - camera.location).to_track_quat("-Z", "Y").to_euler()
    rotation = camera.rotation_euler.to_quaternion()
    corners = ([Vector((x, y, z)) for x in (low.x, high.x)
                for y in (low.y, high.y) for z in (low.z, high.z)]
               if focus_bounds is not None else
               [obj.matrix_world @ Vector(corner) for obj in objects for corner in obj.bound_box])
    projected = [rotation.inverted() @ (corner - target) for corner in corners]
    left, right = min(v.x for v in projected), max(v.x for v in projected)
    bottom, top = min(v.y for v in projected), max(v.y for v in projected)
    camera.location += rotation @ Vector(((left+right)/2, (bottom+top)/2, 0))
    aspect = scene.render.resolution_x / scene.render.resolution_y
    camera_data.ortho_scale = max(right-left, (top-bottom)*aspect) * 1.12


def render(name, objects, direction, focus_bounds=None):
    for obj in [*assembly_objects, *references, *auxiliary_objects]:
        obj.hide_render = obj not in objects
    scene.view_layers[0].update()
    frame_camera(objects, direction, focus_bounds)
    scene.render.filepath = str(PREVIEWS / name)
    bpy.ops.render.render(write_still=True)


render("loaded-concept.png", [*assembly_objects, *references], (1.2, -1.7, 1.0))
render("loaded-front.png", [*assembly_objects, *references], (0, -1, 0.3))
render("dock-concept.png", assembly_objects, (1.2, -1.6, 1.1))
render("base-detail.png", [printed_objects[0]], (1.2, -1.8, 1.3))
render("base-profile.png", [printed_objects[0]], (-1.2, -1.8, 1.0))
render("base-rear.png", [printed_objects[0]], (1.1, 1.6, 1.1))
render("base-cable-route.png", [printed_objects[0]], (0, -0.7, 2.0))
# Rotate a display copy to show the actual underside in the same lit studio.
# The authoritative base object and exported print orientation stay unchanged.
base_underside = printed_objects[0].copy()
base_underside.name = "Base underside · rotated review copy"
scene.collection.objects.link(base_underside)
base_low, base_high = bounds([printed_objects[0]])
base_underside.rotation_euler.x = math.pi
base_underside.location.y = base_low.y + base_high.y
base_underside.location.z = base_high.z
auxiliary_objects.append(base_underside)
render("base-underside.png", [base_underside], (0.2, -0.5, 1.7))
render("loaded-top.png", [*assembly_objects, *references], (0, 0, 1))
render("dock-rear.png", assembly_objects, (-1.1, 1.7, 1.0))

# Frame the actual upper mast mesh without cutting or changing its geometry.
mast_points = [printed_objects[1].matrix_world @ vertex.co
               for vertex in printed_objects[1].data.vertices]
mast_top = max(point.z for point in mast_points)
saddle_points = [point for point in mast_points if point.z >= mast_top - 0.030]
saddle_bounds = (Vector([min(point[i] for point in saddle_points) for i in range(3)]),
                 Vector([max(point[i] for point in saddle_points) for i in range(3)]))
render("saddle-detail.png", [printed_objects[1]], (1.2, -1.6, 1.3), saddle_bounds)

mast_halves = [load("Mast left · print orientation", "mast_left.stl", printed),
               load("Mast right · print orientation", "mast_right.stl", printed)]
bpy.context.view_layer.update()
mast_halves[1].location.y += bounds([mast_halves[0]])[1].y - bounds([mast_halves[1]])[0].y + 0.008
auxiliary_objects.extend(mast_halves)
render("mast-print-layout.png", mast_halves, (0.3, -1.1, 1.5))
joint_tests = [load("Mast joint test left", "mast_joint_test_left.stl", printed),
               load("Mast joint test right", "mast_joint_test_right.stl", printed),
               load("Full-depth socket gauges", "full_socket_test.stl", printed)]
joint_tests[1].location.y += 0.035
joint_tests[2].location.y += 0.080
auxiliary_objects.extend(joint_tests)
render("mast-joint-test.png", joint_tests, (0.6, -1.2, 1.5))
saddle_tests = [load("Saddle test left", "saddle_test_left.stl", printed),
                load("Saddle test right", "saddle_test_right.stl", printed)]
bpy.context.view_layer.update()
saddle_tests[1].location.y += bounds([saddle_tests[0]])[1].y - bounds([saddle_tests[1]])[0].y + 0.008
auxiliary_objects.extend(saddle_tests)
render("saddle-test.png", saddle_tests, (0.3, -1.1, 1.5))

mini_tests = [load("Measured Mini pocket tests · clearance trials", "mini_pocket_tests.stl", printed)]
auxiliary_objects.extend(mini_tests)
render("mini-pocket-tests.png", mini_tests, (0.4, -0.8, 1.8))

cable_test = [load("Shared cable passage test · provisional plug fit", "shared_cable_test.stl", printed)]
auxiliary_objects.extend(cable_test)
render("shared-cable-test.png", cable_test, (0.7, -1.0, 1.6))

for obj in references:
    obj.hide_render = False
    obj["geometry_status"] = "Illustrative envelope; actual device dimensions unverified"
for obj in printed_objects:
    obj.hide_render = False
    obj["geometry_status"] = "Concept only; physical fit and printing unverified"
for obj in fasteners:
    obj.hide_render = False
    obj["geometry_status"] = "Purchased hardware reference; do not print"
for obj in auxiliary_objects:
    obj.hide_render = True
    obj.hide_set(True)
    obj["geometry_status"] = "Separate printable part or fit coupon; physical verification required"
scene["project_status"] = "Yoto compact charging station concept — measure and test before full print"
scene["source"] = "cad/compact_dock.scad"
scene["source_sha256"] = manifest["source_sha256"]
scene["layout"] = manifest["layout"]
scene["units_note"] = "Imported millimetre STL scaled by 0.001 to metres"
scene["dimensions_mm"] = json.dumps({
    "printed_assembly": [round(v * 1000, 2) for v in bounds(printed_objects)[1] - bounds(printed_objects)[0]],
    "illustrative_loaded_envelope": [round(v * 1000, 2) for v in bounds([*printed_objects, *references])[1] - bounds([*printed_objects, *references])[0]],
})
frame_camera([*printed_objects, *references], (1.2, -1.7, 1.0))
bpy.ops.wm.save_as_mainfile(filepath=str(PREVIEWS / "compact-dock-concept.blend"))
print("RENDER_COMPLETE", scene["dimensions_mm"])
