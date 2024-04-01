/* [Drop down box:] */
view = "preview"; // [preview, part1, part2]
// Name für den Tag
name = "Test"; 

// Tipp; Ansicht / Unten (ctrl oder command 5)

/* [Hidden] */
font = "Liberation Sans:style=Bold";
font_size = 12;
font_offset = 8.5;
dicke = 2;

// Vorlage scan der Auer-Box als SVG
// rotate(v=[0,0,1], a=0.2) import("scan.svg", dpi=96);
$fn = 100;

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
    translate([157.5, 12.6, 0]) cube([17, 5, 4 + dicke/2]);
    translate([150.8, 4, 0]) cube([3, 10, 4 + dicke/2]);
    translate([156.2, 4, 0]) cube([3, 10, 4 + dicke/2]);
    
    translate([2, 1.1, 0]) cube([20, 3, 4 + dicke/2]);
    translate([30, 15, 0]) cube([20, 3, 4 + dicke/2]);
    
}

module name(str) {
    translate([-9, font_offset + font_size/2, -dicke/2 + 0.29]) rotate(v=[1,0,0],a=180) linear_extrude(0.3) translate([15, 0]) 
       text(str, size=font_size, font = font);
}

if (view == "part1" || view == "preview") {
    color("black") name(name);  // part 1 
}
if (view == "part2" || view == "preview") {
    color("limegreen") difference() { tag(); name(name); }  //part 2
}
