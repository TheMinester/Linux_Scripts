#!/bin/bash
# Script qui affiche son nom, puis le chemin par lequel il a été appelé,
# puis tout ses arguments un à un.

# Auteur: Duteil Julien
# Créé le: 20/03/2023

# $(basename "$0") permet d'obtenir le nom du script exécuté
# $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) permet
#d'obtenir le chemin du script

# $# est la variable préexistante contenant le nombre d'arguments

# Arguments passed to a script are processed in the same order
# in which they’re sent. The indexing of the arguments starts at one,
# and the first argument can be accessed inside the script using $1

# Boucle for: c commence avec la valeur 1 et tant que c est inférieur ou égal
# au nombre de paramètres alors c augmente de 1
# La valeur de l'argument dont l'ordre est défini par c
# est affichée à chaque itération

# ${!c} permet de changer le nom de la variable $ dynamiquement en
# prenant la valeur de c ce qui donne $=$1, $=$2, etc
 
name=$(basename "$0")
dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )$

echo "nom:" $name
echo "chemin:" $dir

for (( i=1; i<=$#; i++ ))
do
  echo "argument" $i ":" ${!i}
done
