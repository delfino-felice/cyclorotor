include <BOSL2/std.scad>


$fn=100;
l=32.5;
h=4;

H=12;
IR=6;


difference() {
    
    diff("remove") {
        tube(h=H, ir=IR, wall=1.2, center=true) {
            attach(LEFT,RIGHT, align=BOT, overlap=1.2) cuboid([l, 17, h],rounding=2, edges=[BACK+RIGHT,FWD+RIGHT])
                attach(LEFT,RIGHT) cuboid([45,25,4], rounding=3.5, edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT])
                    attach(BOT,TOP,inside=true) cuboid([30,10,1.5], $tag="remove");
            attach(LEFT,RIGHT, align=BOT, overlap=1.2) cuboid([l+40, 3.8, 10]);
        }
        translate([IR+3.2,0,0]) cube([6.5,3.6,H], center=true); // supporto per viti        
    }

    union() {
        translate ([IR+3.6,0,2.7]) rotate ([90,0,0]) cylinder(r=1.65,h=1000, center=true); // foro vite
        translate ([IR+3.6,0,-2.7]) rotate ([90,0,0]) cylinder(r=1.65,h=1000, center=true); // foro vite
        translate ([IR+3.2,0,0]) cube([10,1,200], center=true); // gioco dimensione foro centrale       

        translate ([-l-22.5-IR,6.4,-4]) scanalatura(32);
        translate ([-l-22.5-IR,-6.4,-4]) scanalatura(32);

    }
}
module scanalatura (L) {
    prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
}  
