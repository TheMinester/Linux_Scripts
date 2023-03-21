#!/bin/bash
# Script qui affiche ses paramètres dans l'ordre alphabétique suivi d'un retour à la ligne

sorted=$(printf "$@" | sort -f) # trier la liste des arguments "$@" et la stocker dans $sorted

echo $sorted # ecrit dans le terminal la valeur de $sorted
