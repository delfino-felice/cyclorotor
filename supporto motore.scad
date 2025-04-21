include <libraries/BOSL2/std.scad>

// supporto motore
// stampare con 3 o più pareti e infill alto
$fn=100;
L=32;
module supporto() {
diff("remove") {

cube([45,20,4],anchor=BOT) {
   position(LEFT+UP) zrot(90) cube([45,25,4], orient=FRONT, anchor=FRONT+DOWN) {
    attach(UP,UP, inside=true) back(6) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
    attach(UP,UP, inside=true) fwd(6) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
   };
   position(RIGHT+UP) zrot(90) cube([45,25,4], orient=FRONT, anchor=FRONT+UP) {
    attach(BOT,UP, inside=true) back(6) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
    attach(BOT,UP, inside=true) fwd(6) prismoid(size1=[L,3.1], size2=[L,5.9], h=2) {
        position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) 
            attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
        attach(BOT,BOT) cuboid([L,3.1,2]);
    }
   };
};
fwd(4) cylinder(r=1.4, h=100, center=true, $tag="remove");
back(4) cylinder(r=1.4, h=100, center=true, $tag="remove");
}}

// distanza centro supporto motore dall'origine = 65.6
supporto();
