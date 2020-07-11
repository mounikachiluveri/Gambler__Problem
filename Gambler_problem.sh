#!/bin/bash -x
echo "Wellcome to Gambling Simulation"
PERCENTAGE=50
STAKE_AMOUNT=100
NUMBER_OF_DAYS=30
daysWon=0
daysLost=0
WIN=1
bet_rupees_per_game=1
current_amount=0
amount=0
maximumAmount=0
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
                        echo "Day $dayOfMonth won  : $current_amount$ : Total amount:$amount"
                else
                        let daysLost++
                        echo "Day $dayOfMonth loss  : $current_amount$ : Total amount: $amount"
                fi
                check=${day[$dayOfMonth]}

          done
                        
         }
play

