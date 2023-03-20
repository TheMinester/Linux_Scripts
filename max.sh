#!/bin/bash
# Script qui prend deux entiers en arguments et qui affiche le plus grand des deux.

if [ $1 \> $2 ] # si argument 1 est plus grand que arg 2
then
    echo $1 # si oui écrire argument 1
else
    echo $2 # si non écrire arg 2
fi