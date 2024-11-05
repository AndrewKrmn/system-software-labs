#!/bin/bash

check_name() {
    if [[ -z "$1" ]]; then
        echo "Ім'я не може бути пустим. Спробуйте ще раз."
        return 1
    fi
    return 0
}

check_date() {
    if [[ ! "$1" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "Неправильний формат дати. Використовуйте формат YYYY-MM-DD."
        return 1
    fi
    return 0
}

check_people() {
    if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -le 0 ]; then
        echo "Кількість людей повинна бути додатним цілим числом."
        return 1
    fi
    return 0
}

check_email() {
    if [[ ! "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Неправильний формат електронної пошти."
        return 1
    fi
    return 0
}

check_phone() {
    if ! [[ "$1" =~ ^[0-9]{10}$ ]]; then
        echo "Номер телефону повинен містити 10 цифр."
        return 1
    fi
    return 0
}

echo "Привіт, будь ласка, введіть ваше ім'я:"
read name
while ! check_name "$name"; do
    read name
done

echo "Яка дата бронювання (YYYY-MM-DD)?"
read date
while ! check_date "$date"; do
    read date
done

echo "Скільки людей ви бронюєте?"
read people
while ! check_people "$people"; do
    read people
done

echo "Ваша електронна пошта?"
read email
while ! check_email "$email"; do
    read email
done

echo "Ваш номер телефону (10 цифр)?"
read phone
while ! check_phone "$phone"; do
    read phone
done

echo "Дякуємо за бронювання, $name! Ви забронювали номер на $date для $people людей. "
echo "Ваші контактні дані: $email, $phone."

