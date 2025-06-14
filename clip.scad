include <libraries/BOSL2/std.scad>

$fn=100;

H=6;
IR=6.1;
difference() {
    union() {
        cylinder(h=H, r=IR+1.6, center=true); // cilindro centrale
        translate([IR+3.6,0,0]) cube([6,7,H], center=true); // supporto per viti
        translate([IR-1.1,0,-H/2]) cube([2,6,H]); // blocco bullone        

    }
    union() {
        translate ([IR+3.4,0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=1000, center=true); // foro vite
        translate ([IR+3.2,0,0]) cube([10,2,200], center=true); // gioco dimensione foro centrale       
        cylinder(r=IR, h=H, center=true);
    }
}