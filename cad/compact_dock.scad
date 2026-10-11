// Compact Yoto charging station concept. All lengths are millimetres.
// ILLUSTRATIVE DEVICE ENVELOPES: measure and print coupons before a full build.
// This file is the single authoritative parameter and geometry source.

/* [Output] */
part = "assembled"; // base, mast_left, mast_right, mast, installed_mast, assembled, mast_joint_test_left, mast_joint_test_right, saddle_test_left, saddle_test_right, full_socket_test, shared_cable_test, joint_test, cradle_test, mini_pocket_tests, card_test, reference_fasteners, info
layout = "side"; // side = current concept; rear = comparison only
show_references = false;
$fn = 48;

/* [Unverified hardware envelopes - replace with measurements] */
// Historical dimensions belong only to the rear comparison and legacy gauges.
// The side-layout reference uses the measured seated section below.
legacy_mini_width = 82;
legacy_mini_depth = 48;
mini_height = 78; // still unmeasured
mini_corner_radius = 6; // still unmeasured; not established by width/depth
card_width = 85.6; // long card edge; upright in side layout
card_height = 54;
card_stack_thickness = 16; // total actual stack, nominally 20 cards
headphone_width = 150;
headphone_depth = 76;
headphone_height = 180;
headphone_inner_gap = 104; // simplified gap between earcups
headphone_cup_height = 89; // published external reference, not measured hardware
headband_depth = 25;
headband_thickness = 10;
saddle_crown_radius = 62; // illustrative curved support; confirm actual headband
// User confirms RIGHT socket and right-angle plugs; sizes and elbow poses unmeasured.
mini_port_side = 1; // +1 right in model, -1 left
mini_port_y_from_front = 31;
mini_port_z_from_bottom = 27;
mini_connector_projection = 18;
cable_bend_allowance = 12; // illustrative external space, NOT a cable bend rating
cable_diameter = 4;
headphone_connector_projection = 14; // hypothetical downward connector at left cup
headphone_cable_floor_allowance = 12; // assumed bend/access room below that plug
headphone_rear_lead_reserve = 8; // modeled lead extends this far beyond the base

/* [Independent fit allowances] */
// User selected W0.1: narrow width only; retain the original 0.3 sample depth
// and its exact R6.3 opening. This does not establish the real body radius.
mini_width_clearance_per_side = 0.1;
mini_depth_clearance_per_side = 0.3;
mini_inside_corner_radius = 6.3;
legacy_cradle_clearance_per_side = 0.8; // rear comparison only
card_width_allowance_total = 1.4; // total horizontal card-face span; 54 mm in side layout
card_stack_allowance_total = 2;
socket_clearance_per_side = 0.35; // each X and Y side; no vertical interference
headphone_route_clearance_per_side = 1; // legacy rear-comparison slot only

/* [Layout and access allowances - illustrative, not fit measurements] */
side_connector_to_headphone_gap = 2.2; // connector rear bound to front of hanging cups
side_bin_to_headphone_gap = 2.2; // bin rear exterior to front of hanging cups
side_card_stack_front_offset = 1; // illustrative loose-stack pose, not measured clearance
side_mast_clearance_behind_cradle = 1.05; // socket front to cradle rear exterior
// Preserve the approved exterior and card fit independently of the Mini cut.
side_mini_shoulder_width = 83.6;
side_pocket_envelope_depth = 49.6; // card cavity and Mini shaping envelope
side_mini_shoulder_corner_radius = 6.8;
side_shared_ridge_width = 9; // card cavity to Mini shaping envelope
sculpt_blend_width = 6; // exterior shoulder width around both cavities
sculpt_crest_size = 2; // smoothly eased crest is2 mm wide/high; not a fit radius
sculpt_union_blend = 5; // height-domain smoothing across intersecting raised regions
sculpt_grid_pitch = 0.3; // actual modeled surface resolution, not render-only smoothing
sculpt_base_edge_height = 2;
sculpt_rear_rise = 16; // low rolling landscape, fading continuously to all rear edges
sculpt_socket_blend_width = 26; // bury the straight socket sides in a broad rounded mound
sculpt_socket_rim_exposure = 0.48; // retain the exact existing collar bearing face
sculpt_cable_deck_margin = 2; // flat land beyond throat; includes its 1 mm rounded mouth
sculpt_cable_recess_blend = 6;
sculpt_cable_surface_clearance = 0.8; // illustrative lead above the new surface
sculpt_cable_path_step = 2; // sampled reference path, not a rated cable bend
side_base_behind_saddle = 20; // support behind saddle center, not a stability result
rear_connector_to_headphone_gap = 2.2;
// Headphone support is centered on the printed base, independent of pocket layout.

/* [Printed structure] */
wall = 3;
base_thickness = 8;
base_corner_radius = layout == "side" ? 8 : 3;
cradle_rail_height = 14;
cradle_side_window_end = 6; // short corner guards; both sides mostly open
cradle_side_window_sill = 2;
side_card_front_height = 32;
side_card_back_height = 65;
mini_tray_front_height = 8;
mini_tray_back_height = 18;
card_pocket_height = layout == "side" ? max(side_card_front_height,side_card_back_height) : 32;
card_finger_width = 32;
card_finger_drop = 13;
mast_peg_width = 30;
mast_peg_depth = 10;
mast_peg_height = 34;
mast_shaft_width = 24;
mast_shaft_depth = 10;
// Minimum-height hypothesis: cups clear their assumed downward plug and bend.
// Override mast_height if measured access or hanging geometry needs more height.
mast_height = headphone_height + headphone_connector_projection +
    headphone_cable_floor_allowance - base_thickness - headband_thickness;
saddle_width = 64;
saddle_flare_height = 20; // 20 mm lateral flare over20 mm rise
saddle_cap_height = 4; // shaft-to-crown datum retained for existing fastener positions
// Rounded retaining lips surround an independent clear headband channel.
saddle_channel_clearance_per_side = 1;
saddle_lip_height = 3.5;
saddle_lip_blend_width = 6;
saddle_contact_width = 52; // trim the former feathered tips, retaining a broad seat
saddle_cap_depth = 10; // finite material under the rounded outer seat edges
saddle_outline_radius = 4;
saddle_edge_roll_height = 1;
saddle_edge_roll_width = 2;
saddle_grid_pitch = 0.5;
underside_channel_width = 6; // two lanes retained only in the rear comparison
underside_channel_depth = 4.6;
coupon_clearances = [0.4, 0.7, 1.0]; // cradle per-side and card total trials
socket_coupon_clearances = [0.2, 0.35, 0.5]; // per-side trials

/* [Shared side-layout cable route - provisional until real plugs are tested] */
shared_cable_hole_center = [39,75]; // RIGHT of mast when facing the screen
shared_cable_hole_width = 24; // throat, not established right-angle plug clearance
shared_cable_hole_depth = 18;
shared_cable_hole_radius = 4;
shared_cable_mouth_round = 1; // maximum outward expansion at top/bottom surfaces
shared_cable_channel_width = 12; // one tunnel for both leads
shared_cable_rear_relief = 6; // full-height rear opening before the edge tapers
shared_cable_center_spacing = 6; // illustrative two 4 mm leads, 2 mm between them
shared_cable_exit_height = 10; // reference cord center above the 8 mm deck
shared_headphone_route_behind_socket = 90; // illustrative waypoint, not a fitted guide
shared_cable_test_width = 40;
shared_cable_test_front = -17;
shared_cable_test_rear = 40;

/* [Measured Mini section and historical pocket tests] */
// User-measured jacketed section seated in the pocket, 2026-10-10.
// Straight rounded rectangle, no taper; do not compress silicone to achieve fit.
mini_measured_width = 75.08;
mini_measured_depth = 44.91;
mini_test_body_corner_radius = 6; // PROVISIONAL, UNMEASURED original assumption
mini_test_clearances_per_side = [0.3, 0.5, 0.7]; // each X and Y side
mini_test_floor_thickness = 2; // moves functional cavity above bed-contact layers
mini_test_wall_height = 8; // above floor; local fit, not the sculpted removal sweep
mini_test_wall_thickness = 2.4;
mini_test_tab_width = 36;
mini_test_tab_depth = 15;
mini_test_tab_overlap = 1.6; // finite overlap; avoids coincident tab/wall tangencies
mini_test_spacing = 6; // minimum separation between coupons including label tabs

/* [Split mast mechanical joint - calibrate using the matching coupons] */
// Three M3x20 DIN912/ISO4762 socket-cap screws and DIN934 full hex nuts.
// Nominal hardware: 5.5x3 head, 5.5 AF x2.4 nut, 2.5 mm hex driver.
// Screw length is measured UNDER the head. No washers in this recessed stack.
mast_screw_length = 20;
mast_screw_diameter = 3;
mast_screw_head_diameter = 5.5;
mast_screw_head_height = 3;
mast_nut_across_flats = 5.5;
mast_nut_height = 2.4;
mast_bore_diameter = 3.4;
mast_head_pocket_diameter = 6.2;
mast_head_pocket_depth = 3.4;
mast_nut_pocket_across_flats = 5.8;
mast_nut_pocket_depth = 3.4;
mast_socket_floor_relief = 0.6; // collar seats on housing top; peg must not bottom
mast_tip_leadin_height = 1.2;
mast_tip_leadin_per_side = 0.6;
mast_fastener_shaft_fractions = [0.11, 0.5, 0.89];
// Hard, dry mating faces and the screws establish the joint. Silicone is optional
// along the assembled exterior seam only; neither its adhesion nor strength is assumed.

