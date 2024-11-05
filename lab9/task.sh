#!/bin/bash

temp=$(mktemp)
temp2=$(mktemp)

function diskspace {
  df -h > "$temp"
  dialog --backtitle "Сис. Адмін Меню" --title "Використання диску" --textbox "$temp" 20 60
}

function users {
  who > "$temp"
  dialog --backtitle "Сис. Адмін Меню" --title "Зареєстровані користувачі" --textbox "$temp" 20 60
}

function memory {
  cat /proc/meminfo > "$temp"
  dialog --backtitle "Сис. Адмін Меню" --title "Використання пам'яті" --textbox "$temp" 20 60
}

tput setaf 1    
tput setab 4   
clear           

while true; do
  dialog --backtitle "Системне Меню" \
  --title "Червоний текст на синьому фоні" \
  --menu "Виберіть опцію:" 15 50 5 \
  1 "Показати використання диску" \
  2 "Показати зареєстрованих користувачів" \
  3 "Показати використання пам'яті" \
  0 "Вийти" 2> "$temp2"

  if [ $? -ne 0 ]; then
    break
  fi

  choice=$(<"$temp2")

  case $choice in
    1) diskspace ;;
    2) users ;;
    3) memory ;;
    0) break ;;
    *) dialog --msgbox "Невірний вибір" 10 30 ;;
  esac
done

tput sgr0
clear

rm -f "$temp" "$temp2"

