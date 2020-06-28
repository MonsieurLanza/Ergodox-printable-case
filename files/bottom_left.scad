$fn=500;
hpos= [[24.623,51.478],[105.029,48.071],[188.331,11.241],[214.917,68.257],[173.175,175.792],[119.692,177.611],[24.623,175.793]];
difference() {
union() {
difference() {
    
union() {
    
color("red")
linear_extrude(height = 7)
import (file = "ErgoDOX Case Layer 5 Bottom - Left.dxf");
    
translate([20+5,46+5,0]) // 20,46
color("red")
cube([150,126,4]);

translate([20+5+90,46+5,0]) // 20,46
rotate([0,0,-25])
color("red")
cube([84,58,4]);
    
// cover holes
for (pos=hpos) {
color("red")
translate([pos[0]+1,pos[1]+1,0])
cylinder(r=4,h=7);  
}
}


// this part is the actual board, should be 4mm ?
translate([-1,-1,0])
scale([1.01,1.01,1])
difference() {

union() {
translate([20+5,46+5,3]) // 20,46
color("orange")
cube([150,126,8]);

translate([20+5+90,46+5,3]) // 20,46
rotate([0,0,-25])
color("purple")
cube([84,58,8]);
}

translate([0,0,3-1])
color("green")
linear_extrude(height = 6)
import (file = "ErgoDOX Case Layer 4 Spacer - Left.dxf");

for (a=[[4,5],[84,1],[167,-35],[193,22],[151,128],[99,130],[4,128]]) {

translate([20+a[0],46+a[1],3-1])
color("red")
cube([5,5,8]);
}
}
// end board
// end part for cable
translate([138+10+1,181+40-2,-1])
cylinder(r=40,h=10);
 // speaker hole 3mm sunken ??
color("purple")
translate([138+10+1,181,7+2.5])
rotate([90,0,0])
cylinder(r=3,h=10);

// upper parts of pcb don't fit very well
color("blue")
translate([70+20,181-8,3])
cube([14,5,10]);
color("blue")
translate([70+70-1,181-8,3])
cube([20,5,10]);

// we need mount points for our nuts !!!
// for this we need to know the position of the holes !!
for (pos=hpos) {
color("blue")
translate([pos[0]+1.5,pos[1]+1.5,0])
cylinder(r = 5.7 / 2 / cos(180 / 6) + 0.05, $fn=6,h=6,center=true);   

color("blue")
translate([pos[0]+1.5,pos[1]+1.5,0])
cylinder(r=1.6,h=10);    

}



}

// board supports 
// these support the board on the underside
bpos = [[32.000,168.266],[114.931,168.266],[165.731,168.266],[94.103,113.809],[31.365,65.345],[127.707,47.642],[173.478,83.735],[179.244,39.564]];

for (pos=bpos) {
color("blue")
translate([(pos[0]*1.01)+1,(pos[1]*1.01)+1,0])
cylinder(r=4.1,h=7-1.6);   
    

}
}
// cut away for test print
//translate([0,0,-1])
//cube([250,120,15]);

}