/* [Derived layout - do not edit] */
eps = 0.02;
saddle_channel_depth = headband_depth+2*saddle_channel_clearance_per_side;
saddle_outer_depth = saddle_channel_depth+2*saddle_lip_blend_width;
wall_join_step = 0.1; // buried wall overlap offset; does not alter either fit cavity
side_layout = layout == "side";
mini_width = side_layout ? mini_measured_width : legacy_mini_width;
mini_depth = side_layout ? mini_measured_depth : legacy_mini_depth;
cradle_inside_width = mini_width + 2 * (side_layout
    ? mini_width_clearance_per_side : legacy_cradle_clearance_per_side);
cradle_inside_depth = mini_depth + 2 * (side_layout
    ? mini_depth_clearance_per_side : legacy_cradle_clearance_per_side);
cradle_front = side_layout ? sculpt_blend_width : wall;
divider_front = cradle_front + (side_layout ? side_pocket_envelope_depth : cradle_inside_depth);
card_face_span = side_layout ? card_height : card_width;
card_standing_height = side_layout ? card_width : card_height;
card_inside_width = card_face_span + card_width_allowance_total;
card_stack_fit_depth = card_stack_thickness + card_stack_allowance_total;
// Match the compartment exteriors while retaining the accepted card cavity.
// Stack thickness/allowance remain separate facts used by the rear bin and gauges.
card_inside_depth = side_layout ? side_pocket_envelope_depth : card_stack_fit_depth;
socket_inside_width = mast_peg_width + 2 * socket_clearance_per_side;
socket_inside_depth = mast_peg_depth + 2 * socket_clearance_per_side;
socket_outside_width = socket_inside_width + 2 * wall;
socket_outside_depth = socket_inside_depth + 2 * wall;
mini_center_x = side_layout ? (card_inside_width+side_shared_ridge_width)/2 : 0;
mini_center_y = cradle_front+(side_layout ? side_pocket_envelope_depth : cradle_inside_depth)/2;
mini_back_y = mini_center_y+mini_depth/2;
mini_port_x = mini_center_x + mini_port_side * mini_width / 2;
mini_port_y = mini_center_y-mini_depth/2+mini_port_y_from_front;
mini_port_z = base_thickness + mini_port_z_from_bottom;
mini_cable_half_y = max(10,cable_diameter)/2;
mini_cable_half_z = max(7,cable_diameter)/2;
card_center_x = side_layout ? mini_center_x-side_mini_shoulder_width/2-side_shared_ridge_width-card_inside_width/2 : 0;
card_inside_front = side_layout ? cradle_front : divider_front+wall;
card_inside_rear = card_inside_front + card_inside_depth;
card_center_y = (card_inside_front+card_inside_rear)/2;
card_stack_center_y = side_layout ? card_inside_front+side_card_stack_front_offset+card_stack_thickness/2
                                 : card_center_y;
mast_x = 0; // base centerline: socket, mast, saddle and headphone reference
mast_y = side_layout ? divider_front+sculpt_blend_width+side_mast_clearance_behind_cradle+socket_outside_depth/2
                    : card_inside_rear+socket_outside_depth/2+wall_join_step;
saddle_y = headphone_depth/2 + (side_layout
    ? max(mini_port_y+mini_cable_half_y+side_connector_to_headphone_gap,
          card_inside_rear+sculpt_blend_width+side_bin_to_headphone_gap)
    : mini_port_y+mini_cable_half_y+rear_connector_to_headphone_gap);
mast_forward_offset = mast_y-saddle_y; // negative means the mast leans rearward
base_width = side_layout ? side_mini_shoulder_width+card_inside_width+side_shared_ridge_width+2*sculpt_blend_width
                         : max(cradle_inside_width,card_inside_width)+2*wall;
base_depth = side_layout ? max(card_inside_rear+2*sculpt_blend_width,saddle_y+side_base_behind_saddle)
                         : card_inside_rear+socket_outside_depth+wall+wall_join_step;
headphone_top = base_thickness + mast_height + headband_thickness;
headphone_bottom = headphone_top - headphone_height;
channel_x = base_width / 2 - 12; // rear-comparison lanes only
mini_cable_tip_x = mini_port_x + mini_port_side *
    (mini_connector_projection + (side_layout ? 0 : cable_bend_allowance));
mini_elbow_cable_x = mini_cable_tip_x-mini_port_side*4; // unmeasured 8 mm elbow leg
mini_elbow_bottom_z = mini_port_z-10; // unmeasured downward leg
headphone_connector_x = mast_x-(headphone_width + headphone_inner_gap) / 4;
headphone_cable_half_x = max(8,cable_diameter)/2;
headphone_cable_half_y = max(7,cable_diameter)/2;
headphone_route_width = cable_diameter+2*headphone_route_clearance_per_side; // legacy only
headphone_route_z = side_layout ? underside_channel_depth/2 : base_thickness/2;
headphone_route_end_y = max(base_depth,saddle_y)+headphone_rear_lead_reserve;
shared_headphone_x = shared_cable_hole_center[0]-shared_cable_center_spacing/2;
shared_mini_x = shared_cable_hole_center[0]+shared_cable_center_spacing/2;
headphone_elbow_cable_y = saddle_y-8; // illustrative forward-facing elbow
headphone_elbow_cable_z = headphone_bottom-8;
shared_cable_minimum_roof_thickness = base_thickness-underside_channel_depth;
shared_cable_cavity_margin = shared_cable_hole_center[1]-shared_cable_hole_depth/2-
    shared_cable_mouth_round-max(card_inside_rear,divider_front);
shared_cable_slot_margin = abs(shared_cable_hole_center[0]-mast_x)-
    socket_inside_width/2-shared_cable_hole_width/2-shared_cable_mouth_round;
loaded_min = [
    min(-base_width/2,mast_x-headphone_width/2,mast_x-saddle_width/2,mini_port_x,mini_cable_tip_x,
        headphone_connector_x-headphone_cable_half_x),
    min(0,saddle_y-headphone_depth/2,saddle_y-saddle_outer_depth/2,
        mini_port_y-mini_cable_half_y,saddle_y-headphone_cable_half_y),
    min(0,mini_port_z-mini_cable_half_z,headphone_bottom-headphone_connector_projection)
];
loaded_max = [
    max(base_width/2,mast_x+headphone_width/2,mast_x+saddle_width/2,mini_port_x,mini_cable_tip_x,
        headphone_connector_x+headphone_cable_half_x),
    max(base_depth,saddle_y+headphone_depth/2,saddle_y+saddle_outer_depth/2,
        mini_port_y+mini_cable_half_y,saddle_y+headphone_cable_half_y,
        headphone_route_end_y+cable_diameter/2),
    max(headphone_top,base_thickness+mini_height,base_thickness+card_standing_height,
        mini_port_z+mini_cable_half_z,headphone_bottom)
];

// Keep socket/base geometry and the installed saddle height unchanged. Only the
// peg and lower shaft adapt to the collar seating datum and explicit floor gap.
mast_assembly_z = base_thickness + mast_socket_floor_relief;
mast_print_height = mast_height - mast_socket_floor_relief; // crown-seat local Z
mast_geometry_height = mast_print_height+saddle_lip_height; // includes raised lips
mast_collar_z = mast_peg_height - eps - mast_socket_floor_relief;
mast_shaft_start_z = mast_collar_z + 3;
mast_shaft_top_z = mast_print_height - saddle_cap_height - saddle_flare_height;
mast_shaft_slope = -mast_forward_offset/(mast_shaft_top_z-mast_shaft_start_z);
function mast_shaft_center_y(z) = mast_shaft_slope*(z-mast_shaft_start_z-1);
mast_fastener_z = [for(f=mast_fastener_shaft_fractions)
    mast_shaft_start_z+1+f*(mast_shaft_top_z-mast_shaft_start_z)];
mast_head_bearing_x = -mast_shaft_width/2 + mast_head_pocket_depth;
mast_nut_bearing_x = mast_shaft_width/2 - mast_nut_pocket_depth;
mast_fastener_grip = mast_nut_bearing_x-mast_head_bearing_x;
mast_screw_tip_x = mast_head_bearing_x+mast_screw_length;
mast_thread_projection = mast_screw_length-mast_fastener_grip-mast_nut_height;
mast_joint_test_height = mast_fastener_z[0]+10;
saddle_test_bottom_z = mast_fastener_z[2]-10;
saddle_test_height = mast_geometry_height-saddle_test_bottom_z;
saddle_test_y_offset = mast_forward_offset+saddle_outer_depth/2;
mast_flat_y_offset = mast_peg_depth/2+2;
// Conservative circular envelope at pocket bearing floors, away from the
// shaft's rounded outer corners. This is not a uniform pocket-mouth rim claim.
mast_pocket_bearing_wall = mast_shaft_depth/2-max(mast_head_pocket_diameter,
    mast_nut_pocket_across_flats/cos(30))/2*sqrt(1+pow(mast_shaft_slope,2));

