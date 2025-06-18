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
    cuboid([78,8,1], anchor=BOT, rounding=4,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);

    translate([35,0,0]) cylinder(r=2.8, h=H, anchor=BOT); 
 
    translate([35,0,0]) cylinder(r=1.62, h=100, $tag="remove", center=true); // foro ala
    translate([-35,0,0]) cylinder(r=1.49, h=100, $tag="remove", center=true); // foro mozzo centrale    
    right(39) up(1) prismoid(size1=[15,8], rounding1=[4,0,0,4], size2=[5.6,5.6], rounding2=2.8, h=4, shift=[3.5,0], anchor=BOT+RIGHT);
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
l1=7;
l2=4;
w=20;
h=6;

    module prism(l1,l2, w, h){
        polyhedron(//pt 0           1            2            3           4             5
            points=[[-l1/2,0,0], [l1/2,0,0], [l1/2,w,0], [-l1/2,w,0], [-l2/2,0,h], [l2/2,0,h]],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
        );
    }

    module oggetto() {
        rotate ([0,180,0]) difference() {
            union() {
                // bracci della croce
                cuboid([150,10,3], rounding=5,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
                rotate([0, 0, 90]) {
                    cuboid([150,10,3], rounding=5,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);
                }
                // supporto cuscinetto
                translate([0,0,-3.25])  cylinder(r=16.2, h=9.5, center=true);
                // interfacce supporto-bracci
                translate([15,0,-1.5]) rotate([0,180,-90]) prism(l1,l2,w,h);
                translate([0,15,-1.5]) rotate([0,180,0]) prism(l1,l2,w,h);
                translate([-15,0,-1.5]) rotate([0,180,90]) prism(l1,l2,w,h);
                translate([0,-15,-1.5]) rotate([0,180,180]) prism(l1,l2,w,h);
                // attacco tubo
                translate([0,0,-10.25]) tube(h=5, ir=12, wall=1);
            }
            union() {
                // fori viti ali
                translate([70,0,0]) cylinder(r=2.2, h=10, center=true); 
                translate([-70,0,0]) cylinder(r=2.2, h=10, center=true); 
                translate([0,70,0]) cylinder(r=2.2, h=10, center=true); 
                translate([0,-70,0]) cylinder(r=2.2, h=10, center=true); 
                // supporto cuscinetto
                translate([0,0,-2.5])  cylinder(r=14.1, h=8, center=true);
                cylinder(r=9, h=100, center=true);
                // fori viti ingranaggio
                translate([or-8,0,0]) cylinder(r=1.4, h=10, center=true);
                translate([-(or-8),0,0]) cylinder(r=1.4, h=10, center=true);
                translate([0,or-8,0]) cylinder(r=1.4, h=10, center=true);
                translate([0,-(or-8),0]) cylinder(r=1.4, h=10, center=true);
            }    
        }
    }
oggetto();
echo(str("or = ", or));
}


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
base_hole_diameter = 7.2; 
shaft_diameter = 5.2;
base_height = 10;
diff("remove"){
gear(number_of_teeth=33, profile=12, motor_shaft_diameter=shaft_diameter, belt_retainer=1, retainer_height_p=1.5, belt_idler=1, idler_height_p=1.5,base_height=base_height,base_diameter=22.5,flange_option=1,flange_diam=12,flange_thickness=5.5);
cylinder(r1=base_hole_diameter/2, r2=shaft_diameter/2, h=base_height+2, $fn=200, $tag="remove");
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
rotate([90, 0, 0]) {
    translate([0, 0, 15]) {
    //  import ("Part 13 Wing.stl");  
    } 
    
}
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
braccio();
//clip();
//distanziatore();
//frame();
//ruota_grande();
//ruota_piccola();
//supporto_bracci();
//wing();