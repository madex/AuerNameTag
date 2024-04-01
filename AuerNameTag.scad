$fn = 100;
dicke = 1.5;
font = "Liberation Sans:style=Bold";
font_size = 12;
font_offset = 9;

module tag() {
    linear_extrude(height=10 + dicke/2) translate([91.62, 9.25]) {
        difference() { union() {
            for (a = [0:180:180])
                rotate(v=[0, 0, 1], a=a) {
                    polygon([[1, 1], [10.9, 2], [10.2, 7.5], [0,4]]);
                    polygon([[0, 0], [-10.3, 5], [-10.2, 8.1], [-5, 8.3]]);
                }
            }
            circle(d=16.1);
        }
    }
    translate([88.7, 9.25, 0]) cube([181, 20, dicke], center=true);
    translate([160, 12.4, 0]) cube([15, 5, 4 + dicke/2]);
    translate([2, 1.3, 0]) cube([20, 5, 4 + dicke/2]);
    
}
module name(str) {
    translate([-9, font_offset + font_size/2, -dicke/2 + 0.29]) rotate(v=[1,0,0],a=180) linear_extrude(0.3) translate([15, 0]) 
       text(str, size=font_size, font = font);
}

//name("mAdEx");  // part 1 
//difference() { tag(); name("mAdEx"); }  //part 2