#!/bin/bash -x
echo "Wellcome to Gambling Simulation"
PERCENTAGE=50
STAKE_AMOUNT=100
NUMBER_OF_DAYS=30
start=1
maximum=0
minimum=0
daysWon=0
daysLost=0
WIN=1
bet_rupees_per_game=1
current_amount=0
amount=0
maximumAmount=0
function lukiestOrunlukiest(){
     declare -a lucky
     declare -a unlucky
     luckyDayKey=0
     unluckyDayKey=0
       for (( dayOfMonth=1; dayOfMonth<=NUMBER_OF_DAYS; dayOfMonth++ ))
       do
           if [[ ${day[$dayOfMonth]} == $maximum ]]
           then
           lucky[$luckyDayKey]=$dayOfMonth
           let luckyDayKey++
           elif [[ ${day[$dayOfMonth]} -gt $maximum ]]
           then
           lucky=( )
           maximum=${day[$dayOfMonth]}
           luckyDayKey=0
           lucky[$luckyDayKey]=$(($dayOfMonth))
           let luckyDayKey++
           fi
           if [[ ${day[$dayOfMonth]} == $minimum ]]
           then
           unlucky[$unluckyDayKey]=$dayOfMonth
           let unluckyDayKey++
           elif [[ ${day[$dayOfMonth]} -lt $minimum ]]
           then
           unlucky=( )
           minimum=${day[$dayOfMonth]}
           unluckyDayKey=0
           unlucky[$unluckyDayKey]=$(($dayOfMonth))
           let unluckyDayKey++
           fi
      done
      for key in ${lucky[@]}
      do
      echo "Lukiest day is $key"
      done
      echo
      for key2 in ${unlucky[@]}
      do
      echo "Unlukiest day is $key2"
      done
}

function continueOrStop()
{
   while [[ $start -gt 0 ]]
   do
   maximumAmount=$(($STAKE_AMOUNT*$NUMBER_OF_DAYS))
     if [[ $totalAmount -lt $maximumAmount ]]
     then
     echo "Gambler Lost by $(($maximumAmount-$totalAmount))"
     start=-1;
     else
     echo "Gambler Won by $(($totalAmount-$maximumAmount))$"
     echo "You won $(($totalAmount-$maximumAmount)), do you want to continue ?"
     read -p "Press 1 for Yes 2 for No : " continue
        case $continue in
             1)
                play
                ;;
             2)
                start=-1
                break
                ;;
             *)
               echo "Enter valid input"
               ;;
         esac
     fi
 done
}

function play(){
   declare -a winamount
   declare -a looseamount
   declare -a day
   declare -a day1
   for((dayOfMonth=1;dayOfMonth<=NUMBER_OF_DAYS;dayOfMonth++))
   do
   currentAmount=$(($currentAmount + $STAKE_AMOUNT))
   Percentage=$(($currentAmount/2))
   lowerlimit=$(($currentAmount - $Percentage))
   upperlimit=$(($currentAmount + $Percentage))
     while((1))
     do
     bet=$(( RANDOM % 2 ))
       if [[ $bet -eq $WIN ]]
       then
       currentAmount=$(($currentAmount + $bet_rupees_per_game))
       else
       currentAmount=$(($currentAmount - $bet_rupees_per_game))
       fi
         if [[ $currentAmount -eq $lowerlimit || $currentAmount -eq $upperlimit ]]
         then
         #amount=$(($amount+$current_amount))
         day[$dayOfMonth]=$currentAmount
         day1[$dayOfMonth]=$amount
         break;
         fi
     done
 if [[ $currentAmount -gt $(($STAKE_AMOUNT * $dayOfMonth)) ]]
         then
         let daysWon++
         echo "Day $dayOfMonth won  : $currentAmount$"
         winAmount=$(($winAmount + $currentAmount))
         else
         let daysLost++
         echo "Day $dayOfMonth loss  : $currentAmount$ "
          looseAmount=$(($looseAmount + $currentAmount))
         fi
   done
        echo " Winamount=$winAmount LooseAmount=$looseAmount"
        if [[ $Winamount -gt $looseAmount ]]
        then
           totalAmount=$(($Winamount-$looseAmount))
        else
           totalAmount=$(($Winamount-$looseAmount))
        fi

lukiestOrunlukiest
continueOrStop
}
play


