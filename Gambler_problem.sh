#!/bin/bash -x
echo "Wellcome to Gambling Simulation"
STAKE_AMOUNT=100
bet_rupees_per_game=1
WIN=1
current_amount=0
PERCENTAGE=50
function play()
            {
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
                                  echo "resign for the day"
                                  break;
                            fi
                   done
         }
      play
