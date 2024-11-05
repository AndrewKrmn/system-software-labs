#!/bin/bash

compare_with_comm() {
    echo "Порівняння за допомогою comm..."
    comm -12 <(sort "$1") <(sort "$2") 1>&1 | tee >(cat 1>&2) >/dev/null
}

compare_with_awk() {
    echo "Порівняння за допомогою awk..."
    awk 'NR==FNR{a[$0]; next} {if ($0 in a) print $0 > "/dev/stdout"; else print $0 > "/dev/stderr"}' "$1" "$2"
}

if [ "$#" -ne 2 ]; then
    echo "Використання: $0 <файл1> <файл2>"
    exit 1
fi

echo "Виберіть метод порівняння:"
echo "1) Використати comm"
echo "2) Використати awk"
read -p "Ваш вибір (1 або 2): " choice

case $choice in
    1)
        compare_with_comm "$1" "$2"
        ;;
    2)
        compare_with_awk "$1" "$2"
        ;;
    *)
        echo "Неправильний вибір. Будь ласка, виберіть 1 або 2."
        exit 1
        ;;
esac

