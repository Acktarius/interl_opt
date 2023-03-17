#!/bin/bash

if [ ! -f log.txt ]; then
	echo "error : log.txt doesn't exist or this script is not place in the appropriate folder" 
	exit 1
else
ld=( $(grep -F 'Interleave' log.txt| cut -d " " -f 7 | cut -d "/" -f 1) )
act=( $(grep -F 'Interleave' log.txt| cut -d " " -f 7 | cut -d "/" -f 2 | cut -d "." -f 1) )
declare -a q
declare -a in
declare -a r
declare -i z=${#ld[@]}
for (( n=0 ; n<z ; n++ ));do
	q[$n]=$(( act[$n]/ld[$n] ))
	in[$n]=$(( q[$n]-1 ))
	if (( in[$n] <= 0 )); then
		r[$n]=40
	else	
		r[$n]=$(( 100*((1000*act[$n]-(q[$n]*1000*ld[$n]))/in[$n])/(1000*ld[$n]) ))
	fi
	echo "last delay: ${ld[$n]} ,interval ${in[$n]}, ${r[$n]}%"
done
if (( z <= 12 )); then
	echo "not enought data, means you're probably already doing good"
else
	result=${r[0]}
	for (( n=1 ; n<${#ld[@]} ; n++ ));do
		result=$(( result+r[$n] ))
	done
	result=$(( result/$z ))
	echo -e "\n------ results ------"
	echo -e "try to set interleave at $result\n"
fi
fi
exit
