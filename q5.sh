#!/bin/bash 

Word=$1

echo "Part A:"

echo $Word | rev




echo;
echo "Part B:"

reverse=$(echo $Word | rev)

transform=$(echo $reverse | tr '[A-Y]Z' '[B-Z]A' | tr '[a-y]z' '[b-z]a')
echo $transform





echo;
echo "Part C:"

fhalf=${Word:0:${#Word}/2}
shalf=${Word:${#Word}/2}

rfhalf=$(echo $fhalf | rev)
string="$rfhalf$shalf"

echo $string
