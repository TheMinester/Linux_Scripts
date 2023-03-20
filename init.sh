#!/bin/bash
# Script qui crée dans le répertoire courant un répertoire nommé dans l'argument d'appel.
# Le script doit ensuite créer deux fichiers README.md et change.log dans le dossier
# et afficher le contenu du dossier

mkdir $1 # créer le dossier avec le nom de l'argument 1 dans le dossier d'exécution du script
echo "Dossier créé =" $1 # écrire dans le terminal le nom du dossier créé

touch ./$1/README.md ./$1/change.log # créer les fichier README.md et change.log dans le dossier

ls -la $1/ # affiche le contenu du dossier