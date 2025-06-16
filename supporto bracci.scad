include <libraries/BOSL2/std.scad>

$fn=50;

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
            zrot(90) attach(BOT,UP) cylinder(r=3.3, h=10, $fn=6, center=true);
        }; // foro vite 
        translate([-(R2+3.6),0,0]) cube([10,3,100], center=true); // gioco viti        
    }

}

 