use <libraries/NACA/ShortCuts.scad>
use <libraries/NACA/Naca4.scad>

$fn=50;
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
}
