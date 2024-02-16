#!/bin/bash

echo $$ > .pid
rez=1

add()
{
    rez=$(($rez+2))
}

multiply()
{
    rez=$(($rez*2))
}

sub()
{
    rez=$(($rez-2))
}

div()
{
    rez=$(($rez/2))
}

finish()
{
    echo "finish"
    exit
}

trap 'add' USR1
trap 'multiply' USR2
trap 'sub' SIGURG
trap 'div' SIGPWR
trap 'finish' SIGTERM
#Я выбрал эти 2 сигнала потому, что реакция программы по умолчанию на них - игнорирование.
while true; do
    sleep 1
    echo $rez
done


