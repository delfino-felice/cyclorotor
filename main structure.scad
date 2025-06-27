include <libraries/BOSL2/std.scad>
include <libraries/BOSL2/skin.scad>
$fn=100;


l=95;
h=7.1;
h_piano=2;
W_braccio=36;
d_motori=72.5;
ir=6.1;
L=20;
d_supporto=10.5;

module main() {
diff("remove") {

prismoid(size1=[l,10], size2=[l,W_braccio], h=h) {
    attach(UP,UP, inside=true) cube([l,W_braccio,h_piano], $tag="bau"); 


    d=30.5/2;
    attach(UP,UP) left(d_supporto) cube([W_braccio,W_braccio,2]);
    left(d_supporto) translate([d,d,0]) cylinder(r=1.4, h=100, center=true, $tag="remove");
    left(d_supporto) translate([-d,d,0]) cylinder(r=1.4, h=100, center=true, $tag="remove");
    left(d_supporto) translate([d,-d,0]) cylinder(r=1.4, h=100, center=true, $tag="remove");
    left(d_supporto) translate([-d,-d,0]) cylinder(r=1.4, h=100, center=true, $tag="remove");

    attach(RIGHT,FRONT, align=BOT) prismoid(size1=[10,0], size2=[18.7325,8], h=3.1, shift=[0,4]);

    right(d_motori-(l/2)) attach(UP,BOT, inside=true) cuboid([L,14,h], $tag="bau") { // cubo base
        attach([FRONT,BACK], BOT) prismoid(size1=[L,h], size2=[L+15,h], h=8, $tag="remove")
            attach(UP,UP) cube([L+15,h,100]); // spazio per supporti motore
        attach(UP,UP, overlap=1.5) prismoid(size1=[L+6,14], size2=[L+20,14], h=5, $tag="bau"); // prisma di rinforzo

        up(1.75) cube([L,14,3.8], $tag="remove", anchor=CENTRE) // spazio albero motore
            cube([L,3.2,6.8], $tag="remove", anchor=CENTRE) // spazio vite
                attach([UP,BOT],UP) cube([L+3,6,10], $tag="remove", anchor=CENTRE); // spazio bullone/testa
    };


};
left(l/2) back(W_braccio/2) cylinder(r=ir+2, h=W_braccio, anchor=BOT+FRONT, orient=FRONT) {
    attach(UP,UP,inside=true) cylinder(r=ir, h=W_braccio);
    attach(RIGHT,LEFT, overlap=5) right(1.5) cube([12,9,W_braccio], $tag="bau") {
        attach(BACK,UP, align=RIGHT, inset=2.5, inside=true) fwd(11) cylinder(r=2.1, h=9, $tag="remove")
            attach(BOT,UP) cylinder(r=4, h=10, $fn=6);
        attach(BACK,UP, align=RIGHT, inset=2.5, inside=true) back(11) cylinder(r=2.1, h=9, $tag="remove")
            attach(BOT,UP) cylinder(r=4, h=10, $fn=6);
    };
    attach(RIGHT,LEFT, overlap=3) cube([12,2,W_braccio], $tag="remove");
};


}}

module attacco_giunto() {
diff ("remove") {
zrot(90) right(2) prismoid(size1=[38.2,18.7325], size2=[30.2,18.7325], h=5.5, shift=[4,0]);
fwd(5) up(2.6) cylinder(r=1.4, h=25, orient=LEFT, anchor=CENTRE, $tag="remove");
back(5) up(2.6) cylinder(r=1.4, h=25, orient=LEFT, anchor=CENTRE, $tag="remove");
zrot(90) right(2) prismoid(size1=[38.2,11.3], size2=[22.2,11.3], h=5.5, $tag="remove");
down(3.5) cube([11,50,5], anchor=BOT, $tag="remove");

}}

module supporto () {
diff("remove") {
width = 30;
lenght = 44;
a=30;
cuboid([lenght,width,5], rounding=3, edges=[BACK+LEFT,FRONT+LEFT], anchor=UP, spin=90) 
    attach(BOT,UP) cuboid([lenght+10,width+10,50], $tag="remove"); 
fwd(lenght/2-2) xrot(a) cylinder(r1=7, r2=5, h=12, anchor=BOT) {
    attach(UP,UP, inside=true) cylinder(r=3.1, h=10);
    attach(BOT,UP) cylinder(r=7, h=10, center=true);
};
back(lenght/2-2) right(width/2-2) yrot(a) xrot(-a) cylinder(r1=7, r2=5, h=12, anchor=BOT) {
    attach(UP,UP, inside=true) cylinder(r=3.1, h=10);
    attach(BOT,UP) cylinder(r=7, h=10, center=true);
};
back(lenght/2-2) left(width/2-2) yrot(-a) xrot(-a) cylinder(r1=7, r2=5, h=12, anchor=BOT) {
    attach(UP,UP, inside=true) cylinder(r=3.1, h=10);
    attach(BOT,UP) cylinder(r=7, h=10, center=true);
};
    d_fori=0;
    fwd(d_fori) cylinder(r=1.4, h=100, center=true, $tag="remove");
    fwd(d_fori + 7) cylinder(r=1.4, h=100, center=true, $tag="remove");
    fwd(d_fori - 7) cylinder(r=1.4, h=100, center=true, $tag="remove");

}}

