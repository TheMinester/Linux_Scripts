#!/bin/bash
# Script qui affiche les entiers de 1 à 'argument'

# Arguments passed to a script are processed in the same order
# in which they’re sent. The indexing of the arguments starts at one,
# and the first argument can be accessed inside the script using $1
 
# Boucle for: c commence avec la valeur 1 et tant que c est inférieur ou égal
# au paramètre alors c augmente de 1
# La valeur de c est affichée à chaque itération

for (( c=1; c<=$1; c++ ))
do
  echo $c
done