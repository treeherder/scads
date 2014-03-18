module spine(l){ //a backbone
cube([l,1, 18], center=true);
}

module leg(place, l){ //cross beams
translate([place,0,0]) rotate([0,0,90]) cube([l,1, 18],center=true);
translate([place,.5*l ,0]) rotate([0,0,0]) cube([10,1, 18],center=true);
translate([place,-.5*l ,0]) rotate([0,0,0]) cube([10,1, 18],center=true);
}

module tray(spines,legs,leg_d, spine_d, leg_len, spine_len){
//parametric auto build function
//takes a lot of parameters; can certainly be streamlined.

for(i = [0:spines]){
translate([0,i*spine_d,0])spine(spine_len);
translate([0,-i*spine_d,0])spine(spine_len);
	}
for(i = [0:legs]){
leg(i*leg_d, leg_len*0.5);
leg(i*-leg_d, leg_len*0.5);
	}
}

tray(1, 4, 20, 25, 180, 180);
