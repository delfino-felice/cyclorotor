include <BOSL2/std.scad>

include <STL/ruota grande.scad>

$fn=100;
l1=7;
l2=4;
w=15;
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
            translate([or-7,0,0]) cylinder(r=1.4, h=10, center=true);
            translate([-(or-7),0,0]) cylinder(r=1.4, h=10, center=true);
            translate([0,or-7,0]) cylinder(r=1.4, h=10, center=true);
            translate([0,-(or-7),0]) cylinder(r=1.4, h=10, center=true);
        }    
    }
}

oggetto();
echo(str("or = ", or));