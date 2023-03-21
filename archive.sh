#!/bin/bash
# Script qui effectue une sauvegarde d'un dossier personnel d'utilisateur en tant
# qu'administrateur. Le script doit tester qu'il s'exécute avec les droits administrateur
# au préalable. La sauvegarde est nommée avec la date au format ISO 8601 La sauvegarde
# est copiée sur un serveur distant de votre entreprise par un canal sécurisé

# Vérifier si le script s'exécute en tant que root
# la variable $EUID rapporte l'id du compte servant à exécuter le script. 0 est la valeur pour root

if [ "$EUID" -ne 0 ] # si $EUID n'est pas égal à 0 (root)
then
    echo "Le script doit être exécuté en tant que root. Exemple: sudo ./archive.sh"
    exit # arrête le script
else 
    echo "Le script est exécuté en tant que root"
fi

# Vérifier que le dossier de l'utilisateur demandé en paramètre existe

if [ -d "/home/$1" ] # vérifie qu'un "dossier" portant le nom de l'argument 1 existe
then
    echo "Dossier personnel existant."
else
    echo "Aucun dossier personnel trouvé."
    exit # arrête le script
fi

tarname=$1$(date +"%Y-%m-%dT%H:%M:%S%z").tar.gz # $tarname stocke le nom du fichier tar de destination. Le nom est arg1 + date ISO 860 + tar.gz

echo "Création de la sauvegarde :" $tarname # écrit la valeur de $tarname dans le terminal

tar -zcf /var/tmp/$tarname --absolute-names /home/$1 # effectue la sauvegarde du dossier de l'argument dans /var/tmp

if [[ -f /var/tmp/$tarname ]] # teste si le fichier $tarname existe bien dans /var/tmp
    then
        echo "Sauvegarde terminée avec succès"
    else
        echo "Une erreur est survenue durant la sauvegarde"
        exit # arrête le script
fi

echo "Transfert de la sauvegarde sur le serveur de sauvegarde ..."

scp -i ~/.ssh/archive_rsa.pub /var/tmp/$tarname simplon@10.10.40.34:/home/Simplon/$tarname # transfert de l'archive via scp et une clé ssh vers un serveur distant

if [[ $? == 0 ]] # teste si la valeur de $? (code de résultat d'exécution de la dernière commande) est égal à 0 (succès)
    then
        echo "Transfert terminé avec succès"
    else
        echo "Une erreur est survenue durant le transfert"
        exit # arrête le script
