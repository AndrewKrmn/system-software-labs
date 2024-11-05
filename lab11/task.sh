#!/bin/bash

file="$1"

if [[ ! -f "$file" ]]; then
  echo "Файл не знайдено!"
  exit 1
fi

grep -E '^(.).*\1$' "$file"

