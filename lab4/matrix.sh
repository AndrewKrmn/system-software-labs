#!/bin/bash


mas1=(1 2 3 4 5
      1 3 5 7 9)

mas2=(6 7 8 9 10
      5 4 3 2 1)

result=()

rows=2
cols=5

for ((i=0; i<rows; i++)); do
    for ((j=0; j<cols; j++)); do
        index=$((i * cols + j))
        result[index]=$((mas1[index] * mas2[index]))
    done
done
echo "Результат множення матриць:"
for ((i=0; i<rows; i++)); do
    for ((j=0; j<cols; j++)); do
        index=$((i * cols + j))
        echo -n "${result[index]} "
    done
    echo ""  
done

