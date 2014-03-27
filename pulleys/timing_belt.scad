// By Erik de Bruijn
// Modified by James Newton 
// Modified by brendan reddy-best
// License: GPLv2 or later

include <MCAD/teardrop.scad>
toothType = 2; // 1 = slightly rounded, 2 = oval sharp, 3 = square. For square, set the toothWith a little low.

pitch          	= 5   ; // distance between the teath
beltWidth       	= 4   ; // the width/height of the belt. The (vertical) size of the pulley is adapted to this.
beltThickness   	= 0.65; // thickness of the part excluding the notch depth!
notchDepth      	= 1.8 ; // make slightly bigger than actual, to avoid outward curvature in the inner solid part of the pulley
toothWidth     	= 1.4 ; // Teeth of the PULLEY, that is.

PI = 3.14159265;
$fs=0.2; // def 1, 0.2 is high res
$fa=3;//def 12, 3 is very nice

// The smallest pulley that will fit on a 0.25 inch shaft has perhaps 15 teeth?
numTeeth = 12;
translate ([40,40,0]) 
timingPulley
	(pitch            	// distance between the teath
	,beltWidth        	// the width/height of the belt. The (vertical) size of the pulley is adapted to this.
	,beltThickness    	// thickness of the part excluding the notch depth!
	,notchDepth       	// make slightly bigger than actual, to avoid outward curvature in the inner solid part of the pulley
	,toothWidth      	// Teeth of the PULLEY, that is.
	,numTeeth*ratio               	// this value together with the pitch determines the pulley diameter
	,2		//flanges          	// the rims that keep the belt from going anywhere, 0, 1 (on the top) or 2
	,0.5	//flangeHeight    	// how much the flanges angle in toward the inner diameter of the pulley.
	,4.9  	//shaftDiameter   	// the shaft at the center, will be subtracted from the pulley. Better be too small than too wide.
	,0  	//shaftFlatDiameter	// the diameter of the shaft when measured at a flat milled in the shaft. 0 if the shaft is round.
	,20 	//hubDiameter     	// if the hub or timing pulley is big enough to fit a nut, this will be embedded.
	,10 	//hubHeight       	// the hub is connected to the pulley to allow a set screw to go through or as a collar for a nut.
	,2  	//hubSetScrewDiameter// use either a set screw or nut on a shaft. Set to 0 to not use a set screw.
	,90 	//hubSetScrewAngle	// change from 90 to angle the setscrews
	,3  	//hubSetScrews    	// 1 is usually fine, 3 allows centering
	);

// This is for a drill press feed capstan. 
// A force of ~1Kg is required at a radius of 3 inches (7.62cm) is required to move the capstan.
// This is a torque of 22.86 Kg-cm or 318 oz-inches.
ratio = 4;
translate ([-60,0,0]) 
timingPulley
	(pitch            	// distance between the teath
	,beltWidth        	// the width/height of the belt. The (vertical) size of the pulley is adapted to this.
	,beltThickness    	// thickness of the part excluding the notch depth!
	,notchDepth       	// make slightly bigger than actual, to avoid outward curvature in the inner solid part of the pulley
	,toothWidth      	// Teeth of the PULLEY, that is.
	,numTeeth*(ratio/2)               	// this value together with the pitch determines the pulley diameter
	,2		//flanges          	// the rims that keep the belt from going anywhere, 0, 1 (on the top) or 2
	,0.5	//flangeHeight    	// how much the flanges angle in toward the inner diameter of the pulley.
	,4.9  	//shaftDiameter   	// the shaft at the center, will be subtracted from the pulley. Better be too small than too wide.
	,0  	//shaftFlatDiameter	// the diameter of the shaft when measured at a flat milled in the shaft. 0 if the shaft is round.
	,20 	//hubDiameter     	// if the hub or timing pulley is big enough to fit a nut, this will be embedded.
	,10 	//hubHeight       	// the hub is connected to the pulley to allow a set screw to go through or as a collar for a nut.
	,2  	//hubSetScrewDiameter// use either a set screw or nut on a shaft. Set to 0 to not use a set screw.
	,90 	//hubSetScrewAngle	// change from 90 to angle the setscrews
	,3  	//hubSetScrews    	// 1 is usually fine, 3 allows centering
	);

