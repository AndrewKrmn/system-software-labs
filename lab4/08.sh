#!/bin/bash
for (( x=5,y=25; x<=20 && y>5; x+=5,y-=5 ))
do
 echo "Поточне значення x=$x і y=$y"
done

