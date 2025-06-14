include <libraries/BOSL2/std.scad>


$fn=50;

H=6;
R1=1.3;
R2=6.1;
D=9.5;
diff("remove") {
    rotate([0,90,0]) prismoid(size1=[H,(R2+1.6)*2], size2=[H,(R1+1.6)*2], h=D) { // interspazio
        position(UP) rotate([0,90,0]) cylinder(r=R1+1.6, h=H, center=true) // cilindro minore
            attach(BOT,BOT, inside=true) cylinder(r=R1, h=H, $tag="remove", center=true); // foro minore
        position(DOWN) rotate([0,90,0]) cylinder(r=R2+1.6, h=H, center=true)  // cilindro maggiore
            attach(UP,BOT, inside=true) cylinder(r=R2, h=H-0.5, $tag="remove"); // foro maggiore con bordo
    }
    translate([-(R2+3.6),0,0]) cube([6,7,H], center=true); // supporto per viti        
    translate([-R2-0.9,0,-H/2]) cube([2,6,H]); // blocco bullone        

    tag("remove") {
        cylinder(r=R2-0.7, h=H+1, center=true); // foro maggiore

        translate ([-(R2+3.4),0,0]) rotate ([90,0,0]) cylinder(r=1.65,h=1000, center=true); // foro vite
        
        translate([-(R2+3.6),0,0]) cube([10,3,100], center=true); // gioco viti        
    }

}

 