assert(mini_port_side == 1 || mini_port_side == -1);
assert(layout == "side" || layout == "rear");
assert(mini_width_clearance_per_side >= 0 && mini_depth_clearance_per_side >= 0);
assert(mini_inside_corner_radius > 0 &&
       2*mini_inside_corner_radius < min(cradle_inside_width,cradle_inside_depth));
assert(!side_layout || (cradle_inside_width <= side_mini_shoulder_width &&
       cradle_inside_depth <= side_pocket_envelope_depth),
       "Keep the selected cavity inside the preserved exterior shaping envelope");
assert(!side_layout || (side_card_stack_front_offset >= 0 &&
       side_card_stack_front_offset+card_stack_thickness <= card_inside_depth),
       "The illustrated card-stack pose must remain inside the loose bin");
assert(headphone_bottom-headphone_connector_projection > base_thickness,
       "The illustrative headphone cable needs positive clearance above the floor");
assert(base_thickness - underside_channel_depth >= 3); // flat interior only
assert(!side_layout || shared_cable_rear_relief >= sculpt_blend_width,
       "Open the shared tunnel before the pillowed rear edge reduces its roof");
assert(!side_layout || min(shared_cable_cavity_margin,shared_cable_slot_margin) >= 3,
       "Keep the expanded cable mouth clear of the exact pocket cavities and keyed slot");
assert(!side_layout || abs(shared_cable_hole_center[0])+shared_cable_channel_width/2 <
       base_width/2-base_corner_radius,
       "Shared rear opening must stay within the straight back edge");
assert(shared_cable_mouth_round > 0 && 2*shared_cable_mouth_round < base_thickness);
assert(shared_cable_hole_radius > 0 && 2*shared_cable_hole_radius <
       min(shared_cable_hole_width,shared_cable_hole_depth));
assert(shared_cable_channel_width > shared_cable_center_spacing+cable_diameter);
assert(shared_cable_center_spacing > cable_diameter && underside_channel_depth > cable_diameter,
       "Illustrative cords must clear each other, the bed and the tunnel roof");
assert(mast_height > mast_peg_height + saddle_flare_height + 20);
assert(socket_outside_width < base_width - 16);
assert(saddle_flare_height >= (saddle_width - mast_shaft_width) / 2);
assert(headphone_inner_gap < headphone_width);
assert(card_finger_drop < card_pocket_height - 5);
assert(sculpt_blend_width > sculpt_crest_size);
assert(!side_layout || side_shared_ridge_width > 2*sculpt_crest_size,
       "The shared pocket join needs a positive span between the two crests");
assert(sculpt_grid_pitch > 0 && sculpt_base_edge_height > 0);
assert(sculpt_socket_rim_exposure > 0 && sculpt_socket_rim_exposure < 1);
assert(!side_layout || mast_y-mast_peg_depth/2-2 > card_inside_rear+sculpt_crest_size,
       "Holder-to-mound transition must finish behind the pocket rear crests.");
assert(!side_layout || mast_y-socket_outside_depth/2 > card_inside_rear,
       "The socket mound needs a positive front blend beyond the pocket cavities");
assert(sculpt_rear_rise > 0 && sculpt_socket_blend_width > 0);
assert(sculpt_cable_deck_margin > shared_cable_mouth_round+sculpt_grid_pitch,
       "Keep the complete rounded cable mouth inside the flat 8 mm deck");
assert(sculpt_cable_recess_blend > 0 && sculpt_cable_path_step > 0);

assert(mast_socket_floor_relief > 0 && mast_collar_z > mast_tip_leadin_height);
assert(mast_tip_leadin_per_side > 0 && mast_tip_leadin_per_side < mast_peg_depth/4);
assert(len(mast_fastener_shaft_fractions)==3);
assert(min(mast_fastener_shaft_fractions)>0.08 && max(mast_fastener_shaft_fractions)<0.92,
       "Keep fasteners in the constant-width shaft, clear of collar and saddle");
assert(mast_fastener_z[1]-mast_fastener_z[0]>15 && mast_fastener_z[2]-mast_fastener_z[1]>15);
assert(mast_bore_diameter > mast_screw_diameter && mast_bore_diameter < mast_head_pocket_diameter);
assert(mast_head_pocket_diameter > mast_screw_head_diameter);
assert(mast_nut_pocket_across_flats > mast_nut_across_flats);
assert(mast_head_pocket_depth > mast_screw_head_height && mast_nut_pocket_depth > mast_nut_height);
assert(mast_head_pocket_depth > 2 && mast_nut_pocket_depth > 2,
       "Bearing floors must lie inboard of the shaft's2 mm corner radius");
assert(mast_fastener_grip > 12 && mast_pocket_bearing_wall >= 1.5,
       "Retain bearing material around pockets; recalibrate if dimensions change");
assert(mast_thread_projection >= 0.3 && mast_screw_tip_x <= mast_shaft_width/2-0.3,
       "Choose screw length for full nut engagement and a recessed tip");

assert(saddle_channel_clearance_per_side > 0 && saddle_lip_height > 0);
assert(saddle_contact_width < saddle_width && saddle_contact_width > mast_shaft_width);
assert(saddle_cap_depth > saddle_cap_height && saddle_cap_depth < saddle_flare_height);
assert(saddle_outline_radius > 0 && saddle_outline_radius < saddle_lip_blend_width);
assert(saddle_grid_pitch > 0 && saddle_lip_blend_width >= 2*saddle_edge_roll_width);
assert(saddle_edge_roll_height > 0 && saddle_edge_roll_height < saddle_lip_height);
assert(saddle_outer_depth < headphone_depth && saddle_lip_height < headband_thickness,
       "Rounded lips must remain inside the illustrative loaded envelope");

module rounded_rectangle(w, d, r = 2) {
    offset(r = r) square([w - 2*r, d - 2*r], center = true);
}

// A small top bevel leaves a flat, stable bottom and softens touched rims.
module rim_prism(w, d, h, r = 1, bevel = 0.6) {
    union() {
        linear_extrude(height = h - bevel) rounded_rectangle(w,d,r);
        hull() {
            translate([0,0,h-bevel-eps]) linear_extrude(eps)
                rounded_rectangle(w,d,r);
            translate([0,0,h-eps]) linear_extrude(eps)
                rounded_rectangle(w-2*bevel,d-2*bevel,max(0.2,r-bevel));
        }
    }
}

// One clipped corner makes the sliding mast key directional, without snap tabs.
module key_profile(w, d, corner = 2) {
    polygon([[-w/2,-d/2],[w/2,-d/2],[w/2,d/2],[-w/2+corner,d/2],[-w/2,d/2-corner]]);
}

module rear_mini_cradle(clearance = legacy_cradle_clearance_per_side, height = cradle_rail_height) {
    iw = legacy_mini_width + 2*clearance;
    id = legacy_mini_depth + 2*clearance;
    difference() {
        union() {
            for (side = [-1,1]) {
                translate([side*(iw+wall)/2,wall+(id+wall_join_step)/2,0])
                    rim_prism(wall,id+wall_join_step,height,1);
                translate([side*(iw/2-5),wall/2,0]) rim_prism(10,wall,5,1);
            }
        }
        for (side = [-1,1])
            translate([side*(iw+wall)/2, wall+id/2,cradle_side_window_sill])
                linear_extrude(height+eps)
                    rounded_rectangle(wall+2, id-2*cradle_side_window_end,1);
    }
}

module card_frame() {
    translate([card_center_x,card_center_y,0]) children();
}

module rear_card_walls() {
    card_frame()
    difference() {
        translate([0,0,base_thickness-eps])
            rim_prism(card_inside_width+2*wall,card_inside_depth+2*wall,
                      card_pocket_height+eps,2);
        translate([0,0,base_thickness-eps])
            linear_extrude(card_pocket_height+2*eps)
                rounded_rectangle(card_inside_width,card_inside_depth,0.8);
        translate([0,-(card_inside_depth+wall)/2,base_thickness+card_pocket_height+3])
            rotate([90,0,0]) cylinder(h=wall+2,r=card_finger_width/2,center=true);
        for (side=[-1,1])
            translate([side*(card_inside_width+wall)/2-(wall+2)/2,
                       -card_inside_depth/2+2,
                       base_thickness+card_pocket_height-card_finger_drop])
                cube([wall+2,card_inside_depth-4,card_finger_drop+eps],center=false);
    }
}

module socket_housing(clearance = socket_clearance_per_side, height = mast_peg_height) {
    difference() {
        rim_prism(mast_peg_width+2*clearance+2*wall,
                  mast_peg_depth+2*clearance+2*wall,height,2);
        translate([0,0,-eps]) linear_extrude(height+2*eps)
            offset(delta=clearance) key_profile(mast_peg_width,mast_peg_depth);
    }
}

