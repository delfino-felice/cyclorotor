include <libraries/BOSL2/std.scad>

$fn=100;

l=80;
h=6.5;
h_piano=2;
w_blocco=35;
d_motori=70;
ir=6.1;

module main() {
diff("remove") {

prismoid(size1=[l,10], size2=[l,35], h=h)
    attach(UP,UP, inside=true) cube([l,w_blocco,h_piano], $tag="bau"); 
left(l/2) back(w_blocco/2) cylinder(r=ir+2, h=w_blocco, anchor=BOT+FRONT, orient=FRONT) {
    attach(UP,UP,inside=true) cylinder(r=ir, h=w_blocco);
    attach(RIGHT,LEFT, overlap=1) cube([8,7,w_blocco], $tag="bau") {
        attach(BACK,UP,inside=true) fwd(10) cylinder(r=2.1, h=7, $tag="remove")
            attach(BOT,UP) cylinder(r=4, h=10, $fn=6);
        attach(BACK,UP,inside=true) back(10) cylinder(r=2.1, h=7, $tag="remove")
            attach(BOT,UP) cylinder(r=4, h=10, $fn=6);
    };
    attach(RIGHT,LEFT, overlap=3) cube([12,3,w_blocco], $tag="remove");
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

//attacco_giunto();
main();