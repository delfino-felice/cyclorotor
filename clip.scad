include <libraries/BOSL2/std.scad>

$fn=100;

H=6;
IR=6.1;
x=7; // spessore supporti viti
difference() {
    union() {
        cylinder(h=H, r=IR+1.6, center=true); // cilindro centrale
        translate([IR+3.6,0,0]) cube([6,x,H], center=true); // supporto per viti
        yrot(90) prismoid(size1=[H,IR*2+3.2], size2=[H,x], h=IR+6.7);
    }
    union() {
        translate ([IR+3.6,0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=6, center=true) {
            attach(UP,UP) cylinder(r=2.7, h=10, center=true);
            zrot(90) attach(BOT,UP) cylinder(r=3.3, h=10, $fn=6, center=true);
        }; // foro vite
        translate ([IR+3.2,0,0]) cube([10,2,200], center=true); // gioco dimensione foro centrale       
        cylinder(r=IR, h=H, center=true);
    }
}