function rounded_distance(x,y,w,d,r) = let(
    qx=abs(x)-(w/2-r),qy=abs(y)-(d/2-r))
    sqrt(pow(max(qx,0),2)+pow(max(qy,0),2))+min(max(qx,qy),0)-r;
function smooth_unit(t) = (1-cos(180*min(1,max(0,t))))/2;
function soft_max(a,b,k) = a<=0 ? b : b<=0 ? a :
    max(a,b)+pow(max(k-abs(a-b),0),2)/(4*k)*min(1,min(a,b)/k);
function shoulder_height(distance,target,width=sculpt_blend_width) =
    distance<=0 ? target-sculpt_crest_size :
    distance<sculpt_crest_size ? target-sculpt_crest_size+
        sculpt_crest_size*smooth_unit(distance/sculpt_crest_size) :
    distance<width ? target*(1-smooth_unit((distance-sculpt_crest_size)/(width-sculpt_crest_size))) : 0;
function pocket_height_at_y(y,front,back) =
    front+(back-front)*smooth_unit((y-cradle_front)/side_pocket_envelope_depth);
// Horizontal extent of a rounded outline at this Y. Outside its front/back,
// hold the corner-center X so the shoulder's own height can fade to the deck.
function rounded_outline_half_width_at_y(y,w,d,r) = let(
    corner_y=max(0,min(abs(y),d/2)-(d/2-r)))
    w/2-r+sqrt(max(0,r*r-corner_y*corner_y));
function shared_pocket_join_height(x,y) = let(
    crest=sculpt_crest_size,
    card_crest_x=card_center_x+rounded_outline_half_width_at_y(y-card_center_y,
        card_inside_width+2*crest,card_inside_depth+2*crest,0.8+crest),
    mini_crest_x=mini_center_x-rounded_outline_half_width_at_y(y-mini_center_y,
        side_mini_shoulder_width+2*crest,side_pocket_envelope_depth+2*crest,
        side_mini_shoulder_corner_radius+crest),
    card_crest_height=shoulder_height(rounded_distance(card_crest_x-card_center_x,
        y-card_center_y,card_inside_width,card_inside_depth,0.8),
        pocket_height_at_y(y,side_card_front_height,side_card_back_height)),
    mini_crest_height=shoulder_height(rounded_distance(mini_crest_x-mini_center_x,
        y-mini_center_y,side_mini_shoulder_width,side_pocket_envelope_depth,
        side_mini_shoulder_corner_radius),
        pocket_height_at_y(y,mini_tray_front_height,mini_tray_back_height)),
    across=smooth_unit((x-card_crest_x)/(mini_crest_x-card_crest_x)))
    x<card_crest_x || x>mini_crest_x ? 0 :
    card_crest_height+(mini_crest_height-card_crest_height)*across;
// The unchanged outer height field extends inward to the smaller selected cut.
// Its filled inner band meets the original shoulder continuously, with no lip
// projecting into the vertical fit cavity or straight-up removal path.
function pocket_and_mound_height(x,y) = let(
    dc=rounded_distance(x-card_center_x,y-card_center_y,card_inside_width,card_inside_depth,0.8),
    dm=rounded_distance(x-mini_center_x,y-mini_center_y,side_mini_shoulder_width,side_pocket_envelope_depth,
                        side_mini_shoulder_corner_radius),
    ds=rounded_distance(x-mast_x,y-mast_y,socket_outside_width,socket_outside_depth,2),
    hc=shoulder_height(dc,pocket_height_at_y(y,side_card_front_height,side_card_back_height)),
    hm=shoulder_height(dm,pocket_height_at_y(y,mini_tray_front_height,mini_tray_back_height)),
    // Leave only the bearing rim exposed. The original housing still supplies
    // its exact keyed slot, flat collar seat and small outer top bevel.
    socket_front_fade=smooth_unit((y-card_inside_rear)/
        (mast_y-socket_outside_depth/2-card_inside_rear)),
    hs=(mast_peg_height-eps-sculpt_socket_rim_exposure)*
        (1-smooth_unit(max(0,ds)/sculpt_socket_blend_width))*socket_front_fade,
    rear_t=min(1,max(0,(y-card_inside_rear)/(base_depth-card_inside_rear))),
    rear_side_fade=max(0,cos(90*min(1,abs(x)/(base_width/2)))),
    rear_landscape=sculpt_rear_rise*sin(180*rear_t)*rear_side_fade,
    // Keep the working cable passage on its original 8 mm deck, inside a
    // rounded recess. Its mouth and coupon stay unchanged; the landscape rises
    // smoothly outside this small functional region instead of capping the hole.
    cable_deck_distance=rounded_distance(x-shared_cable_hole_center[0],
        y-shared_cable_hole_center[1],
        shared_cable_hole_width+2*sculpt_cable_deck_margin,
        shared_cable_hole_depth+2*sculpt_cable_deck_margin,
        shared_cable_hole_radius+sculpt_cable_deck_margin),
    cable_recess_fade=smooth_unit(max(0,cable_deck_distance)/sculpt_cable_recess_blend),
    landscape=soft_max(rear_landscape,hs,sculpt_union_blend)*cable_recess_fade,
    // Fill the valley between the existing crests with a continuous descending
    // shoulder. Corner-following endpoints and the original front/back fade keep
    // the join within Y0..61.6. Only add material; exact cavities are cut later.
    pockets=max(soft_max(hc,hm,sculpt_union_blend),shared_pocket_join_height(x,y)))
    soft_max(pockets,landscape,sculpt_union_blend);

// Fill the fore-aft valley with a continuous transition from both rear crests
// into the socket mound. The lateral fade stays inside the headphone gap and
// ends before the cable recess. Inside the collar footprint the bridge reaches
// the original mound at its front edge, below the exact bearing plane.
function holder_mound_join_height(x,y) = let(
    start_y=card_inside_rear+sculpt_crest_size,
    collar_half_width=mast_peg_width/2+2,
    collar_front=mast_y-mast_peg_depth/2-2,
    mound_front=mast_y-socket_outside_depth/2+2,
    end_y=collar_front+(mound_front-collar_front)*
        smooth_unit((abs(x-mast_x)-collar_half_width)/4),
    original=pocket_and_mound_height(x,y),
    left_fade=smooth_unit((x-mast_x+50)/15),
    right_fade=1-smooth_unit((x-mast_x-18)/6),
    along=min(1,max(0,(y-start_y)/(end_y-start_y))),
    across=smooth_unit(along),
    start_height=pocket_and_mound_height(x,start_y),
    end_height=pocket_and_mound_height(x,end_y),
    bridge=start_height+(end_height-start_height)*across,
    // Ease the intersection with a rising mound too, rather than moving the
    // former crease to where the interpolated ramp meets the original surface.
    merge_width=sculpt_union_blend*pow(sin(180*along),2),
    joined=merge_width>0.000001 ? soft_max(original,bridge,merge_width) : max(original,bridge))
    y<start_y || y>end_y ? original :
        original+left_fade*right_fade*(joined-original);

function sculpt_height(x,y) = let(
    edge=max(0,-rounded_distance(x,y-base_depth/2,base_width,base_depth,base_corner_radius)),
    edge_t=min(1,edge/sculpt_blend_width),
    foundation=sculpt_base_edge_height+(base_thickness-sculpt_base_edge_height)*
        sqrt(max(0,1-pow(1-edge_t,2))),
    raised=holder_mound_join_height(x,y))
    foundation+raised*smooth_unit(edge/4);

function surface_cable_point(point) = let(
    // Reserve the complete cord radius around steep recess slopes, not merely
    // clearance vertically above its centerline. Actual bend stiffness is unknown.
    surface_peak=max(concat([sculpt_height(point[0],point[1])],
        [for(r=[cable_diameter/4,cable_diameter/2],a=[0:15:345])
            sculpt_height(point[0]+r*cos(a),point[1]+r*sin(a))])))
    [point[0],point[1],max(shared_cable_exit_height,
        surface_peak+cable_diameter/2+sculpt_cable_surface_clearance)];
function surface_cable_path(points) = concat(
    [for(i=[0:len(points)-2]) let(
        steps=max(1,ceil(norm(points[i+1]-points[i])/sculpt_cable_path_step)))
        for(j=[0:steps-1]) surface_cable_point(points[i]+(points[i+1]-points[i])*j/steps)],
    [surface_cable_point(points[len(points)-1])]);

