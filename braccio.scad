include <libraries/BOSL2/std.scad>

H=14; //altezza cilindro 

$fn=50;
diff("remove") {
    cuboid([77,8,1], anchor=BOT, rounding=1.5,edges=[BACK+RIGHT,BACK+LEFT,FWD+RIGHT,FWD+LEFT]);

    translate([35,0,0]) cylinder(r=2.8, h=H, anchor=BOT); 
 
    translate([35,0,0]) cylinder(r=1.62, h=100, $tag="remove", center=true); // foro ala
    translate([-35,0,0]) cylinder(r=1.49, h=100, $tag="remove", center=true); // foro mozzo centrale
    
}