module motor_mount () {
diff("remove") {
cuboid([25,25,3], anchor=BOT, spin=45, rounding=5, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]) 
    attach(UP,BOT) skin([rect([25, 25], rounding=5), rect([7.5,16], center=true)], z=[0,5], slices=50, method="tangent")
        attach(UP,BOT, inside=true) cube([3.7,12.1,5.5], $tag="remove")
            attach(LEFT,UP) cylinder(r=1.6, h=2, $tag="remove") attach(BOT,UP) cylinder(r=2.6, h=10, $tag="remove");

tag("remove") {
    fwd(8) cylinder(r=1.6, h=2, anchor=BOT) attach(UP,BOT) cylinder(r=3, h=100);
    back(8) cylinder(r=1.6, h=2, anchor=BOT) attach(UP,BOT) cylinder(r=3, h=100);
    left(9.5) cylinder(r=1.6, h=2, anchor=BOT) attach(UP,BOT) cylinder(r=3, h=100);
    right(9.5) cylinder(r=1.6, h=2, anchor=BOT) attach(UP,BOT) cylinder(r=3, h=100);
    cylinder(r=5.1, h=2, anchor=BOT);
}
}}

module battery_mount () {
diff("remove") {
cube([22,51,4], anchor=BOT) 
    attach(BOT, BOT, align=[FRONT, BACK], inside=true) left(5) cube([38,8,50], $tag="bau")
        attach(BACK,BACK, align=UP, inset=7, inside=true) cube([27.2,8,34.2], $tag="remove");

d_fori=0;
left(d_fori) cylinder(r=1.6, h=3, anchor=BOT, $tag="remove") attach(UP,UP) cylinder(r=2.6, h=3, center=true, $tag="remove");
left(d_fori + 7) cylinder(r=1.6, h=3, anchor=BOT, $tag="remove") attach(UP,UP) cylinder(r=2.6, h=3, center=true, $tag="remove");
left(d_fori - 7) cylinder(r=1.6, h=3, anchor=BOT, $tag="remove") attach(UP,UP) cylinder(r=2.6, h=3, center=true, $tag="remove");
}}

module arduino_mount () {
d=30.5/2;

diff("remove") {
cuboid([113,82,3], anchor=BOT, rounding=2, edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);

translate([35, 0, 0]) {
translate([d,d,0]) cylinder(r=3.5, h=7, anchor=UP, $tag="bau") attach(BOT,UP, inside=true) cylinder(r=1.6, h=7, $tag="remove") attach(BOT,UP) cylinder(r=2.6, h=7, $tag="remove");   
translate([-d,d,0]) cylinder(r=3.5, h=7, anchor=UP, $tag="bau") attach(BOT,UP, inside=true) cylinder(r=1.6, h=7, $tag="remove") attach(BOT,UP) cylinder(r=2.6, h=7, $tag="remove");   
translate([d,-d,0]) cylinder(r=3.5, h=7, anchor=UP, $tag="bau") attach(BOT,UP, inside=true) cylinder(r=1.6, h=7, $tag="remove") attach(BOT,UP) cylinder(r=2.6, h=7, $tag="remove");   
translate([-d,-d,0]) cylinder(r=3.5, h=7, anchor=UP, $tag="bau") attach(BOT,UP, inside=true) cylinder(r=1.6, h=7, $tag="remove") attach(BOT,UP) cylinder(r=2.6, h=7, $tag="remove");   
}

}}

module asse_motori () {
diff("remove") {

cube([12.1,25.5,3.5], anchor=BOT);
left(2.5) cylinder(r=1.4, h=10,$tag="remove");
right(2.5) cylinder(r=1.4, h=10,$tag="remove");
fwd(10) cylinder(r=1.4, h=10,$tag="remove");
back(10) cylinder(r=1.4, h=10,$tag="remove");
}}

module supporto_giroscopio () {
diff("remove") {
    cube ([20,10,5]) {
        attach(FWD,UP, align=UP) cube([20,10,4])
            attach(FWD,LEFT, align=UP) cube([4,20,25]);
        left(7.5) fwd(3) cylinder(r=1.4, h=10, $tag="remove", center=true);
        right(7.5) fwd(3) cylinder(r=1.4, h=10, $tag="remove", center=true);
    };
}}


module piedi() {
diff("remove") {
cylinder(r=16, h=2) {
    attach(UP,BOT) xrot(30) cylinder(r1=7,r2=5,h=12) {
        attach(UP,UP, inside=true) cylinder(r=3.1, h=10);
        attach(BOT,UP) cylinder(r=7, h=10, center=true);
    };
    attach(BOT,BOT) cylinder(r=20, h=100, $tag="remove");
}

fwd(35) cylinder(r=16, h=2) {
    attach(UP,BOT) yrot(30) xrot(30) cylinder(r1=7,r2=5,h=12) {
        attach(UP,UP, inside=true) cylinder(r=3.1, h=10);
        attach(BOT,UP) cylinder(r=7, h=10, center=true);
    };
    attach(BOT,BOT) cylinder(r=20, h=100, $tag="remove");
}

back(35) cylinder(r=16, h=2) {
    attach(UP,BOT) yrot(-30) xrot(30) cylinder(r1=7,r2=5,h=12) {
        attach(UP,UP, inside=true) cylinder(r=3.1, h=10);
        attach(BOT,UP) cylinder(r=7, h=10, center=true);
    };
    attach(BOT,BOT) cylinder(r=20, h=100, $tag="remove");
}
}}
//supporto();
 right(l/2+21.1) zrot(90) yrot(180) down(8.6) attacco_giunto();
 main();
//motor_mount();
//asse_motori();
//zrot(90) battery_mount();
//arduino_mount();
//supporto_giroscopio();
//piedi();