translate ([0,-40,0]) 
timingPulley
	(pitch            	// distance between the teath
	,beltWidth        	// the width/height of the belt. The (vertical) size of the pulley is adapted to this.
	,beltThickness    	// thickness of the part excluding the notch depth!
	,notchDepth       	// make slightly bigger than actual, to avoid outward curvature in the inner solid part of the pulley
	,toothWidth      	// Teeth of the PULLEY, that is.
	,numTeeth               	// this value together with the pitch determines the pulley diameter
	,2		//flanges          	// the rims that keep the belt from going anywhere, 0, 1 (on the top) or 2
	,0.5	//flangeHeight    	// how much the flanges angle in toward the inner diameter of the pulley.
	,4.9  	//shaftDiameter   	// the shaft at the center, will be subtracted from the pulley. Better be too small than too wide.
	,0  	//shaftFlatDiameter	// the diameter of the shaft when measured at a flat milled in the shaft. 0 if the shaft is round.
	,20 	//hubDiameter     	// if the hub or timing pulley is big enough to fit a nut, this will be embedded.
	,10 	//hubHeight       	// the hub is connected to the pulley to allow a set screw to go through or as a collar for a nut.
	,2  	//hubSetScrewDiameter// use either a set screw or nut on a shaft. Set to 0 to not use a set screw.
	,90 	//hubSetScrewAngle	// change from 90 to angle the setscrews
	,3  	//hubSetScrews    	// 1 is usually fine, 3 allows centering
	);

// //////////////////////////////
// OpenSCAD SCRIPT
// //////////////////////////////


