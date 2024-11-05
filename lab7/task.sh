#!/bin/bash

API_URL="https://api.minfin.com.ua/mb/58aaf7e86aca2c0d6ac528b106bd45209922a65a/" 
EMAIL="lublukvassyaktaras@gmail.com"

response=$(curl -s $API_URL)

if [ $? -ne 0 ]; then
    echo "Не вдалося отримати дані з API."
    exit 1
fi

# Перевірка наявності даних
if [ -z "$response" ]; then
    echo "Отримано порожню відповідь від API."
    exit 1
fi

# Обробка JSON
currency_rates=$(echo "$response" | jq -r '.[] | "\(.currency): ask \(.ask), bid \(.bid)"')

if [ $? -ne 0 ]; then
    echo "Помилка обробки даних JSON."
    exit 1
fi

subject="Поточний курс валют на $(date +'%Y-%m-%d')"
body="Поточний курс валют:\n\n$currency_rates"

echo -e "$body" | mail -s "$subject" "$EMAIL"

echo "Лист надіслано на $EMAIL"

