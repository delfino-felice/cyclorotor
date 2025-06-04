include <libraries/BOSL2/std.scad>
include <libraries\parametricPulley.scad>

base_hole_diameter = 7.2; 
shaft_diameter = 5.2;
base_height = 9.5;
diff("remove"){
gear(number_of_teeth=28, profile=12, motor_shaft_diameter=shaft_diameter, belt_retainer=1, retainer_height_p=1.5, belt_idler=1, idler_height_p=1.5,base_height=base_height,base_diameter=19.3,flange_option=1,flange_diam=12,flange_thickness=5.5);
cylinder(r1=base_hole_diameter/2, r2=shaft_diameter/2, h=base_height+2, $fn=200, $tag="remove");
}
