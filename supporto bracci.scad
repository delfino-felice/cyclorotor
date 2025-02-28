include <libraries/BOSL2/std.scad>

$fn=100;
diff("remove") {
cylinder(r=3.5, h=6)
    attach(TOP,BOT) cuboid([22,22,2], spin=45, rounding=3,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
translate([10,0,0]) cylinder(r=1.4, h=100, $tag="remove", center=true);
mirror([1,0,0]) translate([10,0,0]) cylinder(r=1.4, h=100, $tag="remove", center=true);
mirror([1,1,0]) translate([10,0,0]) cylinder(r=1.4, h=100, $tag="remove", center=true);
mirror([-1,1,0]) translate([10,0,0]) cylinder(r=1.4, h=100, $tag="remove", center=true);
cylinder(r=1.53, h=100, $tag="remove", center=true);


}