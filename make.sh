#!/bin/bash

# Überprüfen, ob das Betriebssystem macOS ist
if [[ "$(uname)" == "Darwin" ]]; then
    oscad="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
else
    # Für andere Betriebssysteme (angenommen, hier ist Linux)
    oscad="openscad"
fi
echo "OpenSCAD: $oscad"
## declare an array variable
declare -a arr=("kater" "Martin Herwig")

## now loop through the above array
for i in "${arr[@]}"
do
    echo "Name: $i"
    cat AuerNameTag.scad > t.scad
    echo >> t.scad
    echo 'name("'$i'");' >> t.scad
    echo "compiling Tag_${i}_1.stl"
    $oscad -o "Tag_${i}_1.stl" t.scad
    cat AuerNameTag.scad > t.scad
    echo >> t.scad
    echo 'difference() { tag(); name("'$i'"); }'  >> t.scad
    echo "compiling Tag_${i}_1.stl"
    $oscad -o "Tag_${i}_2.stl" t.scad
done
