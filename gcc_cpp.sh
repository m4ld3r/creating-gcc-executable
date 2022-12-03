#!/usr/bin/bash
echo -n "Enter the number of compilable items(>=2 — you have a project with header files): "
read ch
echo " "
if [ $ch -ne 1 ]
then
	echo "Enter PATH to all includes cpp files separated by a space:"
	read -a mass
	echo "Enter PATH to main file:"
	read way
else
	echo "Enter the PATH to the compiled file: "
	read way
	sleep 2
fi
echo " "
echo "Enter PATH to dir with all .o files:\n"
read PATH
cd $PATH

echo " "
echo "Let's go. For watch result program press ctrl+z"

while :
	do
		if [ $ch -ne 1 ]
		then
			g++ -c ${mass[@]}
			g++ -c $way
			g++ *.o -lm -o ${way%%.cpp}
		else
			g++ $way -lm -o ${way%%.cpp}
		fi
		chmod +x ${way%%.cpp}
		sleep 10
		#здесь однажды будет сбока exe и нормальный запуск...
		trap "./${way%%.cpp}" SIGTSTP
	done