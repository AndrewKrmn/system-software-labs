#!/bin/bash
echo "Перенаправлення дескриптора 0 в 6"
exec 6<&0
echo "aaa" > 8.txt
echo "bbb" >> 8.txt
echo "ccc" >> 8.txt
exec 6<&0
exec 0< 8.txt
count=1
 while read line
 do
 echo "Рядок #$count: $line"
 count=$[ $count + 1 ]
 done
echo "Перенаправлення дескриптора 6 в 0"
exec 0<&6
read -p "Ви закінчили роботу (y/n)? " answer
case $answer in
 Y|y) echo "Бувайте здорові";;
 N|n) echo "Вибачте, це кінець.";;
esac
rm 8.txt
