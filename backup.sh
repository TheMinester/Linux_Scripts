#!/bin/bash
# Script  qui crée une copie de chaque fichier présent dans le répertoire courant suivi du
# préfixe .bak. Les fichiers déjà sauvegardés seront ignorés. Le script indique le nombre
# de fichiers sauvegardés à la fin.


nbfilebak=0 # initialisation de la valeur du nombre de fichiers sauvegardés
dir=`pwd` # stockage du dossier d'exécution du script dans la variable $dir

for file in ./* # Pour chaque objet dans le dossier d'exécution
do 
    if [ -d "$file" ] # vérification pour être sûr que $file n'est pas un dossier
    then
        continue # si $file est un dossier, passer l'itération
    fi

    filename=${file}.bak # création de la variable comprenant le nom du fichier avec l'extension .bak

    if [[ -f $filename || ${file: -4} == .bak ]] # teste si le fichier "nom du fichier" + .bak existe déjà OU si le nom du fichier se termine par .bak
    then
        : # si oui ne rien faire
    else
        cp "$file" "$file.bak" # si non faire une copie du fichier en ajoutant l'extension.bak
        nbfilebak=$((nbfilebak+1)) # +1 au nombre de fichiers sauvegardés
    fi
done

echo "$nbfilebak fichier(s) sauvegardé(s)" # écrire dans le terminal le nombre de fichiers sauvegardés