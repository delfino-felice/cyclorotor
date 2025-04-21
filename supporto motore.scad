include <libraries/BOSL2/std.scad>

// supporto motore
// stampare con 3 o più pareti e infill alto
$fn=100;
L=25;
module supporto() {
diff("remove") {

cube([35,20,4],anchor=BOT) {
   position(LEFT+BOT) zrot(90) cube([35,25,4], orient=FRONT, anchor=FRONT+UP) {
    attach(UP,UP, inside=true) back(7) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
    attach(UP,UP, inside=true) fwd(5) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
   };
   position(RIGHT+BOT) zrot(90) cube([35,25,4], orient=FRONT, anchor=FRONT+DOWN) {
    attach(BOT,UP, inside=true) back(7) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
    attach(BOT,UP, inside=true) fwd(5) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
   };
};
fwd(4) cylinder(r=1.4, h=100, center=true, $tag="remove");
back(4) cylinder(r=1.4, h=100, center=true, $tag="remove");
}}

// distanza centro supporto motore dal centro del tubo = 65.6
supporto();
