include <BOSL2/std.scad>


$fn=50;

H=6;
IR=4.9;
difference() {
    union() {
        tube(h=H, ir=IR, wall=1.2, center=true)
            attach(LEFT,LEFT, overlap=0.5) tube(ir=1.4, h=H, wall=0.5) {
                attach(FRONT,FRONT) left(.5) down(.5) cuboid([1.5, 4, H], spin=-38);
                attach(BACK,FRONT) right(.5) down(.5) cuboid([1.5, 4, H], spin=38);
            }
        translate([IR+3.2,0,0]) cube([6.5,3.6,H], center=true); // supporto per viti

    }
    union() {
        translate ([IR+3.6,0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=1000, center=true); // foro vite
        translate ([IR+3.2,0,0]) cube([10,1,200], center=true); // gioco dimensione foro centrale       
    }
}