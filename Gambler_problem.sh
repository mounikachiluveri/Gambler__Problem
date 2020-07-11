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
    function lukiestOrunlukiest()
         {
        declare -a lucky
        declare -a unlucky
        luckyDayKey=0
        unluckyDayKey=0
        for (( dayOfMonth=1; dayOfMonth<=30; dayOfMonth++ ))
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

function play()
            {
            declare -a day
            declare -a day1
            for((dayOfMonth=1;dayOfMonth<=NUMBER_OF_DAYS;dayOfMonth++))
            do
                       current_amount=STAKE_AMOUNT
                     while((1))
                     do
                        bet=$(( RANDOM % 2 ))
                        if [[ $bet -eq $WIN ]]
                        then
                                current_amount=$(($current_amount + $bet_rupees_per_game))
                        else
                                current_amount=$(($current_amount - $bet_rupees_per_game))
                        fi

                            if [[ $current_amount -eq $(($(($STAKE_AMOUNT*$PERCENTAGE))/100)) || $current_amount -eq $(($STAKE_AMOUNT+$(($(($STAKE_AMOUNT*$PERCENTAGE))/100)))) ]]
                            then
                             amount=$(($amount+$current_amount))
                             day[$dayOfMonth]=$current_amount
                             day1[$dayOfMonth]=$amount
                                break;
                             fi
                    done
                if [[ $current_amount -gt $STAKE_AMOUNT ]]
                then
                        let daysWon++
                        echo "Day $dayOfMonth won  : $current_amount$:   Total amount:$amount"
                else
                        let daysLost++
                        echo "Day $dayOfMonth loss  : $current_amount$ :  Total amount:$amount"
                fi
                check=${day[$dayOfMonth]}

          done
                        lukiestOrunlukiest
                        
         }
play
