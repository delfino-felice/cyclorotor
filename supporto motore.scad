include <libraries/BOSL2/std.scad>

// supporto motore
// stampare con 3 o più pareti e infill alto
$fn=100;
L=25;
module supporto() {
diff("remove") {

cube([35,25,6], anchor=BOT) {
    down(2) attach(UP,UP, inside=true) back(6) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) {
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
            attach(UP,BOT) cylinder(r=2.95, h=2, center=true);
        };
        attach(BOT,BOT) cuboid([L,3.1,2]);
        attach(UP,BOT) cuboid([L,5.9,2]);
    }
    down(2) attach(UP,UP, inside=true) fwd(6) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) {
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
            attach(UP,BOT) cylinder(r=2.95, h=2, center=true);
        };
        attach(BOT,BOT) cuboid([L,3.1,2]);
        attach(UP,BOT) cuboid([L,5.9,2]);
    }
    attach(UP,BOT) prismoid(size1=[35,10], size2=[10,10], h=6)
        zrot(90) attach(UP,BOT, align=[RIGHT,LEFT]) cube([1.95,10,5], anchor=BOT);
    attach(BOT,UP, inside=true) cube([L-4,12,1.5]) 
        attach(BOT,BOT) cylinder(r=2.6, h=3, $tag="remove")
            attach(UP,BOT) cylinder(r=1,6, h=100, $tag="remove");
};
}}

// distanza centro supporto motore dal centro del tubo = 65.6
supporto();