module sculpted_blank() {
    // The grid extends past the final outline so clipping never coincides with
    // its boundary vertices; this prevents float-collapsed STL triangles.
    margin=0.05;
    nx=ceil((base_width+2*margin)/sculpt_grid_pitch);
    ny=ceil((base_depth+2*margin)/sculpt_grid_pitch);
    nt=(nx+1)*(ny+1);
    top=[for(j=[0:ny],i=[0:nx]) let(
        x=-base_width/2-margin+(base_width+2*margin)*i/nx,
        y=-margin+(base_depth+2*margin)*j/ny)
        [x,y,sculpt_height(x,y)]];
    boundary=concat([for(i=[0:nx-1]) i],
                    [for(j=[0:ny-1]) j*(nx+1)+nx],
                    [for(i=[nx:-1:1]) ny*(nx+1)+i],
                    [for(j=[ny:-1:1]) j*(nx+1)]);
    nb=len(boundary);
    points=concat(top,[for(i=boundary) [top[i][0],top[i][1],0]],[[0,base_depth/2,0]]);
    faces=concat(
        [for(j=[0:ny-1],i=[0:nx-1]) let(a=j*(nx+1)+i,b=a+1,c=a+nx+1,d=c+1)
            each [[a,c,b],[b,c,d]]],
        [for(i=[0:nb-1]) let(j=(i+1)%nb,a=nt+i,b=nt+j,c=boundary[j],d=boundary[i])
            each [[a,c,b],[a,d,c],[a,b,nt+nb]]]);
    intersection() {
        polyhedron(points=points,faces=faces,convexity=10);
        translate([0,base_depth/2,-eps]) linear_extrude(base_thickness+card_pocket_height+mast_peg_height)
            rounded_rectangle(base_width,base_depth,base_corner_radius);
    }
}

module sculpted_base_body() {
    difference() {
        union() {
            sculpted_blank();
            translate([mast_x,mast_y,base_thickness-eps]) socket_housing();
        }
        // Fit-critical cuts happen AFTER exterior blending. The complete usable
        // cavity stays exact; no smoothing or inward fillet consumes clearance.
        translate([card_center_x,card_center_y,base_thickness]) linear_extrude(card_pocket_height+30)
            rounded_rectangle(card_inside_width,card_inside_depth,0.8);
        translate([mini_center_x,mini_center_y,base_thickness]) linear_extrude(card_pocket_height+30)
            rounded_rectangle(cradle_inside_width,cradle_inside_depth,
                              mini_inside_corner_radius);
        translate([mast_x,mast_y,base_thickness]) linear_extrude(mast_peg_height+eps)
            offset(delta=socket_clearance_per_side) key_profile(mast_peg_width,mast_peg_depth);
    }
}

module shared_cable_throat() {
    // Constant 24 x 18 mm throat, with sampled 1 mm quarter-round mouths.
    // The dimensions are a provisional plug-passage experiment, not measured fit.
    translate([0,0,-eps]) linear_extrude(base_thickness+2*eps)
        rounded_rectangle(shared_cable_hole_width,shared_cable_hole_depth,
                          shared_cable_hole_radius);
    steps = 8;
    for(end=[0,1],i=[0:steps-1]) hull() {
        for(j=[i,i+1]) {
            angle = 90*j/steps;
            expansion = shared_cable_mouth_round*(1-cos(angle));
            from_surface = shared_cable_mouth_round*(1-sin(angle));
            z = end==0 ? from_surface : base_thickness-from_surface;
            translate([0,0,z-eps/2]) linear_extrude(eps)
                rounded_rectangle(shared_cable_hole_width+2*expansion,
                                  shared_cable_hole_depth+2*expansion,
                                  shared_cable_hole_radius+expansion);
        }
    }
}

module shared_cable_route_cut(rear_y,relief_height=base_thickness) {
    shared_cable_throat();
    // One rear-entry tunnel. Its flat 12 mm roof is an intentional bridge.
    translate([-shared_cable_channel_width/2,0,-eps])
        cube([shared_cable_channel_width,rear_y+eps,underside_channel_depth+eps]);
    // Stop the complete roof before the rounded back edge becomes thin.
    translate([-shared_cable_channel_width/2-eps,rear_y-shared_cable_rear_relief,-eps])
        cube([shared_cable_channel_width+2*eps,shared_cable_rear_relief+2*eps,
              relief_height+2*eps]);
}

module shared_cable_test() {
    // Reproduce the actual throat, mouth, 8 mm deck, tunnel junction and rear
    // relief in print orientation. The 12 mm bridge needs slicer/physical testing.
    difference() {
        translate([0,(shared_cable_test_front+shared_cable_test_rear)/2,0])
            linear_extrude(base_thickness)
                rounded_rectangle(shared_cable_test_width,
                                  shared_cable_test_rear-shared_cable_test_front,3);
        shared_cable_route_cut(shared_cable_test_rear);
    }
}

module base() {
    difference() {
        if(side_layout) sculpted_base_body(); else
        union() {
            translate([0,base_depth/2,0])
                rim_prism(base_width,base_depth,base_thickness,base_corner_radius);
            translate([mini_center_x,0,base_thickness-eps]) rear_mini_cradle();
            rear_card_walls();
            translate([mast_x,mast_y,base_thickness-eps]) socket_housing();
        }
        if(side_layout)
            translate([shared_cable_hole_center[0],shared_cable_hole_center[1],0])
                shared_cable_route_cut(base_depth-shared_cable_hole_center[1],
                                       base_thickness+card_pocket_height+mast_peg_height);
        else {
            // Preserve the earlier rear-comparison routing, independently of the
            // single shared route now used by the side-layout station.
            for(side=[-1,1])
                translate([side*channel_x,base_depth/2,underside_channel_depth/2-eps])
                    cube([underside_channel_width,base_depth+2,underside_channel_depth+2*eps],center=true);
            translate([0,0,-eps]) linear_extrude(base_thickness+2*eps)
                hull() {
                    translate([headphone_connector_x,saddle_y]) circle(d=headphone_route_width);
                    translate([headphone_connector_x,base_depth+headphone_route_width])
                        circle(d=headphone_route_width);
                }
        }
    }
}

// Match the original polygonal crown seat exactly at its center and angular
// stations; the nominal reference headband is also polygonal, not a true circle.
function saddle_crown_z(x) = let(
    angle_step=360/$fn,
    index=floor(asin(abs(x)/saddle_crown_radius)/angle_step),
    a=index*angle_step,b=(index+1)*angle_step,
    xa=saddle_crown_radius*sin(a),xb=saddle_crown_radius*sin(b),
    za=saddle_crown_radius*cos(a),zb=saddle_crown_radius*cos(b))
    mast_print_height-saddle_crown_radius+za+(zb-za)*(abs(x)-xa)/(xb-xa);
function saddle_top_z(x,y) = let(
    lip_t=(abs(y)-saddle_channel_depth/2)/saddle_lip_blend_width,
    lip=lip_t>0 && lip_t<1 ? saddle_lip_height*pow(sin(180*lip_t),2) : 0,
    edge=max(0,-rounded_distance(x,y,saddle_contact_width,saddle_outer_depth,saddle_outline_radius)),
    roll=saddle_edge_roll_height*(1-smooth_unit(edge/saddle_edge_roll_width)))
    saddle_crown_z(x)+lip-roll;

module rounded_saddle() {
    // A continuous sampled crown, lip and edge-roll surface. Exact clear-channel
    // width is independent from exterior shaping; no lip material enters it.
    nx=2*ceil(saddle_contact_width/(2*saddle_grid_pitch));
    // Pin rows to both channel edges and lip crests even after fit parameters
    // change, so triangulation cannot interpolate a lip into the clear channel.
    nl=2*ceil(saddle_lip_blend_width/(2*saddle_grid_pitch));
    nc=2*ceil(saddle_channel_depth/(2*saddle_grid_pitch));
    ys=concat([for(j=[0:nl-1]) -saddle_outer_depth/2+saddle_lip_blend_width*j/nl],
              [for(j=[0:nc-1]) -saddle_channel_depth/2+saddle_channel_depth*j/nc],
              [for(j=[0:nl]) saddle_channel_depth/2+saddle_lip_blend_width*j/nl]);
    ny=len(ys)-1;
    nt=(nx+1)*(ny+1);
    floor_z=mast_shaft_top_z-eps;
    top=[for(j=[0:ny],i=[0:nx]) let(
        x=-saddle_contact_width/2+saddle_contact_width*i/nx,
        y=ys[j])
        [x,y,saddle_top_z(x,y)]];
    boundary=concat([for(i=[0:nx-1]) i],
                    [for(j=[0:ny-1]) j*(nx+1)+nx],
                    [for(i=[nx:-1:1]) ny*(nx+1)+i],
                    [for(j=[ny:-1:1]) j*(nx+1)]);
    nb=len(boundary);
    points=concat(top,[for(i=boundary) [top[i][0],top[i][1],floor_z]],[[0,0,floor_z]]);
    faces=concat(
        [for(j=[0:ny-1],i=[0:nx-1]) let(a=j*(nx+1)+i,b=a+1,c=a+nx+1,d=c+1)
            each [[a,c,b],[b,c,d]]],
        [for(i=[0:nb-1]) let(j=(i+1)%nb,a=nt+i,b=nt+j,c=boundary[j],d=boundary[i])
            each [[a,c,b],[a,d,c],[a,b,nt+nb]]]);
    translate([0,-mast_forward_offset,0]) intersection() {
        polyhedron(points=points,faces=faces,convexity=10);
        translate([0,0,floor_z-eps]) linear_extrude(mast_geometry_height-floor_z+2*eps)
            rounded_rectangle(saddle_contact_width,saddle_outer_depth,saddle_outline_radius);
        union() {
            hull() {
                // Join the shaft's terminal flat face exactly. Overlapping its
                // leaning side planes creates ill-conditioned thin triangles.
                translate([0,0,mast_shaft_top_z+2]) linear_extrude(eps)
                    rounded_rectangle(mast_shaft_width,mast_shaft_depth,2);
                translate([0,0,mast_print_height-saddle_cap_depth]) linear_extrude(eps)
                    rounded_rectangle(saddle_width,saddle_outer_depth,saddle_outline_radius);
            }
            translate([0,0,mast_print_height-saddle_cap_depth-eps])
                linear_extrude(saddle_cap_depth+saddle_lip_height+2*eps)
                    rounded_rectangle(saddle_width,saddle_outer_depth,saddle_outline_radius);
        }
    }
}

