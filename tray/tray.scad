module tab(length,height, place_x,place_y){ //can be an arc, or whatever. give it a vector, eventually
	translate([place_x,place_y,0]) cube([length,1, height],center=true);
	translate([place_x,-place_y,0]) cube([length,1, height],center=true);
}
module spine(length, height, tabs){ //a backbone
	cube([length,1,height], center=true);
	
	tab(30,height,0,place, length);
	tab(30,height,0,place, -length);

}

module leg(place, length, height, tab, ){ //cross beams
	translate([place,0,0]) rotate([0,0,90]) cube([length,1, height],center=true);
/*
	curved ends paramater
	if (curve > 0){
		tab(x y z);
 */

}

module tray(spines,legs, height, leg_d, spine_d, leg_len, spine_len){
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