#!/bin/bash -x
echo "Wellcome to Gambling Simulation"
STAKE_AMOUNT=100
bet_rupees_per_game=1
WIN=1
current_amount=0
PERCENTAGE=50
amount=0
NUMBER_OF_DAYS=20
maximumAmount=0
function play()
            {
              declare -a day
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
                                  break;
                             fi
                    done
               done

              maximumAmount=$(($STAKE_AMOUNT*$NUMBER_OF_DAYS))
       if [[ $amount -lt $maximumAmount ]]
       then
             echo "Gambler Lost by $(($maximumAmount-$amount))"
       else
             echo "Gambler Won by $(($amount-$maximumAmount))$"
       fi
   }
     play
       
