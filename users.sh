#!/bin/bash
# Script qui affiche dans l'ordre alphabétique la liste des utilisateurs dont des
# processus sont en cours d'exécution sur le système

sorted=$( (ps -p * | grep "UID" | cut -f 2 | id -nu) | sort ) # récupère la liste de tous les utilisateurs ayant des processus actifs, les trient puis stocke dans $sorted

echo $sorted # ecrit dans le terminla la valeur de $sorted