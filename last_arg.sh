#!/bin/bash
# Script qui affiche le dernier argument avec lequel il est invoqué

# $# est le nombre d'argument donnés à l'exécution du script
# Il suffit d'afficher le numéro d'argument équivalent à ce nombre

echo ${!#}