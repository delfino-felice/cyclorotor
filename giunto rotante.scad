include <libraries/BOSL2/std.scad>
include <libraries/BOSL2/gears.scad>

// TO DO //
// ruota leggermente più lontana dal motore
// controllare fori per cuscinetto accanto al motore


$fn=100;

module servo_gear() {
circ_pitch=3;
teeth=20;
diff ("remove") {
import("STL/11_Gripper_gear_v4.stl");
spur_gear(
    circ_pitch=circ_pitch, teeth=teeth, thickness=10, shaft_diam=5,
    helical=30, herringbone=true, slices=5, anchor=BOT
);

echo(str("pitch_radius = ", pitch_radius(circ_pitch, teeth,30)));
echo(str("outer_radius = ", outer_radius(circ_pitch, teeth,30)));

}}

module motor_mount () {
legth=55;

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
left(49.5) cylinder(r=1.4, h=10,anchor=BOT, $tag="remove");
left(70) cylinder(r=1.4, h=10,anchor=BOT, $tag="remove");
}}

module giunto() {
thickness=4;
ir=16.1;
d=26;
diff("remove") {
tube(ir=ir, wall=thickness, h=d, orient=FWD) {
    attach(UP, BOT) cylinder(r=ir+thickness, h=10, orient=FWD, $tag="bau") {
        cyl(r=ir, h=10, $tag="remove");
        attach(UP,UP, inside=true) tube(ir=ir-4, or=ir+thickness, h=1, anchor=BOT, $tag="keep");
        
        attach([1,0.5,0], FRONT, overlap=2) cube([33,15,10], $tag="bau") {
            attach(BACK,FRONT,inside=true) cube([22.8,12.2,10], $tag="remove") {
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

    attach (BACK,FRONT, inside=true) cube([(ir+thickness)*2,30,d]);
    
    diff ("e") {
        attach (FRONT, BOT, overlap=2) prismoid(size1=[15,d+20], size2=[15,d-5], h=9) {
            attach(LEFT, LEFT, inside=true) fwd(2) right(2) prismoid(size1=[2,d+22], size2=[2,d-3], h=9, $tag="e");
            attach(RIGHT, LEFT, inside=true) fwd(2) left(2) prismoid(size1=[2,d+22], size2=[2,d-3], h=9, $tag="e");

            fwd(5) cylinder(r=1.4, h=15, orient=LEFT, anchor=CENTRE, $tag="e");
            back(5) cylinder(r=1.4, h=15, orient=LEFT, anchor=CENTRE, $tag="e");

        };
    }

};

cylinder(r=18, h=26, orient=BACK, anchor=CENTRE, $tag="remove");    
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
circ_pitch=3;
teeth=30;
diff("remove") {
spur_gear(
    circ_pitch=circ_pitch, teeth=teeth, thickness=10, shaft_diam=8.5,
    helical=30, herringbone=true, slices=5, anchor=BOT
);
;
echo(str("pitch_radius = ", pitch_radius(circ_pitch, teeth,30)));
echo(str("outer_radius = ", outer_radius(circ_pitch, teeth,30)));
cylinder(r=8.5, h=16);
cube([10.4,10.4,100],anchor=BOT, $tag="remove");
translate([-5,0,13]) cylinder(r=1.6, h=2, orient=LEFT,$tag="remove" )
    attach(UP,UP) cylinder(r=2.6, h=10);
translate([5,0,13]) cylinder(r=1.6, h=2, orient=RIGHT,$tag="remove" )
    attach(UP,UP) cylinder(r=2.6, h=10);
}}


//  giunto();
//  up(5) zrot(90) right(45) xrot(180) motor_mount();
//  xrot(90) up(13) zrot(90) bearing();
//  xrot(-90) up(14) zrot(90) bearing();
//  xrot(90) down(8.5) zrot(90) gear();
  servo_gear();