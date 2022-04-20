#!/bin/bash

IFS=',' read -r -a array <<< "$1"

for index in "${!array[@]}"
do
	for ind in "${!array[@]}"
	do
		if (( $ind>$index ))
		then 
			if (( ${array[index]}>${array[ind]} ))
			then 
				temp=${array[ind]}
				array[ind]=${array[index]}
				array[index]=$temp
			fi
		fi
	done
done

for element in "${array[@]}"
do
	echo "$element"
done
