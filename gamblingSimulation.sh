#!/bin/bash -x
echo Welcome to Gambling game.

#Constatns declared
STAKE=100
BET=1
WIN=1
declare -A Day
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
			((money++))
		else
			((money--))
		fi
		total=$(($money-$STAKE))
	done
	totalMoney=$(($totalMoney+$total))
	totalPossibility[day]=$money
	dayWinLoose[day]=$total
	Day[Day$day]=$totalMoney
done
#Displaying results.
echo "Total possibilities of win and loss is -: "${totalPossibility[@]}
echo "Days won and Loss by -: "${dayWinLoose[@]}

#Function to sort the dictionary Day has been added.
function sorting() {
	for key in ${!Day[@]}
	do
		echo  $key '-:' ${Day[$key]}
	done | sort -rn -k3
}
echo "$(sorting)"
echo "Luckiest Day is:-  $(sorting | head -1)"
echo "Unluckiest Day is:-  $(sorting | tail -1)"
