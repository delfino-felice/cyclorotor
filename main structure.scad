include <libraries/BOSL2/std.scad>

$fn=100;

thickness=5;
r1=23.05;
legth=55;

module motor_mount () {
diff("remove") {
zrot(45) {
cuboid([25,25,5], anchor=BOT, spin=45, rounding=5, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
translate([-3.8,3.8,0]) cube([10,legth+15,10], anchor=FRONT+BOT, spin=45);
tag("remove") {
    fwd(8) cylinder(r=1.6, h=3, anchor=BOT) attach(UP,BOT) cylinder(r=2.6, h=10);
    back(8) cylinder(r=1.6, h=3, anchor=BOT) attach(UP,BOT) cylinder(r=2.6, h=10);
    left(9.5) cylinder(r=1.6, h=3, anchor=BOT) attach(UP,BOT) cylinder(r=2.6, h=10);
    right(9.5) cylinder(r=1.6, h=3, anchor=BOT) attach(UP,BOT) cylinder(r=2.6, h=10);
    cylinder(r=5.1, h=100, center=true);
}}

}}

module giunto() {
diff("remove") {

cube([25,55,thickness], anchor=BOT) {
    align([FWD,BACK], BOT, inside=true) cylinder(r=r1, h=10, orient=FWD, $tag="bau") {
        cyl(r=r1-thickness, h=11, $tag="remove");
        position(BOT) tube(ir=r1-thickness-4, or=r1, h=1, anchor=BOT, $tag="keep");
    };
    align([FWD,BACK], BOT, inside=true) cube([r1*2,10,r1], $tag="bau"); 
};    
}
}

module bearing () {
diff("remove") {

import("STL/Bearing_6002_V02_tolMin (base).stl");
cylinder(r=8.5, h=15);
cube([10.1,10.2,100],anchor=BOT, $tag="remove");
translate([-5,0,12]) cylinder(r=1.6, h=2, orient=LEFT,$tag="remove" )
    attach(UP,UP) cylinder(r=2.6, h=10);
translate([5,0,12]) cylinder(r=1.6, h=2, orient=RIGHT,$tag="remove" )
    attach(UP,UP) cylinder(r=2.6, h=10);
}
}
giunto();
//motor_mount();
//bearing();