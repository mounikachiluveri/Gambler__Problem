#!/bin/bash -x
echo "Wellcome to Gambling Simulation"
STAKE_AMOUNT=100
bet_rupees_per_game=1
WIN=1
function play()
            {
                bet=$(( RANDOM % 2 ))
                        if [[ $bet -eq $WIN ]]
                        then
                             echo "win"
                        else
                              echo "loose"
                        fi
           }
 play

