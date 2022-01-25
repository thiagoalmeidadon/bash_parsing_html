#!/bin/bash
clean(){
    rm *.html
}
parsing(){
    grep "a href" index.html | cut -d '"' -f 2 | grep "http://" > $host.txt
}

if [ "$1" == "" ]
then
    echo "Exemplo de uso: $0 google.com"
else
    host=$1
    wget $host 1>/dev/null 2>/dev/null 
    parsing
    clean
fi


