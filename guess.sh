#!/bin/bash
# Script où Il faut deviner le nombre mystère
# Celui-ci est compris entre 1 et 1000. Le joueur a dix essais.

number=$(( $RANDOM % 1000 + 1 )) # générer un nombre aléatoire entre 1 et 1000

for (( i=1; i<=10; i++ )) # la boucle s'exécute 10x
do
    echo "Entrez un nombre entre 1 et 1000 :"
    read input # recueillir la valeur demandée et la stocker dans la variable $input

    if [ $input \> $number ] # si le nombre entré est plus grand que le nombre aléatoire
    then
        echo "Le nombre est plus petit" # si oui écrire "Le nombre est plus petit"
    else # si non
        if [ $input \= $number ] # si le nombre entré est le même que le nombre aléatoire
        then
            echo "vous avez gagné" # si oui écrire "vous avez gagné"
            exit # terminer le script en cas de victoire
        else
            echo "le nombre est plus grand" # si non écrire"Le nombre est plus grand"
        fi
    fi
done