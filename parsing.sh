#!/bin/bash
clean(){
    rm *.html
    echo "Limpando arquivo html"
    echo -e "\n"
}
parsing(){
    grep "a href" index.html | cut -d '"' -f 2 | grep "http://" | cut -d "/" -f 3 > $host.txt
    echo "Resultados salvos em $host.txt"
    echo -e "\n"
}
hosts(){
    echo "Resolvendo URLs em: $host"
    echo " "
    for h in $(cat $host.txt); do
    host $h | grep "has address";
    done
    echo -e "\n"
}

if [ "$1" == "" ]
then
    echo "Exemplo de uso: $0 google.com"
else
    echo " "
    host=$1
    wget $host 1>/dev/null 2>/dev/null 
    parsing
    hosts
    clean
fi


