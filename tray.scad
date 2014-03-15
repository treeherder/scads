module spine(l){ //a backbone
cube([l,1, 18], center=true);

}
module leg(place, l){ //cross beams
translate([place,0,0]) rotate([0,0,90]) cube([l,1, 18],center=true);
translate([place,.5*l ,0]) rotate([0,0,0]) cube([10,1, 18],center=true);
translate([place,-.5*l ,0]) rotate([0,0,0]) cube([10,1, 18],center=true);
}
module tray(w,l,s, p){
//w for length of leg
//p for position of leg
//s for number of spines
//l for length of spine

for([0:s]){
translate(10,0,0) spine(l);}
//parametric auto build function
}
spine(160);
leg(80,60);
leg(20, 60);
leg(40, 60);
leg(0,60);
