
module tray_neg(){
union(){
    
    translate([0,0,7])cube([28,33,8], center=true);
    translate([0,0,2])cube([25 ,25,8], center=true);
    translate([11,11,0]) cylinder(h=11, r=1.8, center=true);
    translate([11,-11,0]) cylinder(h=11, r=1.8, center=true);
    translate([-11, 11,0]) cylinder(h=11, r=1.8, center=true);
    translate([-11, -11,0]) cylinder(h=11, r=1.8, center=true);
    translate([10,0,4.5])rotate([0,90,0])cylinder(r=5, h=17, center=true);
    }
}
module tray_holder(){
    cube([32,36,10], center =true);  
}

module tray_top(){
    difference(){
    
    union(){
aperture(); 

difference(){
        tray_holder();

union(){  
    translate([0,0,7])cube([28,33,8], center=true);
    translate([0,0,2])cube([25 ,25,8], center=true);
    translate([11,11,0]) cylinder(h=11, r=1.8, center=true);
    translate([11,-11,0]) cylinder(h=11, r=1.8, center=true);
    translate([-11, 11,0]) cylinder(h=11, r=1.8, center=true);
    translate([-11, -11,0]) cylinder(h=11, r=1.8, center=true);
      //cylinder(r=4.3, h=24, center=true);
    translate([0,-11,0])scale([2,1]) cylinder(r=4.2, h=24, center=true);
    translate([0,11,0])scale([2,1]) cylinder(r=4.2, h=24, center=true);
}
   
  translate([0,0,0])  cylinder(r2=3, r1=9, h=12, center=true);
//aperture hole
}
}
  translate([13,0,0 ]) cylinder(r=4, h=20, center=true);
//speaker hole    
}
}

module aperture(){


    difference(){
translate([0,0,-2 ]) cylinder(r=8.5, h=6, center=true);
  translate([0,0,0 ])     cylinder(r2=4.4, r1=7.5, h=13, center=true);
    }
}
module tray_bottom(){
   
difference(){
    
    tray_holder();
    tray_neg();
    }
}
module all(){
rotate([0,180,0]) translate([0,0,-10])tray_top();
 tray_bottom();}

 all();