// Body in upright local coordinates; mast() subtracts the shared screw cuts.
module mast_body() {
    union() {
        // A short inward lead-in helps insertion without consuming the full key.
        hull() {
            linear_extrude(eps) offset(delta=-mast_tip_leadin_per_side)
                key_profile(mast_peg_width,mast_peg_depth);
            translate([0,0,mast_tip_leadin_height]) linear_extrude(eps)
                key_profile(mast_peg_width,mast_peg_depth);
        }
        translate([0,0,mast_tip_leadin_height])
            linear_extrude(mast_collar_z-mast_tip_leadin_height+eps)
                key_profile(mast_peg_width,mast_peg_depth);
        translate([0,0,mast_collar_z])
            rim_prism(mast_peg_width+4,mast_peg_depth+4,4,1.4);
        hull() {
            translate([0,0,mast_shaft_start_z]) linear_extrude(2)
                rounded_rectangle(mast_shaft_width,mast_shaft_depth,2);
            translate([0,-mast_forward_offset,mast_shaft_top_z]) linear_extrude(2)
                rounded_rectangle(mast_shaft_width,mast_shaft_depth,2);
        }
        rounded_saddle();
    }
}

module mast_fastener_cuts() {
    for(z=mast_fastener_z) translate([0,mast_shaft_center_y(z),z]) {
        translate([-mast_shaft_width/2-eps,0,0]) rotate([0,90,0])
            cylinder(d=mast_bore_diameter,h=mast_shaft_width+2*eps);
        translate([-mast_shaft_width/2-eps,0,0]) rotate([0,90,0])
            cylinder(d=mast_head_pocket_diameter,h=mast_head_pocket_depth+eps);
        // Hex flats are parallel to the narrow shaft's Y sides.
        translate([mast_nut_bearing_x,0,0]) rotate([0,90,0])
            cylinder(d=mast_nut_pocket_across_flats/cos(30),
                     h=mast_nut_pocket_depth+eps,$fn=6);
    }
}

module mast() {
    difference() { mast_body(); mast_fastener_cuts(); }
}

module mast_half(side, height=mast_geometry_height) {
    // Exactly coincident mating faces at X=0; no seam gap or glue allowance.
    intersection() {
        mast();
        translate([side<0 ? -saddle_width : 0,-abs(mast_forward_offset)-saddle_outer_depth,-eps])
            cube([saddle_width,2*abs(mast_forward_offset)+2*saddle_outer_depth,height+eps]);
    }
}

module mast_half_print(side, height=mast_geometry_height) {
    // Left: (x,y,z)->(z,y+offset,-x); right: (height-z,y+offset,x).
    // Both hard mating faces lie on the bed; bores open vertically upward.
    translate([side<0 ? 0 : height,mast_flat_y_offset,0])
        rotate([0,side<0 ? 90 : -90,0]) mast_half(side,height);
}

module saddle_test_print(side) {
    // Crop the actual mast below its upper screw; join this pair with one of the
    // same M3x20 screws and nuts. Seat/lips and print orientation are identical.
    translate([side<0 ? -saddle_test_bottom_z : mast_geometry_height,saddle_test_y_offset,0])
        rotate([0,side<0 ? 90 : -90,0]) intersection() {
            mast_half(side);
            translate([-saddle_width,-abs(mast_forward_offset)-saddle_outer_depth,saddle_test_bottom_z])
                cube([2*saddle_width,2*abs(mast_forward_offset)+2*saddle_outer_depth,saddle_test_height+eps]);
        }
}

module saddle_removal_interference() {
    // Sweep each polygonal reference-headband segment independently upward;
    // hulling the whole arc would incorrectly fill the space below the headband.
    // Start0.02 mm above contact to omit the intended crown-seat tangent.
    intersection() {
        installed_mast();
        translate([mast_x,saddle_y,headphone_top-headphone_width/2]) rotate([90,0,0])
            linear_extrude(headband_depth,center=true) union() {
                for(i=[0:$fn/2-1]) let(a=i*360/$fn,b=(i+1)*360/$fn)
                    hull() {
                        for(lift=[eps,headband_thickness+saddle_lip_height+eps])
                            translate([0,lift]) polygon([
                                [(headphone_width/2-headband_thickness)*cos(a),(headphone_width/2-headband_thickness)*sin(a)],
                                [headphone_width/2*cos(a),headphone_width/2*sin(a)],
                                [headphone_width/2*cos(b),headphone_width/2*sin(b)],
                                [(headphone_width/2-headband_thickness)*cos(b),(headphone_width/2-headband_thickness)*sin(b)]]);
                    }
            }
    }
}

module installed_mast() {
    translate([mast_x,mast_y,mast_assembly_z]) mast();
}

module mast_fasteners() {
    // Smooth nominal hardware envelopes, not thread/drive models or print parts.
    for(z=mast_fastener_z) translate([0,mast_shaft_center_y(z),z]) {
        translate([mast_head_bearing_x,0,0]) rotate([0,90,0])
            cylinder(d=mast_screw_diameter,h=mast_screw_length);
        translate([mast_head_bearing_x-mast_screw_head_height,0,0]) rotate([0,90,0])
            cylinder(d=mast_screw_head_diameter,h=mast_screw_head_height);
        translate([mast_nut_bearing_x,0,0]) rotate([0,90,0])
            difference() {
                cylinder(d=mast_nut_across_flats/cos(30),h=mast_nut_height,$fn=6);
                translate([0,0,-eps]) cylinder(d=mast_screw_diameter,h=mast_nut_height+2*eps);
            }
    }
}

module full_socket_test() {
    // Three full-depth sockets with the actual closed floor and top seating datum.
    // Mate with the bolted mast_joint_test halves; these do not prove mast strength.
    for(i=[0:len(socket_coupon_clearances)-1]) {
        c=socket_coupon_clearances[i];
        translate([i*44,0,0]) union() {
            rim_prism(40,29,3,2);
            translate([0,3,3-eps]) socket_housing(c,mast_peg_height);
            translate([0,-11,3]) linear_extrude(0.4)
                text(str(c),size=3,halign="center");
        }
    }
}

module reference_mini() {
    translate([mini_center_x,mini_center_y,base_thickness])
        linear_extrude(mini_height)
            rounded_rectangle(mini_width,mini_depth,mini_corner_radius);
}

module reference_cards() {
    // The front-positioned loose stack is an illustrative pose, not a divider.
    translate([card_center_x,card_stack_center_y,base_thickness])
        linear_extrude(card_standing_height)
            rounded_rectangle(card_face_span,card_stack_thickness,0.6);
}

module reference_headphones() {
    cup_w = (headphone_width-headphone_inner_gap)/2;
    cup_h = headphone_cup_height;
    arch_center_z = headphone_top-headphone_width/2;
    // An envelope illustration, not a hardware scan or fit-accurate headband.
    union() {
        for(side=[-1,1])
            translate([mast_x+side*(headphone_inner_gap/2+cup_w/2),saddle_y,headphone_bottom])
                linear_extrude(cup_h)
                    rounded_rectangle(cup_w,headphone_depth,min(8,cup_w/2-0.1));
        translate([mast_x,saddle_y,arch_center_z]) rotate([90,0,0])
            linear_extrude(headband_depth,center=true)
                difference() {
                    intersection() {
                        circle(r=headphone_width/2);
                        translate([-headphone_width/2,0]) square([headphone_width,headphone_width/2]);
                    }
                    circle(r=headphone_width/2-headband_thickness);
                }
        for(side=[-1,1])
            translate([mast_x+side*(headphone_width/2-headband_thickness/2),saddle_y,
                       headphone_bottom+cup_h-2])
                linear_extrude(arch_center_z-(headphone_bottom+cup_h)+3)
                    rounded_rectangle(headband_thickness,headband_depth,2);
    }
}

module reference_cable_path(points) {
    // Swept round envelope; junctions are rounded, but no bend rating is implied.
    // Omit collinear sample stations so coincident cylinder caps cannot leave
    // duplicate coplanar STL triangles along the flat sections of the route.
    path = [for(i=[0:len(points)-1]) if(i==0 || i==len(points)-1 ||
        norm(cross(points[i]-points[i-1],points[i+1]-points[i]))>0.000001) points[i]];
    for(point=path) translate(point) sphere(d=cable_diameter,$fn=32);
    for(i=[0:len(path)-2]) {
        direction = path[i+1]-path[i];
        length = norm(direction);
        is_vertical = direction[0]==0 && direction[1]==0;
        axis = is_vertical ? [1,0,0] : [-direction[1],direction[0],0];
        translate(path[i]) rotate(a=acos(direction[2]/length),v=axis)
            cylinder(d=cable_diameter,h=length,$fn=32);
    }
}

