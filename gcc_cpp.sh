#!/usr/bin/bash

echo -n "Enter the number of compilable items:"
read ch

if [ $ch -ne 1 ]
then
	echo "\nEnter all header files separated by a space:"
	read -a mass
	echo "\nEnter main file:"
	read main
	echo "\nEnter PATH to dir with all .o files:\n"
	read PATH
	cd $PATH
	echo " "
	while :
	do
		g++ -c ${mass[@]}
		g++ -c $main
		g++ *.o -lm -o ${main%%.cpp}
	done
else
	echo "\nEnter the PATH to the compiled file: "
	read way
	echo "Let's go. For watch result program press ctrl+z"
	sleep 2
	while :
	do
		g++ $way -lm -o ${way%%.cpp}
		chmod +x ${way%%.cpp}
		trap "./${way%%.cpp}" SIGTSTP
	done
fi