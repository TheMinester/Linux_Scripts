#!/bin/bash
# Script qui dit si la chaîne passée en argument contient des voyelles, des consonnes ou des
# chiffres

i=0 # variable booléenne pour les chiffres
v=0 # variable booléenne pour les voyelles
c=0 # variable booléenne pour les consonnes


if [[ $1 =~ [0-9] ]] # si arg1 contient un chiffre
then
    i=1 # i = true
fi

if [[ $1 == *[AEIOUaeiou]* ]] # si arg1 contient une voyelle
then
    v=1 # v = true
fi

if [[ $1 == *[BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz]* ]] # si arg1 contient une consonne
then
    c=1 # c = true
fi


if [[ $i == 1 && $v == 1 && $c == 1 ]] # si contient Voyelle Consonne Chiffre
    then
        echo "Le mot contient : Voyelle Consonne Chiffre"
elif [[ $i == 1 && $v == 0 && $c == 0 ]] # si contient Chiffre
    then
        echo "Le mot contient : Chiffre"
elif [[ $i == 0 && $v == 0 && $c == 1 ]] # si contient Consonne
    then
        echo "Le mot contient : Consonne"
elif [[ $i == 0 && $v == 1 && $c == 0 ]] # si contient Voyelle
    then
        echo "Le mot contient : Voyelle"
elif [[ $i == 1 && $v == 1 && $c == 0 ]] # si contient Voyelle Chiffre
    then
        echo "Le mot contient : Voyelle Chiffre"
elif [[ $i == 1 && $v == 0 && $c == 1 ]] # si contient Consonne Chiffre
    then
        echo "Le mot contient : Consonne Chiffre"
elif [[ $i == 0 && $v == 1 && $c = 1 ]] # si contient Voyelle Consonne
    then
        echo "Le mot contient : Voyelle Consonne"
fi