module reference_mini_cable() {
    // Existing 18 x 10 x 7 mm reservation plus an assumed downward elbow.
    // The real right-angle plug's dimensions and rotational pose are unknown.
    translate([mini_port_x+mini_port_side*mini_connector_projection/2,mini_port_y,mini_port_z])
        cube([mini_connector_projection,10,7],center=true);
    if(side_layout) {
        translate([mini_elbow_cable_x,mini_port_y,(mini_port_z+mini_elbow_bottom_z)/2])
            cube([8,10,mini_port_z-mini_elbow_bottom_z],center=true);
        reference_cable_path(concat([
            [shared_mini_x,headphone_route_end_y,headphone_route_z],
            [shared_mini_x,shared_cable_hole_center[1],headphone_route_z]
        ],surface_cable_path([
            [shared_mini_x,shared_cable_hole_center[1]],
            [mini_elbow_cable_x,shared_cable_hole_center[1]],
            [mini_elbow_cable_x,mini_port_y]
        ]),[
            [mini_elbow_cable_x,mini_port_y,mini_elbow_bottom_z]
        ]));
    } else
        translate([mini_port_x+mini_port_side*(mini_connector_projection+cable_bend_allowance/2),mini_port_y,mini_port_z])
            cube([cable_bend_allowance,cable_diameter,cable_diameter],center=true);
}

module reference_headphone_cable() {
    // Assumed connection at the left cup. Right-angle hardware is confirmed;
    // this forward-facing elbow's size, location and pose are still placeholders.
    if(side_layout) {
        translate([headphone_connector_x,saddle_y,
                   (headphone_bottom+headphone_elbow_cable_z)/2])
            cube([8,7,headphone_bottom-headphone_elbow_cable_z],center=true);
        translate([headphone_connector_x,(saddle_y+headphone_elbow_cable_y)/2,
                   headphone_elbow_cable_z])
            cube([8,saddle_y-headphone_elbow_cable_y+7,7],center=true);
        reference_cable_path(concat([
            [shared_headphone_x,headphone_route_end_y,headphone_route_z],
            [shared_headphone_x,shared_cable_hole_center[1],headphone_route_z]
        ],surface_cable_path([
            [shared_headphone_x,shared_cable_hole_center[1]],
            [shared_headphone_x,shared_headphone_route_behind_socket],
            [headphone_connector_x,shared_headphone_route_behind_socket],
            [headphone_connector_x,headphone_elbow_cable_y]
        ]),[
            [headphone_connector_x,headphone_elbow_cable_y,headphone_elbow_cable_z]
        ]));
    } else {
        translate([headphone_connector_x,saddle_y,headphone_bottom-headphone_connector_projection/2])
            cube([8,7,headphone_connector_projection],center=true);
        translate([headphone_connector_x,saddle_y,
                  (headphone_bottom-headphone_connector_projection+headphone_route_z)/2])
            cylinder(d=cable_diameter,
                     h=headphone_bottom-headphone_connector_projection-headphone_route_z,center=true);
        hull() {
            translate([headphone_connector_x,saddle_y,headphone_route_z]) sphere(d=cable_diameter,$fn=24);
            translate([headphone_connector_x,headphone_route_end_y,headphone_route_z])
                sphere(d=cable_diameter,$fn=24);
        }
    }
}

module reference_cables() { reference_mini_cable(); reference_headphone_cable(); }

module reference_component(index) {
    if(index==0) reference_mini();
    else if(index==1) reference_cards();
    else if(index==2) reference_headphones();
    else if(index==3) reference_mini_cable();
    else if(index==4) reference_headphone_cable();
}

module reference_interference() {
    // Exclude only each connector's deliberate end-face contact with its owner.
    // Cross-device cable collisions (including Mini cable vs earcups) are checked.
    for(i=[0:3],j=[i+1:4])
        if(!(i==0 && j==3) && !(i==2 && j==4))
            intersection() { reference_component(i); reference_component(j); }
}

module cradle_test() {
    // Three shallow full-width gauges; test jacket, without force or compression.
    for(i=[0:len(coupon_clearances)-1]) {
        c=coupon_clearances[i];
        iw=legacy_mini_width+2*c;
        translate([0,i*24,0]) union() {
            translate([0,0,0]) rim_prism(iw+2*wall,19,3,2);
            for(side=[-1,1])
                translate([side*(iw+wall)/2,0,3-eps]) rim_prism(wall,19,10,1);
            translate([0,-6,3]) linear_extrude(0.4)
                text(str(c),size=4,halign="center");
        }
    }
}

// Pure library access for isolated fit trials; `use` does not import globals.
// [measured width/depth, provisional body radius, floor/wall heights, wall
// thickness, tab width/depth/overlap, spacing]. Preserve historical sample geometry.
function mini_pocket_test_dimensions() = [
    mini_measured_width, mini_measured_depth, mini_test_body_corner_radius,
    mini_test_floor_thickness, mini_test_wall_height, mini_test_wall_thickness,
    mini_test_tab_width, mini_test_tab_depth, mini_test_tab_overlap, mini_test_spacing];

module mini_pocket_test(clearance) {
    inside_width = mini_measured_width+2*clearance;
    inside_depth = mini_measured_depth+2*clearance;
    inside_radius = mini_test_body_corner_radius+clearance;
    outside_width = inside_width+2*mini_test_wall_thickness;
    outside_depth = inside_depth+2*mini_test_wall_thickness;
    total_height = mini_test_floor_thickness+mini_test_wall_height;
    tab_center_y = -outside_depth/2-mini_test_tab_depth/2+mini_test_tab_overlap;
    assert(clearance >= 0 && mini_test_body_corner_radius > 0);
    assert(2*mini_test_body_corner_radius < min(mini_measured_width,mini_measured_depth));
    assert(mini_test_floor_thickness > 0 && mini_test_wall_height > 0);
    assert(mini_test_wall_thickness > 0 && mini_test_tab_overlap > 0);
    assert(mini_test_tab_overlap < mini_test_wall_thickness,
           "The label tab must remain outside the functional cavity");
    union() {
        // Complete closed-width/depth cavity with all four corners. Straight
        // walls and a plain rim: no undercuts, internal lip, taper or bridges.
        difference() {
            linear_extrude(total_height)
                rounded_rectangle(outside_width,outside_depth,
                                  inside_radius+mini_test_wall_thickness);
            translate([0,0,mini_test_floor_thickness])
                linear_extrude(mini_test_wall_height+eps)
                    rounded_rectangle(inside_width,inside_depth,inside_radius);
        }
        translate([0,tab_center_y,0]) {
            linear_extrude(mini_test_floor_thickness)
                rounded_rectangle(mini_test_tab_width,mini_test_tab_depth,2);
            translate([0,1,mini_test_floor_thickness-eps])
                linear_extrude(0.6+eps)
                    text(str(clearance," mm"),size=4,halign="center",valign="bottom");
            translate([0,-4,mini_test_floor_thickness-eps])
                linear_extrude(0.6+eps)
                    text("PER SIDE",size=2.8,halign="center",valign="bottom");
        }
    }
}

module mini_pocket_tests() {
    max_outside_depth = mini_measured_depth+2*max(mini_test_clearances_per_side)+
                        2*mini_test_wall_thickness;
    row_pitch = max_outside_depth+mini_test_tab_depth-mini_test_tab_overlap+mini_test_spacing;
    for(i=[0:len(mini_test_clearances_per_side)-1])
        translate([0,i*row_pitch,0]) mini_pocket_test(mini_test_clearances_per_side[i]);
}

module joint_test() {
    // Three short socket gauges plus one peg: FOUR separate intended pieces.
    for(i=[0:len(socket_coupon_clearances)-1]) {
        c=socket_coupon_clearances[i];
        translate([i*44,0,0]) union() {
            rim_prism(40,29,3,2);
            translate([0,3,3-eps]) socket_housing(c,12);
            translate([0,-11,3]) linear_extrude(0.4)
                text(str(c),size=3,halign="center");
        }
    }
    translate([44,34,0]) union() {
        linear_extrude(12) key_profile(mast_peg_width,mast_peg_depth);
        translate([0,0,12]) rim_prism(34,14,3,1);
    }
}

module card_test() {
    // The varied value is TOTAL stack-depth allowance, not a per-side value.
    // This gauge does not reproduce or size the full-depth side storage bin.
    for(i=[0:len(coupon_clearances)-1]) {
        a=coupon_clearances[i];
        d=card_stack_thickness+a;
        translate([0,i*31,0]) union() {
            rim_prism(card_inside_width+2*wall,d+2*wall,3,2);
            // One subtractive U-profile avoids coincident rounded rail end faces.
            translate([0,0,3-eps]) difference() {
                rim_prism(card_inside_width+2*wall,d+2*wall,12,2);
                translate([-card_inside_width/2,-d/2,-eps])
                    cube([card_inside_width+wall+eps,d,12+2*eps]);
            }
            translate([0,0,3]) linear_extrude(0.4) text(str(a),size=4,halign="center");
        }
    }
}

