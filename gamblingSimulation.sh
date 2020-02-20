#!/bin/bash -x
echo Welcome to Gambling game.

#Constatns declared
STAKE=100
BET=1
WIN=1
#Logic for days and win loss check.
for(( day=1; day<=20; day++ ))
do
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
			echo loss
			((money--))
		fi
		total=$(($money-$STAKE))
	done
	totalPossibility[day]=$money
	dayWinLoose[day]=$total
done
#Displaying results.
echo "Total possibilities of win and loss is -: "${totalPossibility[@]}
echo "Days won and Loss by -: "${dayWinLoose[@]}
