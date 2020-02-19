#!/bin/bash -x
echo Welcome to Gambling game.

stake=100
money=$stake
bet=1
random=$((RANDOM%2))
if (( random==bet ))
then
	echo win
	((money++))
else
	echo loose
	((money--))
fi
echo $money
