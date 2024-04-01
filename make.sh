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
declare -a arr=("mAdEx" "Martin Herwig")

## now loop through the above array
for i in "${arr[@]}"
do
    echo "Name: $i"
    echo '{"fileFormatVersion": "1", "parameterSets": { "p1": {"view": "part1", "name": "'$i'"}, "p2": {"view": "part2", "name": "'$i'"}}}' > settings.json
    echo "compiling Tag_${i}_1.stl"
    $oscad -o "Tag_${i}_1.stl" -p settings.json -P p1 AuerNameTag.scad
    echo "compiling Tag_${i}_2.stl"
    $oscad -o "Tag_${i}_2.stl" -p settings.json -P p2 AuerNameTag.scad
done
