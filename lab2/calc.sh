#!/bin/bash
if [ $# -ne 4 ]; then
  echo "Використання: ./calc.sh a b c d"
  exit 1
fi

a=$1
b=$2
c=$3
d=$4

sum_ab=$(./sum.sh $a $b)

sub_cd=$(./sub.sh $c $d)

mul_ad=$(./mul.sh $a $d)

mul_sum_sub=$(./mul.sh $sum_ab $sub_cd)

if [ $mul_ad -eq 0 ]; then
  echo "Помилка: ділення на нуль неможливе"
  exit 1
fi

result=$(($mul_sum_sub / $mul_ad))
echo "Результат: $result"