module timingPulley
	(pitch            	// distance between the teath
	,beltWidth        	// the width/height of the belt. The (vertical) size of the pulley is adapted to this.
	,beltThickness    	// thickness of the part excluding the notch depth!
	,notchDepth       	// make it slightly bigger than actual, there's an outward curvature in the inner solid part of the pulley
	,toothWidth      	// Teeth of the PULLEY, that is.
	,numTeeth         	// this value together with the pitch determines the pulley diameter
	,flanges          	// the rims that keep the belt from going anywhere, 0, 1 (on the top) or 2
	,flangeHeight    	// how much the flanges angle in toward the inner diameter of the pulley.
	,shaftDiameter   	// the shaft at the center, will be subtracted from the pulley. Better be too small than too wide.
	,shaftFlatDiameter	// the diameter of the shaft when measured at a flat milled in the shaft. 0 if the shaft is round.
	,hubDiameter     	// if the hub or timing pulley is big enough to fit a nut, this will be embedded.
	,hubHeight       	// the hub is connected to the pulley to allow a set screw to go through or as a collar for a nut.
	,hubSetScrewDiameter// use either a set screw or nut on a shaft. Set to 0 to not use a set screw.
	,hubSetScrewAngle	// change from 90 to angle the setscrews
	,hubSetScrews    	// 1 is usually fine, 3 allows centering
) {

	pulleyDiameter = pitch*numTeeth/PI;

	shaftFlat = shaftDiameter - shaftFlatDiameter;
	totalHeight = beltWidth + flangeHeight*flanges + hubHeight;

	if (shaftFlatDiameter>0 || hubSetScrewDiameter>0) {
		echo("set screw or flat, hub, no nut");
		union() {
			difference() {
				union() {
					timingGear(pitch,beltWidth,beltThickness,numTeeth,notchDepth,flanges);
					hub(hubDiameter,hubHeight,hubSetScrewDiameter);
					}
				translate([0,0,-(beltWidth)]) 
					shaft(totalHeight*2,shaftDiameter); //can't use just totalHeight because the shaft is being centered.
				}
			if (shaftFlatDiameter>0	) {
				if (hubSetScrewDiameter>0) {
					//add in the flat, but put the last set screw hole back in.
					difference() {
						translate([(shaftDiameter/2)-shaftFlat,-shaftDiameter/2,-(beltWidth + flangeHeight*flanges)]) 
							cube([shaftFlat,shaftDiameter,totalHeight]);
						rotate([0,0,360]) translate([shaftDiameter/1.3,0,hubHeight/2]) rotate([0,hubSetScrewAngle,0]) 
							teardrop(hubSetScrewDiameter/2, hubDiameter/1.9, true);
						}
					}
				else {
					//just add in the flat.
					translate([(shaftDiameter/2)-shaftFlat,-shaftDiameter/2,-(beltWidth + flangeHeight*flanges)]) 
						cube([shaftFlat,shaftDiameter,totalHeight]);
					}
				}
			}
		}
	else {
		difference() {
			union() {
				timingGear(pitch,beltWidth,beltThickness,numTeeth,notchDepth,flanges);
				if(pulleyDiameter < hubDiameter) {
					hub(hubDiameter,hubHeight,hubSetScrewDiameter);
					}
				}
			translate([0,0,-(beltWidth)]) shaft(totalHeight*2,shaftDiameter); 
			//can't use just totalHeight because the shaft is being centered.
		if(pulleyDiameter >= hubDiameter) {
			echo("no hub needed");
			translate([0,0,-(beltWidth/2)]) nutSize(shaftDiameter,beltWidth);
			}
		else {
			translate([0,0,hubHeight-(beltWidth/2)]) nutSize(shaftDiameter,beltWidth);

			}

		}
	}
module shaft(shaftHeight, shaftDiameter)  {	
	cylinder(h = shaftHeight, r = shaftDiameter/2, center =true);
	}


module timingGear(pitch,beltWidth,beltThickness,numTeeth,notchDepth,flanges) {
	toothHeight = beltWidth+flangeHeight*flanges;
	circumference = numTeeth*pitch;
	outerRadius = circumference/PI/2-beltThickness;
	innerRadius = circumference/PI/2-notchDepth-beltThickness;

	union()
	{
		//solid part of gear
		translate([0,0,-toothHeight]) cylinder(h = toothHeight, r = innerRadius, center =false);
		//teeth part of gear
		translate([0,0,-toothHeight/2]) teeth(pitch,numTeeth,toothWidth,notchDepth,toothHeight);
	
		// flanges:
		if (1==flanges) {
			//top flange
			translate([0,0,0]) cylinder(h = 1, r=outerRadius+3);
			translate([0,0,-flangeHeight]) cylinder(h = flangeHeight, r2=outerRadius,r1=innerRadius);
			}
		if (2==flanges) {
			//top flange
			translate([0,0,0]) cylinder(h = 1, r=outerRadius+3);
			translate([0,0,-flangeHeight]) cylinder(h = flangeHeight, r2=outerRadius,r1=innerRadius);
			//bottom flange
			translate([0,0,-toothHeight-0.5]) cylinder(h = 1, r=outerRadius+3);
			translate([0,0,-toothHeight]) cylinder(h = flangeHeight, r1=outerRadius,r2=innerRadius);
			}
		}
	}

	module teeth(pitch,numTeeth,toothWidth,notchDepth,toothHeight)
	{
		// teeth are apart by the 'pitch' distance
		// this determines the outer radius of the teeth
		circumference = numTeeth*pitch;
		outerRadius = circumference/PI/2-beltThickness;
		innerRadius = circumference/PI/2-notchDepth-beltThickness;
		echo("Teeth diameter is: ", outerRadius*2);
		echo("Pulley inside of teeth radius is: ", innerRadius*2);
		
		for(i = [0:numTeeth-1])
		{
			rotate([0,0,i*360/numTeeth]) translate([innerRadius,0,0]) 
				tooth(toothWidth,notchDepth, toothHeight,toothType);
		}
	}
	module tooth(toothWidth,notchDepth, toothHeight,toothType)
	{
		if(toothType == 1)
		{
			union()
			{
				translate([notchDepth*0.25,0,0]) 
					cube(size = [notchDepth,toothWidth,toothHeight],center = true);
		  		translate([notchDepth*0.75,0,0]) scale([notchDepth/4, toothWidth/2, 1]) 
					cylinder(h = toothHeight, r = 1, center=true);
			}
		}
		if(toothType == 2)
			scale([notchDepth, toothWidth/2, 1]) cylinder(h = toothHeight, r = 1, center=true);

		if(toothType == 3)
		{
			union()
			{
				#translate([notchDepth*0.5-1,0,0]) cube(size = [notchDepth+2,toothWidth,toothHeight],center = true);
		  		//scale([notchDepth/4, toothWidth/2, 1]) cylinder(h = toothHeight, r = 1, center=true);
			}
		}
	}

module hub(hubDiameter,hubHeight,hubSetScrewDiameter) {
	if(hubSetScrewDiameter == 0) {
		cylinder(h = hubHeight, r = hubDiameter/2, center =false);
		}
	if(hubSetScrewDiameter > 0) {
		difference() 	{
			cylinder(h = hubHeight, r = hubDiameter/2, center =false);
			for(rotZ=[1:hubSetScrews])
				rotate([0,0,360*(rotZ/hubSetScrews)]) translate([shaftDiameter/1.3,0,hubHeight/2]) rotate([0,hubSetScrewAngle,0]) 
					teardrop(hubSetScrewDiameter/2, hubDiameter/1.9,true);
			}
		}
	}
}


