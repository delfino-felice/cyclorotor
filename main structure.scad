include <libraries/BOSL2/std.scad>

$fn=100;

l=90;
h=6.5;
h_piano=2;
W_braccio=30;
d_motori=70;
ir=6.1;
L=29;


module main() {
diff("remove") {

prismoid(size1=[l,10], size2=[l,W_braccio], h=h) {
    attach(UP,UP, inside=true) cube([l,W_braccio,h_piano], $tag="bau"); 

    left(11) cylinder(r=1.4, h=100, center=true, $tag="remove");

    attach(RIGHT,FRONT, align=BOT) prismoid(size1=[10,0], size2=[18,8], h=2.5, shift=[0,4]);

    right(d_motori-(l/2)) attach(UP,BOT, inside=true) prismoid(size1=[W_braccio,38], size2=[W_braccio,33], h=6, spin=90, $tag="bau")
        attach([RIGHT,LEFT], BOT, inside=true) cuboid([40,23,4], rounding=3, edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT],  anchor=BOT, $tag="abu") {
        attach(UP,UP, inside=true) back(6) prismoid(size1=[L,3.1], size2=[L,5.9], h=2, $tag="remove") {
            position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) {
                attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
                };
                attach(BOT,BOT) cuboid([L,3.1,2]);
            }
        attach(UP,UP, inside=true) fwd(6) prismoid(size1=[L,3.1], size2=[L,5.9], h=2, $tag="remove") {
            position([LEFT,RIGHT]) cylinder(r1=1.55, r2=2.95, h=2, center=true) {
                attach(BOT,BOT) cylinder(r=1.55, h=2, center=true);
                };
                attach(BOT,BOT) cuboid([L,3.1,2]);
            }
    attach(BOT,UP, inside=true) cube([L-4,12,1.5]); 
};

};
left(l/2) back(W_braccio/2) cylinder(r=ir+2, h=W_braccio, anchor=BOT+FRONT, orient=FRONT) {
    attach(UP,UP,inside=true) cylinder(r=ir, h=W_braccio);
    attach(RIGHT,LEFT, overlap=1) cube([8,7,W_braccio], $tag="bau") {
        attach(BACK,UP,inside=true) fwd(10) cylinder(r=2.1, h=7, $tag="remove")
            attach(BOT,UP) cylinder(r=4, h=10, $fn=6);
        attach(BACK,UP,inside=true) back(10) cylinder(r=2.1, h=7, $tag="remove")
            attach(BOT,UP) cylinder(r=4, h=10, $fn=6);
    };
    attach(RIGHT,LEFT, overlap=3) cube([12,3,W_braccio], $tag="remove");
};


}}

module attacco_giunto() {
diff ("remove") {
zrot(90) right(2) prismoid(size1=[38.2,18], size2=[30.2,18], h=5.5, shift=[4,0]);
fwd(5) up(2.6) cylinder(r=1.4, h=25, orient=LEFT, anchor=CENTRE, $tag="remove");
back(5) up(2.6) cylinder(r=1.4, h=25, orient=LEFT, anchor=CENTRE, $tag="remove");
zrot(90) right(2) prismoid(size1=[38.2,11.3], size2=[22.2,11.3], h=5.5, $tag="remove");
down(3.5) cube([11,50,5], anchor=BOT, $tag="remove");

}}

right(l/2+21.1) zrot(90) yrot(180) down(8) attacco_giunto();
main();