module info() {
    echo(units="mm",layout=layout,status="ILLUSTRATIVE; NOT PHYSICALLY FIT TESTED");
    echo(mini_measured_section=[mini_measured_width,mini_measured_depth],
         mini_measurement_status="Measured width/depth; W0.1 selected for side base; full-base physical fit unverified",
         mini_test_body_corner_radius=mini_test_body_corner_radius,
         mini_corner_status="PROVISIONAL UNMEASURED; straight profile, no taper");
    echo(mini_test_floor_thickness=mini_test_floor_thickness,
         mini_test_wall_height_above_floor=mini_test_wall_height,
         mini_test_wall_thickness=mini_test_wall_thickness);
    for(c=mini_test_clearances_per_side)
        echo(mini_test_clearance_per_side=c,
             mini_test_inside=[mini_measured_width+2*c,mini_measured_depth+2*c],
             mini_test_inside_radius=mini_test_body_corner_radius+c);
    echo(base_envelope=[base_width,base_depth,
                       base_thickness+max(mast_peg_height,card_pocket_height,
                           side_layout ? max(mini_tray_front_height,mini_tray_back_height) : cradle_rail_height)]);
    echo(mast_upright_envelope_bound=[saddle_contact_width,
         max(mast_peg_depth/2+2,-mast_forward_offset+saddle_outer_depth/2)-
         min(-mast_peg_depth/2-2,-mast_forward_offset-saddle_outer_depth/2),mast_geometry_height]);
    echo(saddle_channel_depth=saddle_channel_depth,
         saddle_channel_clearance_per_side=saddle_channel_clearance_per_side,
         saddle_outer_depth=saddle_outer_depth,saddle_lip_height=saddle_lip_height,
         saddle_contact_width=saddle_contact_width,saddle_lip_blend_width=saddle_lip_blend_width,
         saddle_test_bottom_z=saddle_test_bottom_z,saddle_test_height=saddle_test_height,
         saddle_test_y_offset=saddle_test_y_offset);
    echo(mast_assembly_translation=[mast_x,mast_y,mast_assembly_z]);
    echo(mast_half_print_transform="left: [z,y+offset,-x]; right: [height-z,y+offset,x]",
         mast_flat_y_offset=mast_flat_y_offset,mast_print_height=mast_print_height,
         mast_geometry_height=mast_geometry_height);
    echo(mast_collar_local_z=mast_collar_z,mast_collar_installed_z=mast_collar_z+mast_assembly_z,
         mast_peg_floor_relief=mast_socket_floor_relief,
         mast_tip_leadin=[mast_tip_leadin_height,mast_tip_leadin_per_side]);
    echo(mast_fastener_spec="3x M3x20 DIN912 socket cap + DIN934 M3 full nut;2.5 mm hex driver; no washers",
         mast_fastener_centers=[for(z=mast_fastener_z) [0,mast_shaft_center_y(z),z]],
         mast_screw_length=mast_screw_length,mast_bore_diameter=mast_bore_diameter);
    echo(mast_head_pocket=[mast_head_pocket_diameter,mast_head_pocket_depth],
         mast_nut_pocket=[mast_nut_pocket_across_flats,mast_nut_pocket_depth],
         mast_fastener_grip=mast_fastener_grip,mast_thread_projection=mast_thread_projection,
         mast_pocket_bearing_wall_lower_bound=mast_pocket_bearing_wall,
         mast_joint_test_height=mast_joint_test_height);
    echo(mast_forward_offset=mast_forward_offset);
    echo(saddle_center=[mast_x,saddle_y,base_thickness+mast_height]);
    echo(mini_origin=[mini_center_x,mini_center_y,base_thickness]);
    echo(card_center_xy=[card_center_x,card_center_y],card_standing_height=card_standing_height);
    echo(card_stack_center_xy=[card_center_x,card_stack_center_y],card_stack_pose="illustrative");
    echo(card_bin_inside=[card_inside_width,card_inside_depth,card_pocket_height],
         card_bin_outside_depth=card_inside_depth+2*(side_layout ? sculpt_blend_width : wall),
         mini_cradle_outside_depth=side_layout ? side_pocket_envelope_depth+2*sculpt_blend_width
                                             : cradle_inside_depth+2*wall);
    if(side_layout) {
        echo(card_crest_targets=[side_card_front_height,side_card_back_height],
             mini_crest_targets=[mini_tray_front_height,mini_tray_back_height],
             opening_edge_nominal_drop=sculpt_crest_size,
             mini_inside_corner_radius=mini_inside_corner_radius);
        echo(mini_cavity_inside=[cradle_inside_width,cradle_inside_depth],
             mini_clearance_per_side=[mini_width_clearance_per_side,mini_depth_clearance_per_side],
             mini_shaping_envelope=[side_mini_shoulder_width,side_pocket_envelope_depth,
                                    side_mini_shoulder_corner_radius],
             mini_port_reference=[mini_port_x,mini_port_y,mini_port_z]);
        echo(sculpted_shared_ridge=side_shared_ridge_width,exterior_blend_band=sculpt_blend_width,
             surface_grid_pitch=sculpt_grid_pitch,
             socket_rim_exposure=sculpt_socket_rim_exposure,
             socket_exterior_blend=sculpt_socket_blend_width,rear_landscape_rise=sculpt_rear_rise);
        echo(shared_cable_throat=[shared_cable_hole_width,shared_cable_hole_depth,shared_cable_hole_radius],
             shared_cable_center=shared_cable_hole_center,
             shared_cable_mouth_expansion=shared_cable_mouth_round,
             cable_status="RIGHT-ANGLE PLUGS CONFIRMED; sizes/pose unknown; provisional passage and reference paths");
        echo(shared_cable_channel=[shared_cable_channel_width,underside_channel_depth],
             shared_cable_minimum_roof=shared_cable_minimum_roof_thickness,
             shared_cable_rear_relief=shared_cable_rear_relief,
             shared_cable_cavity_margin=shared_cable_cavity_margin,
             shared_cable_slot_margin=shared_cable_slot_margin,
             cable_deck_height=base_thickness,cable_recess_blend=sculpt_cable_recess_blend);
        echo(assumed_cable_diameter=cable_diameter,
             shared_cable_centers_x=[shared_headphone_x,shared_mini_x],
             shared_cable_center_z=headphone_route_z,
             shared_cable_bed_and_roof_clearance=(underside_channel_depth-cable_diameter)/2);
    }
    echo(headphone_bounds=[[mast_x-headphone_width/2,saddle_y-headphone_depth/2,headphone_bottom],
                           [mast_x+headphone_width/2,saddle_y+headphone_depth/2,headphone_top]]);
    echo(loaded_hypothesis_bounds=[loaded_min,loaded_max]);
    echo(loaded_hypothesis_envelope=loaded_max-loaded_min);
    echo(note="Loaded hypothesis includes modeled connector and cable envelopes; excludes unmodeled slack, actual cup yaw, hand access and stability");
}

info();
if(part=="base") base();
else if(part=="mast") mast();
else if(part=="installed_mast") installed_mast();
else if(part=="mast_left") mast_half_print(-1);
else if(part=="mast_right") mast_half_print(1);
else if(part=="saddle_test_left") saddle_test_print(-1);
else if(part=="saddle_test_right") saddle_test_print(1);
else if(part=="saddle_removal_interference") saddle_removal_interference();
else if(part=="mast_joint_test_left") mast_half_print(-1,mast_joint_test_height);
else if(part=="mast_joint_test_right") mast_half_print(1,mast_joint_test_height);
else if(part=="full_socket_test") full_socket_test();
else if(part=="shared_cable_test") shared_cable_test();
else if(part=="reference_fasteners") translate([mast_x,mast_y,mast_assembly_z]) mast_fasteners();
else if(part=="mast_hardware_interference") intersection() { mast(); mast_fasteners(); }
else if(part=="mast_halves_interference") intersection() { mast_half(-1); mast_half(1); }
else if(part=="cradle_test") cradle_test();
else if(part=="mini_pocket_tests") mini_pocket_tests();
else if(part=="joint_test") joint_test();
else if(part=="card_test") card_test();
else if(part=="reference_mini") reference_mini();
else if(part=="reference_cards") reference_cards();
else if(part=="reference_headphones") reference_headphones();
else if(part=="reference_cables") reference_cables();
else if(part=="reference_mini_cable") reference_mini_cable();
else if(part=="reference_headphone_cable") reference_headphone_cable();
else if(part=="reference_interference") reference_interference();
else if(part=="interference") intersection() {
    base();
    installed_mast();
}
else if(part=="device_interference") intersection() {
    union() { base(); installed_mast(); }
    union() { reference_mini(); reference_cards(); reference_headphones(); reference_cables(); }
}
else if(part=="assembled") {
    color("#c9d7cf") base();
    color("#d99767") installed_mast();
    if(show_references) {
        %color("#efbf43",0.6) reference_mini();
        %color("#edede9",0.6) reference_cards();
        %color("#597e91",0.4) reference_headphones();
        %color("#353535",0.6) reference_cables();
    }
}
else assert(part=="info","Unknown part selector");
