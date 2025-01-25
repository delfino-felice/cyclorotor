include <BOSL2/std.scad>


$fn=50;

H=6;
IR=6;
R1=1.4;
R2=6;
D=8.5;
diff("remove") {
    rotate([0,90,0]) prismoid(size1=[H,(R2+1.2)*2], size2=[H,(R1+1.2)*2], h=D) {
        position(UP) rotate([0,90,0]) cylinder(r=R1+1.2, h=H, center=true);
        position(DOWN) rotate([0,90,0]) cylinder(r=R2+1.2, h=H, center=true);
    }
    translate([-(R2+3.2),0,0]) cube([6.5,3.6,H], center=true); // supporto per viti        
 
    tag("remove") {
        cylinder(r=R2, h=H+1, center=true);
        translate([D,0,0]) cylinder(r=R1, h=H+1, center=true);

        translate ([-(R2+3.2),0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=1000, center=true); // foro vite
        
        translate([-(R2+3.2),0,0]) cube([10,1,100], center=true); // gioco viti        
    }

}
