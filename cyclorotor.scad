include <libraries/BOSL2/std.scad>
include <libraries\parametricPulley.scad>
use <libraries/NACA/ShortCuts.scad>
use <libraries/NACA/Naca4.scad>

$fn=50;

n=120; // numero denti ruota grande
or = ((n*2)/(3.14159265*2)-0.254);


module braccio() {
H=14; //altezza cilindro 
diff("remove") {
    cuboid([78,8,1], anchor=BOT, rounding=4,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT])
        attach(UP,UP, align=RIGHT, inset=1) cube([65,2.5,1]);

    translate([35,0,]) cylinder(r=2.8, h=H, anchor=BOT); 
 
    translate([35,0,0]) cylinder(r=1.62, h=100, $tag="remove", center=true); // foro ala
    translate([-35,0,0]) cylinder(r=1.49, h=100, $tag="remove", center=true); // foro mozzo centrale    
    right(35) up(1) cylinder(r1=4, r2=2.8, h=7, anchor=BOT); 
}}

module clip () {

H=8;
IR=6.1;
x=7; // spessore supporti viti
difference() {
    union() {
        cylinder(h=H, r=IR+1.6, center=true); // cilindro centrale
        translate([IR+3.6,0,0]) cube([7,x,H], center=true); // supporto per viti
        yrot(90) prismoid(size1=[H,IR*2+3.2], size2=[H,x], h=IR+7.7);
    }
    union() {
        translate ([IR+3.6,0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=6, center=true) {
            attach(UP,UP) cylinder(r=2.7, h=10, center=true);
            zrot(90) attach(BOT,UP) cylinder(r=3.3, h=10, $fn=6, center=true);
        }; // foro vite
        translate ([IR+3.2,0,0]) cube([10,2,200], center=true); // gioco dimensione foro centrale       
        cylinder(r=IR, h=H, center=true);
    }
}}

module distanziatore () {
tube(ir=1.8, wall=2, h=6);
}

module frame() {
l1=10;
l2=5;
w=20;
h=10;
diff("remove") {
    union() {
        // bracci della croce
        cuboid([150,10,3], rounding=5,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
        rotate([0, 0, 90]) {
            cuboid([150,10,3], rounding=5,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
        }
        // centro
        cylinder(r=16.2, h=10.5, anchor=BOT) // supporto cuscinetto
            attach(UP,BOT) cylinder(r1=16.2, r2=14.5, h=6) // supporto tubo
                attach(UP,UP, inside=true) cylinder(r=13.2,h=6,$tag="remove") { // foro tubo
                    // fori viti tubo
                    attach([1,1,0],BOT, overlap=.15) cylinder(r=1.6,h=1.5, $tag="remove") attach(UP,UP) cylinder(r=2.7, h=10);
                    attach([1,-1,0],BOT, overlap=.15) cylinder(r=1.6,h=1.5, $tag="remove") attach(UP,UP) cylinder(r=2.7, h=10);
                    attach([-1,1,0],BOT, overlap=.15) cylinder(r=1.6,h=1.5, $tag="remove") attach(UP,UP) cylinder(r=2.7, h=10);
                    attach([-1,-1,0],BOT, overlap=.15) cylinder(r=1.6,h=1.5, $tag="remove") attach(UP,UP) cylinder(r=2.7, h=10);
                    // conifere
                    attach(BOT,BOT) cylinder(r1=11, r2=14.15, h=2.5);
                }; 
        // interfacce supporto-bracci
        translate([15,0,3]) rotate([0,0,90]) prismoid(size1=[l1,w], size2=[l2,0], shift=[0,w/2+0], h=h, anchor=BOT+BACK);
        translate([0,15,3]) rotate([0,0,180]) prismoid(size1=[l1,w], size2=[l2,0], shift=[0,w/2+0], h=h, anchor=BOT+BACK);
        translate([-15,0,3]) rotate([0,0,270]) prismoid(size1=[l1,w], size2=[l2,0], shift=[0,w/2+0], h=h, anchor=BOT+BACK);
        translate([0,-15,3]) rotate([0,0,0]) prismoid(size1=[l1,w], size2=[l2,0], shift=[0,w/2+0], h=h, anchor=BOT+BACK);

    }
    tag("remove") {
        // fori viti ali
        translate([70,0,0]) cylinder(r=2.2, h=10, center=true); 
        translate([-70,0,0]) cylinder(r=2.2, h=10, center=true); 
        translate([0,70,0]) cylinder(r=2.2, h=10, center=true); 
        translate([0,-70,0]) cylinder(r=2.2, h=10, center=true); 
        // supporto cuscinetto
        cylinder(r=14.15, h=8, anchor=BOT);
        cylinder(r=11, h=100, center=true);
        // fori viti ingranaggio
        translate([or-8,0,0]) cylinder(r=1.4, h=100, center=true);
        translate([-(or-8),0,0]) cylinder(r=1.4, h=100, center=true);
        translate([0,or-8,0]) cylinder(r=1.4, h=100, center=true);
        translate([0,-(or-8),0]) cylinder(r=1.4, h=100, center=true);
    }    
}
echo(str("or = ", or));
}

module tubo() {
h=136;  
diff("remove") {
tube(od=26, wall=0.8, h=h);
up(h/2-3) cylinder(r=1.5, h=100, orient=FWD, center=true, $tag="remove");
up(h/2-3) cylinder(r=1.5, h=100, orient=LEFT, center=true, $tag="remove");

down(h/2-3) cylinder(r=1.5, h=100, orient=FWD, center=true, $tag="remove");
down(h/2-3) cylinder(r=1.5, h=100, orient=LEFT, center=true, $tag="remove");

}}

module ruota_grande() {    
h=7;
gear(number_of_teeth=n, profile=12, motor_shaft_diameter=(or*2)-8, belt_retainer=1, retainer_height_p=1.5, belt_idler=1, idler_height_p=1.5,base_height=0,base_diameter=17.4,flange_option=0);
// attacchi viti
difference() {
    union() {
        translate([or-7,0,0]) rotate([0,0,0]) cuboid([9,8,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
        translate([-(or-7),0,0]) rotate([0,0,0]) cuboid([9,8,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
        translate([0,or-7,0]) rotate([0,0,90]) cuboid([9,8,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
        translate([0,-(or-7),0]) rotate([0,0,90]) cuboid([9,8,3], rounding=2.2,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT], anchor=BOT);
    }
    union() {
        translate([or-8,0,0]) cylinder(r=1.6, h=100, center=true);
        translate([-(or-8),0,0]) cylinder(r=1.6, h=100, center=true);
        translate([0,or-8,0]) cylinder(r=1.6, h=100, center=true);
        translate([0,-(or-8),0]) cylinder(r=1.6, h=100, center=true);
    }
}}

module ruota_piccola() {
s=8; // raggio cilindrico negativo esterno
diff("remove"){
cylinder(r=4.07, h=16, anchor=BOT);
cylinder(r=s, h=3, anchor=UP){
    attach(BOT,UP, inside=true) cylinder(r=4.6, h=1.5)
        attach(BOT,BOT) cylinder(r=1.575, h=12);

    attach(BOT,UP) fwd(8.5) cylinder(r=3.4, h=3);
    attach(BOT,UP) back(8.5) cylinder(r=3.4, h=3);
    attach(BOT,UP) left(8.5) cylinder(r=3.4, h=3);
    attach(BOT,UP) right(8.5) cylinder(r=3.4, h=3);

};
tube(ir=s, wall=20, h=100, $tag="remove");
}}

module supporto_bracci() {
H=6;
R1=1.3;
R2=6.1;
D=9.5;
x=7; // spessore supporti viti
diff("remove") {
    rotate([0,90,0]) prismoid(size1=[H,(R2+1.6)*2], size2=[H,(R1+1.6)*2], h=D) { // interspazio
        position(UP) rotate([0,90,0]) cylinder(r=R1+1.6, h=H, center=true) // cilindro minore
            attach(BOT,BOT, inside=true) cylinder(r=R1, h=H, $tag="remove", center=true); // foro minore
        position(DOWN) rotate([0,90,0]) cylinder(r=R2+1.6, h=H, center=true)  // cilindro maggiore
            attach(UP,BOT, inside=true) cylinder(r=R2, h=H-0.5, $tag="remove"); // foro maggiore con bordo
    }
    translate([-(R2+3.6),0,0]) cube([7,x,H], center=true); // supporto per viti        
    yrot(-90) prismoid(size1=[H,R2*2+3.2], size2=[H,x], h=R2+7.7);


    tag("remove") {
        cylinder(r=R2-0.7, h=H+1, center=true); // foro maggiore
        translate ([-R2-3.6,0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=6, center=true) {
            attach(UP,UP) cylinder(r=2.7, h=10, center=true);
            attach(BOT,UP) cylinder(r=3.3, h=10, $fn=6, center=true);
        }; // foro vite 
        translate([-(R2+3.6),0,0]) cube([10,2,100], center=true); // gioco viti        
    }

}}

module wing() {

difference() {
    airfoil(naca = 0022, L = 50, N=1000, h = 150, open = false); 
    union() {
        translate([9,0,0]) cylinder(r=1.8, h=24, center=true);
        translate([22,0,0]) cylinder(r=1.35, h=24, center=true);

        translate([9,0,150]) cylinder(r=1.8, h=24, center=true);
        translate([22,0,150]) cylinder(r=1.35, h=24, center=true);
    }    
}}

// module call
//braccio();
//clip();
//distanziatore();
//frame();
//ruota_grande();
ruota_piccola();
//supporto_bracci();
//wing();
//tubo();