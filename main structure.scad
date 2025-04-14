include <libraries/BOSL2/std.scad>
include <libraries/BOSL2/gears.scad>

$fn=100;

module servo_gear() {
union() 
import("STL/11_Gripper_gear_v4.stl");
spur_gear(
    circ_pitch=3, teeth=15, thickness=10, shaft_diam=5,
    helical=-30, herringbone=true, slices=5, anchor=BOT
);
}

module motor_mount () {
legth=50;

diff("remove") {
zrot(45) {
cuboid([25,25,5], anchor=BOT, spin=45, rounding=5, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
translate([-3.8,3.8,0]) cube([10,legth+15,10], anchor=FRONT+BOT, spin=45);
tag("remove") {
    fwd(8) cylinder(r=1.6, h=2, anchor=BOT) attach(UP,BOT) cylinder(r=3, h=10);
    back(8) cylinder(r=1.6, h=2, anchor=BOT) attach(UP,BOT) cylinder(r=3, h=10);
    left(9.5) cylinder(r=1.6, h=2, anchor=BOT) attach(UP,BOT) cylinder(r=3, h=10);
    right(9.5) cylinder(r=1.6, h=2, anchor=BOT) attach(UP,BOT) cylinder(r=3, h=10);
    cylinder(r=5.1, h=100, center=true);
}}
left(19) cylinder(r=1.4, h=10,anchor=BOT, $tag="remove");
left(47) cylinder(r=1.4, h=10,anchor=BOT, $tag="remove");
left(64) cylinder(r=1.4, h=10,anchor=BOT, $tag="remove");
}}

module giunto() {
thickness=5;
ir=16.05;
diff("remove") {
tube(ir=ir, wall=thickness, h=20, orient=FWD) {
    attach(UP, BOT) cylinder(r=ir+thickness, h=10, orient=FWD, $tag="bau") {
        cyl(r=ir, h=10, $tag="remove");
        attach(UP,UP, inside=true) tube(ir=ir-4, or=ir+thickness, h=1, anchor=BOT, $tag="keep");
        attach([1,0.5,0], FRONT, overlap=2) cube([33,15,10], $tag="bau") {
            attach(BACK,FRONT,inside=true) cube([22.8,12.2,10], $tag="remove") {
                position(LEFT) left(0) down(7) xrot(180) servo_gear();
                attach(UP,UP, align=LEFT, inside=true) right(3.5) cylinder(r=0.9, h=10, $tag="remove");                      
                attach(UP,UP, align=RIGHT, inside=true) left(3.5) cylinder(r=0.9, h=10, $tag="remove");
            };
        };
        attach([-1,0.5,0], FRONT, overlap=2) cube([33,15,10], $tag="bau") {
            attach(BACK,FRONT,inside=true) cube([22.8,12.2,10], $tag="remove") {
                attach(UP,UP, align=LEFT, inside=true) right(3.5) cylinder(r=0.9, h=10, $tag="remove");                      
                attach(UP,UP, align=RIGHT, inside=true) left(3.5) cylinder(r=0.9, h=10, $tag="remove");
            };
        };
    };
    attach(BOT, UP) cylinder(r=ir+thickness, h=10, orient=FWD, $tag="bau") {
        cyl(r=ir, h=10, $tag="remove");
        attach(UP,UP, inside=true) tube(ir=ir-4, or=ir+thickness, h=1, anchor=BOT, $tag="keep");
    };
    attach (BACK,FRONT, inside=true) cube([(ir+thickness)*2,35,20]);
};

cylinder(r=18, h=20, orient=BACK, anchor=CENTRE, $tag="remove");    
}
}

module bearing () {
diff("remove") {

import("STL/Bearing_6002_V02_tolMin (base).stl");
cylinder(r=8.5, h=15);
cube([10.4,10.4,100],anchor=BOT, $tag="remove");
translate([-5,0,12]) cylinder(r=1.6, h=2, orient=LEFT,$tag="remove" )
    attach(UP,UP) cylinder(r=2.6, h=10);
translate([5,0,12]) cylinder(r=1.6, h=2, orient=RIGHT,$tag="remove" )
    attach(UP,UP) cylinder(r=2.6, h=10);
}
}

module gear() {
diff("remove") {
spur_gear(
    circ_pitch=3, teeth=30, thickness=10, shaft_diam=8.5,
    helical=30, herringbone=true, slices=5, anchor=BOT
);
echo(pitch_radius(3,30,30));
cylinder(r=8.5, h=16);
cube([10.4,10.4,100],anchor=BOT, $tag="remove");
translate([-5,0,13]) cylinder(r=1.6, h=2, orient=LEFT,$tag="remove" )
    attach(UP,UP) cylinder(r=2.6, h=10);
translate([5,0,13]) cylinder(r=1.6, h=2, orient=RIGHT,$tag="remove" )
    attach(UP,UP) cylinder(r=2.6, h=10);
}}


giunto();
//up(5) zrot(90) right(42) xrot(180) motor_mount();
//xrot(90) up(10) zrot(90) bearing();
//xrot(-90) up(11) zrot(90) bearing();
//xrot(90) down(8) zrot(90) gear();
//servo_gear();