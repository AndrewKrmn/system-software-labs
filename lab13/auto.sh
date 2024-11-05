#!/usr/bin/expect -f

# Змінні з командного рядка
set user_name [lindex $argv 0]
set booking_date [lindex $argv 1]
set number_of_guests [lindex $argv 2]
set user_email [lindex $argv 3]
set user_phone [lindex $argv 4]

# Установлення тайм-ауту
set timeout -1

# Запуск bash сценарію
spawn ./hotel.sh

# Очікування запитань та автоматичні відповіді
expect "Привіт, будь ласка, введіть ваше ім'я:"
send -- "$user_name\r"

expect "Яка дата бронювання (YYYY-MM-DD)?"
send -- "$booking_date\r"

expect "Скільки людей ви бронюєте?"
send -- "$number_of_guests\r"

expect "Ваша електронна пошта?"
send -- "$user_email\r"

expect "Ваш номер телефону?"
send -- "$user_phone\r"

# Очікування кінця файлу
expect eof

