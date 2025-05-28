include <libraries/BOSL2/std.scad>
$fn=100;
 difference("remove") {
    cube([30,7,3], center=true);
    left(10) cylinder(r=2.1, h=10, center=true, $tag="remove");
    right(10) cylinder(r=2.1, h=10, center=true, $tag="remove");
        
 }