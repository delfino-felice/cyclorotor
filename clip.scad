include <BOSL2/std.scad>

$fn=100;

H=6;
IR=6.1;
difference() {
    union() {
        tube(h=H, ir=IR, wall=1.2, center=true); // tubo centrale
        translate([IR+3.2,0,0]) cube([6.5,5.4,H], center=true); // supporto per viti

    }
    union() {
        translate ([IR+3.6,0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=1000, center=true); // foro vite
        translate ([IR+3.2,0,0]) cube([10,3,200], center=true); // gioco dimensione foro centrale       
    }
}