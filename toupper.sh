#!/bin/bash
# Script  qui passe tous ses arguments en majuscule. Il n'affiche rien si
# il n'y a pas d'argument

# La variable sert à stocker la ligne qui sera écrit dans le terminal à la fin de la boucle for

for (( i=1; i<=$#; i++ )) # la boucle s'exécute le nombre de fois qu'il y a d'arguments
do
    str=${!i} # la variable $str prend la valeur de l'arguement actuellement traité, ex: $str=$1, $str=$2, etc 
    upper="$upper $(printf "$str" | awk '{ print toupper($0) }')" # Transpose chaque argument en majuscule puis l'ajoute à $upper
done

echo $upper # écrit $upper dans le terminal