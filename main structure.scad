include <libraries/BOSL2/std.scad>

$fn=100;

thickness=7;
r1=20;
module motor_mount () {
diff("remove") {
cuboid([25,25,5], anchor=BOT, rounding=5, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
translate([-3.8,3.8,0]) cube([12,20,10], anchor=FRONT+BOT, spin=45);
tag("remove") {
    fwd(8) cylinder(r=1.6, h=3, anchor=BOT) attach(UP,BOT) cylinder(r=2.6, h=10);
    back(8) cylinder(r=1.6, h=3, anchor=BOT) attach(UP,BOT) cylinder(r=2.6, h=10);
    left(9.5) cylinder(r=1.6, h=3, anchor=BOT) attach(UP,BOT) cylinder(r=2.6, h=10);
    right(9.5) cylinder(r=1.6, h=3, anchor=BOT) attach(UP,BOT) cylinder(r=2.6, h=10);
    cylinder(r=5.1, h=100, center=true);
    zrot(45) back(11) cube([5,14,4],anchor=BOT);
}
}
}

module giunto() {
diff("remove") {

cube([15,55,thickness], anchor=BOT) 
    align([FWD,BACK], BOT, inside=true) cylinder(r=r1, h=10, orient=FWD, $tag="bau")
        cyl(r=r1-thickness, h=11, $tag="remove");


}
}
motor_mount();
