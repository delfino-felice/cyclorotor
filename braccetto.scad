include <BOSL2/std.scad>

$fn=50;
difference("remove") {
    cuboid([78,8,1], rounding=1.5,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
    tag("remove") {
        translate([35,0,0]) cylinder(r=1.8, h=10, center=true); 
        translate([-35,0,0]) cylinder(r=1.8, h=10, center=true); 
    }
}
