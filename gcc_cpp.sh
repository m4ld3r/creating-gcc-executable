#!/usr/bin/bash
echo "Enter the PATH to the compiled file: "
read way
cowsay -f stimpy "I start fucking through..."
sleep 2
echo "3"
sleep 2
echo "2"
sleep 2
echo "1"
sleep 2
echo "Let's go. For watch result program press ctrl+z"
sleep 2
while :
    do
	g++ $way -lm -o ${way%%.cpp}
	chmod +x ${way%%.cpp}
	trap "./${way%%.cpp}" SIGTSTP
    done