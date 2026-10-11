// Width-only refinement of the physically tried 0.3 mm Mini pocket.
// Millimetres. Complete shallow pockets; no full-base fit selection implied.
use <compact_dock.scad>

part = "mini_width_tests"; // mini_width_tests, mini_width_0_2, mini_width_0_1
$fn = 48;

// The authoritative measurement and coupon construction stay in the main CAD.
fit_dimensions = mini_pocket_test_dimensions();
measured_width = fit_dimensions[0];
measured_depth = fit_dimensions[1];
body_corner_radius = fit_dimensions[2]; // still provisional and unmeasured
floor_thickness = fit_dimensions[3];
wall_height = fit_dimensions[4];
wall_thickness = fit_dimensions[5];
tab_width = fit_dimensions[6];
tab_depth = fit_dimensions[7];
tab_overlap = fit_dimensions[8];
spacing = fit_dimensions[9];

// Keep the successful depth and the complete old 0.3 sample corner shape.
// Only the straight width changes; do not scale the whole sample or its radius.
retained_clearance = 0.3;
inside_depth = measured_depth+2*retained_clearance;
inside_radius = body_corner_radius+retained_clearance;
outside_depth = inside_depth+2*wall_thickness;
total_height = floor_thickness+wall_height;
row_pitch = outside_depth+tab_depth-tab_overlap+spacing;
eps = 0.02;

assert(inside_radius > 0 && 2*inside_radius < inside_depth);
assert(floor_thickness > 0 && wall_height > 0 && wall_thickness > 0);
assert(tab_overlap > 0 && tab_overlap < wall_thickness);
assert(spacing > 0);

module mini_width_test(width_clearance) {
    inside_width = measured_width+2*width_clearance;
    outside_width = inside_width+2*wall_thickness;
    tab_center_y = -outside_depth/2-tab_depth/2+tab_overlap;
    assert(width_clearance >= 0 && 2*inside_radius < inside_width);
    echo(label=str("W",width_clearance),clearance_per_side=width_clearance,
         inside_width=inside_width,inside_depth=inside_depth,
         provisional_inside_radius=inside_radius,
         floor_thickness=floor_thickness,wall_height_above_floor=wall_height);
    union() {
        difference() {
            linear_extrude(total_height)
                rounded_rectangle(outside_width,outside_depth,
                                  inside_radius+wall_thickness);
            translate([0,0,floor_thickness])
                linear_extrude(wall_height+eps)
                    rounded_rectangle(inside_width,inside_depth,inside_radius);
        }
        translate([0,tab_center_y,0]) {
            linear_extrude(floor_thickness)
                rounded_rectangle(tab_width,tab_depth,2);
            translate([0,1,floor_thickness-eps])
                linear_extrude(0.6+eps)
                    text(str("W",width_clearance),size=4.6,
                         halign="center",valign="bottom");
            translate([0,-4,floor_thickness-eps])
                linear_extrude(0.6+eps)
                    text("PER SIDE",size=2.8,halign="center",valign="bottom");
        }
    }
}

if(part=="mini_width_0_2") mini_width_test(0.2);
else if(part=="mini_width_0_1") mini_width_test(0.1);
else if(part=="mini_width_tests") {
    mini_width_test(0.2);
    translate([0,row_pitch,0]) mini_width_test(0.1);
}
else assert(false,"Unknown width-test part selector");
