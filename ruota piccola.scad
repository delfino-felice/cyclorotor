include <BOSL2/std.scad>
include <BOSL2/gears.scad>


// ruota piccola //

$fn=100;

// mmtooth=2;
// h=7;
// n=20;
// hole_diameter=2.6;

// or = outer_radius(mmtooth, n);
// echo(or);

// difference() {
//     union() {
//         // ingranaggio
//         spur_gear(circ_pitch=mmtooth, teeth=n, thickness=h, pressure_angle=25);
//         // bordi anti-scappatoia
//         translate([0, 0, h/2+1]) cylinder(r=or+2.5, h=2, center=true);
//         translate([0, 0, -(h/2+1)]) cylinder(r=or+2.5, h=2, center=true);
//     }
//     union() {
//         // albero motore
//         cylinder(r=hole_diameter, h=100, center=true);
//     }
// }

