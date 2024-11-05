#!/bin/bash
echo "Введіть любе число"
read n
if [[ ( $n -eq 15 || $n -eq 45 ) ]]
then
echo "Ви виграли"
else
echo "Ви програли"
fi

