$fn=500;
include <voronoi.scad>;

hpos= [
    [31.365,65.345],
    [32.000,168.266],
    [94.103,113.809],
    [114.931,168.266],
    [165.731,168.266],
    [127.707,47.642],
    [179.244,39.564+.6],
    [173.478,83.735]
];
mirror([1,0,0]) 

difference() {
    union() {
        color("green")
            linear_extrude(height = 4.01 + 0.8)
            import (file = "ErgoDOX Case Layer 3 Plate - Left.dxf", layer = "Cut");

        translate([0,0,4])
            intersection() {
                linear_extrude(height = 10.2+0.8)
                    import (file = "ErgoDOX Case Layer 1 Top - Left.dxf");
                union() {
                    color("blue")
                        translate([0,10,0.5])
                        voronoied_cylinder(71);
                    color("yellow")
                        scale([1,3.9,0.25])
                        translate([0,36,0])
                        rotate([0,90,-3.9])
                        cylinder(h=300, r=27);
                }
            }

        // cover holes
        for (pos=hpos) {
            color("red")
                translate([pos[0]+1,pos[1]+1,0])
                cylinder(r=2.5,h=4.01+0.8);  
        }

        // cover end
        color("red")
            translate([130,183.557-20,0])
            cube([40,20,4.01]);

        // cover chip
        color("red")
            translate([38,158,0])
            cube([40,20,4.01]);
    }

    // switch clips + place for stabilizers
    translate([0,0,-0.1])
        linear_extrude(height = 3.6)
        import (file = "ErgoDOX Case Layer 3 Plate - Left.dxf", layer = "Carve");

    // take away
    // place inside for ic
    translate([32,156,-0.01])
        cube([138,20,7.2]);

    color("purple")
        translate([32+10,156+4,-0.01])
        cube([66,12,9.2]);

    color("purple")
        translate([138+1,156+2,-0.01])
        cube([20,20,6.2]);

    color("purple")
        translate([138+1-51,156+2,-0.01])
        cube([20,20,6.2]);

    // end part for cable
    translate([138+10+1,181+40-2,-1])
        cylinder(r=40,h=20);

    // speaker hole 3mm sunken ??
    color("purple")
        translate([138+10+1,181,2.5])
        rotate([90,0,0])
        cylinder(r=3.5,h=10);

    // right side, also usb mini connector
    translate([138+10+1-51,181+40-2,-1])
        cylinder(r=40,h=20);

    // teensy reset hole !!!
    translate([(32+10+5),(160+6),-10])
        cylinder(r=1,h=100);

    translate([138+10+1-51-4.1+.5-1.5,181-6,0])
        cube([8.2,10,4.2]);

    translate([138+10+1-51-4.1-1.5,181-6,2])
        cube([9.2,10,4.2-2]);

    h_pos_support_vis= [
        [24.623,51.478],
        [105.029,48.071],
        [188.331,11.241],
        [214.917,68.257],
        [173.175,175.792],
        [119.692,177.611],
        [24.623,175.793]
    ];

    for (pos=h_pos_support_vis) {
        color("black")
            translate([pos[0]+1.5,pos[1]+1.6,10.2-1.8+0.8])
            cylinder(r=3.2,h=8.01,center=true);  
    }

    // cut away for test print
//    translate([0,0,-1])
//        cube([150,250,15]);

}
