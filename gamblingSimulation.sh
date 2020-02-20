#!/bin/bash -x
echo Welcome to Gambling game.

#Constatns declared
STAKE=100
BET=1
WIN=1
#Varriables declared.
money=$STAKE
minimumStake=$(($STAKE-$STAKE/2))
maximumStake=$(($STAKE+$STAKE/2))

while (( $money != $minimumStake && $money != $maximumStake ))
do
	random=$((RANDOM%2))
	if (( random==WIN ))
	then
		echo win
		((money++))
	else
		echo loose
		((money--))
	fi
done
