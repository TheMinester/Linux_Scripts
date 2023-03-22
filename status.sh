#!/bin/bash
# Script qui affiche si le service fourni en argument est présent
# et si le service est alors en cours ou arrêté

# Auteur: Duteil Julien
# Créé le: 20/03/2023

# La commande suivante se base sur le fait que chaque commande retourne un status après son exécution
# Si la commande n'échoue pas le message "Service $1 is present and running." est affiché dans le terminal
# Si la commande échoue le message "Service $1 is not present." est affiché dans le terminal

pgrep -x $1 >/dev/null && echo "Service $1 is present and running." || echo "Service $1 is not present."
