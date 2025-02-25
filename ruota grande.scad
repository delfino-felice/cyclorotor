include <libraries/BOSL2/std.scad>
include <libraries\parametricPulley.scad>

// ruota grande //

$fn=200;

h=7;
n=120;
render = true;

or = ((n*2)/(3.14159265*2)-0.254);
echo(or);

// import(file="frame.stl");

module oggetto() {
    gear(number_of_teeth=n, profile=12, motor_shaft_diameter=(or*2)-8, belt_retainer=1, retainer_height_p=1.5, belt_idler=1, idler_height_p=1.5,base_height=0,base_diameter=17.4,flange_option=0);

    // attacchi viti
    difference() {
        union() {
            translate([or-7,0,0]) rotate([0,0,0]) cuboid([9,8,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
            translate([-(or-7),0,0]) rotate([0,0,0]) cuboid([9,8,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
            translate([0,or-7,0]) rotate([0,0,90]) cuboid([9,8,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
            translate([0,-(or-7),0]) rotate([0,0,90]) cuboid([9,8,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
        }
        union() {
            translate([or-8,0,0]) cylinder(r=1.6, h=100, center=true);
            translate([-(or-8),0,0]) cylinder(r=1.6, h=100, center=true);
            translate([0,or-8,0]) cylinder(r=1.6, h=100, center=true);
            translate([0,-(or-8),0]) cylinder(r=1.6, h=100, center=true);
        }
    }
}

if (render) oggetto(); 