#!/bin/bash
# Script qui affiche les entiers de 1 à 'argument'

# Auteur: Duteil Julien
# Créé le: 20/03/2023

# Arguments passed to a script are processed in the same order
# in which they’re sent. The indexing of the arguments starts at one,
# and the first argument can be accessed inside the script using $1
 
# Boucle for: c commence avec la valeur 1 et tant que c est inférieur ou égal
# au paramètre alors c augmente de 1
# La valeur de c est affichée à chaque itération

for (( i=1; i<=$1; i++ ))
do
  echo $i
done