module nutSize(d, h) { //guesses a net size based on the shaft diameter. Warns on non-standard diameters
//http://www.physics.harvard.edu/services/machineshop/shoplinks/MetricScrewThreadChart.pdf
//https://docs.google.com/spreadsheet/ccc?key=0Akap0WDOII5mdDhiVDJyTmQ5QXhSMTJ6Z2ZZWmFxQkE#gid=1
	if (d<1.78) {echo("ERROR: Shaft to small for nut");}
	if (d>=1.78 	&& d<1.85)  {nut( 1.6,h);}	//an M1.6 nut will be used on a shaft from 1.78 to 1.85mm
	if (d>=1.85	&& d<2.01)  {nut( 1.8,h);}
	if (d>=2.01	&& d<2.63)  {nut( 2.0,h);}
	if (d>=2.63	&& d<3.37)  {nut( 3.0,h);}
	if (d>=3.37	&& d<3.89)  {nut( 3.5,h);}
	if (d>=3.89	&& d<4.42)  {nut( 4.0,h);}
	if (d>=4.42	&& d<4.86)  {nut( 4.5,h);}
	if (d>=4.86	&& d<5.63)  {nut( 5.0,h);}
	if (d>=5.63	&& d<6.64)  {nut( 6.0,h);}
	if (d>=6.64	&& d<7.67)  {nut( 7.0,h);}
	if (d>=7.67	&& d<9.26)  {nut( 8.0,h);}
	if (d>=9.26	&& d<11.30) {nut(10.0,h);}
	if (d>=11.30	&& d<13.28) {nut(12.0,h);}
	if (d>=13.28	&& d<15.27) {nut(14.0,h);}
	if (d>=15.27	&& d<17.25) {nut(16.0,h);}
	if (d>=17.25	&& d<19.43) {nut(18.0,h);}
	if (d>=19.43	&& d<20.62) {nut(20.0,h);}
   if (d>=20.62)	{echo ("ERROR: Shaft to big for nut");}
	}


// also in ~/RepRap/Object Files/nuts.scad
module nut(nutSize,height) {
// Based on some random measurements:
// M3 = 5.36
// M5 = 7.85
// M8 = 12.87
	hexSize = nutSize + 12.67 - 8; // only checked this for M8 hex nuts!!
	echo("Nut size:",nutSize);
	union() {
		 for(i=[0:5]) {
			intersection() {
				rotate([0,0,60*i]) translate([0,-hexSize/2,0]) cube([hexSize/2,hexSize,height]);
				rotate([0,0,60*(i+1)]) translate([0,-hexSize/2,0]) cube([hexSize/2,hexSize,height]);
				}
			}
		}
	}
