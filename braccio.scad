include <libraries/BOSL2/std.scad>

$fn=50;
difference("remove") {
    cuboid([68,8,2], rounding=1.5,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
    tag("remove") {
        translate([30,0,0]) cylinder(r=1.53, h=10, center=true); 
        translate([-30,0,0]) cylinder(r=1.53, h=10, center=true); 
    }
}
