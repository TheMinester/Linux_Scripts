#!/bin/bash
# Script qui prend deux entiers en arguments et qui affiche le plus grand des deux.

# Auteur: Duteil Julien
# Créé le: 20/03/2023

if [[ $# != 2 ]] # teste si le nombre d'argument est bien 2
then
    echo "Il y a plus de 2 arguments"
    exit
fi

reg='^[0-9]+$' # regex signifiant "contient un nombre"
if [[ $1 =~ $re && $2 =~ $reg ]] # teste si $1 et $2 sont bien des entiers
then
    :
else
   echo "Au moins un des deux arguments n'est pas un entier"
   exit
fi

if [ $1 \> $2 ] # si argument 1 est plus grand que arg 2
then
    echo $1 # si oui écrire argument 1
else
    echo $2 # si non écrire arg 2
fi
