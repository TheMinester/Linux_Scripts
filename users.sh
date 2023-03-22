#!/bin/bash
# Script qui affiche dans l'ordre alphabétique la liste des utilisateurs dont des
# processus sont en cours d'exécution sur le système

# Auteur: Duteil Julien
# Créé le: 22/03/2023

# ps aux récupère la liste de tous les processus en cours avec le nom de l'utilisateur qui l'exécute
# awk '{ print $1 }' récupère la première colonne qui contient les noms des utilisateurs
# sed '1 d' enlève la première valeur de la colonne qui est le nom de la colonne, "USER"
# sort trie les utilisateurs par ordre alphabétique
# uniq permet d'enlever les doublons

ps aux | awk '{ print $1 }' | sed '1 d' | sort | uniq
