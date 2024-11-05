#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Використання: ./task.sh <шлях_до_каталогу> <дата (YYYY-MM-DD)>"
  exit 1
fi

directory=$1
date=$2

if [ ! -d "$directory" ]; then
  echo "Каталог $directory не існує."
  exit 1
fi

echo "Файли і каталоги, старіші за $date:"
find "$directory" ! -newermt "$date" -type f -o -type d

