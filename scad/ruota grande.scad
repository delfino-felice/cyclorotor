include <BOSL2/std.scad>
include <BOSL2/gears.scad>

// ruota grande //

$fn=200;
mmtooth=2;
h=7;
n=120;
render = true;

or = outer_radius(mmtooth, n);
echo(or);

// import(file="frame.stl");

module oggetto() {
    difference() {
        union() {
            // ingranaggio
            spur_gear(circ_pitch=mmtooth, teeth=n, thickness=h, pressure_angle=25);
            // bordi anti-scappatoia
            translate([0, 0, h/2+1]) cylinder(r=or+2.5, h=2, center=true);
            translate([0, 0, -(h/2+1)]) cylinder(r=or+2.5, h=2, center=true); 
        }
        union () {
            // buco
            cylinder(r=or-4, h=100, center=true);
        }
    }

    // attacchi viti
    difference() {
        union() {
            translate([or-6,0,h/2+0.5]) rotate([0,0,0]) cuboid([7,5,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
            translate([-(or-6),0,h/2+0.5]) rotate([0,0,0]) cuboid([7,5,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
            translate([0,or-6,h/2+0.5]) rotate([0,0,90]) cuboid([7,5,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
            translate([0,-(or-6),h/2+0.5]) rotate([0,0,90]) cuboid([7,5,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
        }
        union() {
            translate([or-7,0,0]) cylinder(r=1.4, h=100, center=true);
            translate([-(or-7),0,0]) cylinder(r=1.4, h=100, center=true);
            translate([0,or-7,0]) cylinder(r=1.4, h=100, center=true);
            translate([0,-(or-7),0]) cylinder(r=1.4, h=100, center=true);
        }
    }
}

if (render) oggetto(); 