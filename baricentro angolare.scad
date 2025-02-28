include <libraries/BOSL2/std.scad>


$fn=50;

H=6;
R1=1.4;
R2=6.1;
D=8.5;
diff("remove") {
    rotate([0,90,0]) prismoid(size1=[H,(R2+1.2)*2], size2=[H,(R1+1.2)*2], h=D) { // interspazio
        position(UP) rotate([0,90,0]) cylinder(r=R1+1.2, h=H, center=true) // cilindro minore
            attach(BOT,BOT, inside=true) cylinder(r=R1, h=H, $tag="remove", center=true); // foro minore
        position(DOWN) rotate([0,90,0]) cylinder(r=R2+1.2, h=H, center=true)  // cilindro maggiore
            attach(UP,BOT, inside=true) cylinder(r=R2, h=H-0.5, $tag="remove"); // foro maggiore con bordo
    }
    translate([-(R2+3.2),0,0]) cube([6.5,7,H], center=true); // supporto per viti        
 
    tag("remove") {
        cylinder(r=R2-0.7, h=H+1, center=true); // foro maggiore

        translate ([-(R2+3.2),0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=1000, center=true); // foro vite
        
        translate([-(R2+3.2),0,0]) cube([10,3,100], center=true); // gioco viti        
    }

}
