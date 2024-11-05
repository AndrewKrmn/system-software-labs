#!/bin/bash

while getopts "a:bd:" opt; do
  case $opt in
    a)
      echo "Опція -a зі значенням $OPTARG"
      ;;
    b)
      echo "Опція -b активована"
      ;;
    d)
      echo "Опція -d зі значенням $OPTARG"
      ;;
    \?)
      echo "Невідома опція: -$OPTARG"
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

if [ $# -gt 0 ]; then
  echo "Залишкові аргументи: $@"
else
  echo "Немає залишкових аргументів"
fi

