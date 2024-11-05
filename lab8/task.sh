#!/bin/bash

read -p "Введіть число a: " a
read -p "Введіть систему числення b (2-36): " b
read -p "Введіть цільову систему числення d (2-36): " d

decimal_value=$(echo "ibase=$b; $a" | bc)

converted_value=$(echo "obase=$d; $decimal_value" | bc)

echo "Число $a у системі числення $b дорівнює $converted_value у системі числення $d."

