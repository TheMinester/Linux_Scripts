#!/bin/bash
# Script qui affiche ses arguments dans l'ordre alphabétique suivi d'un retour à la ligne

# Auteur: Duteil Julien
# Créé le: 20/03/2023

for arg in "$@" # pour chaque argument
do
    if [[ "${arg}" =~ [^a-zA-Z] ]] # test si l'argument ne contient pas autre chose que des lettres
    then
        echo "l'argument \"$arg\" ne contient pas que des lettres"
        exit
    else
        :
    fi
done

for arg in "$@" # pour chaque argument
do
    echo "$arg" # écrire l'argument actuellement traité
done | sort -f # envoyer le résultat vers sort qui trie les arguments et par défaut écrit avec un saut de ligne. -f ignore la casse.
