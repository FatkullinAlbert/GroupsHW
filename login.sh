#!/bin/bash
# Скрипт для ограничения доступа по времени и праздникам

HOLIDAYS_FILE="/usr/local/etc/holidays.conf"

# Получаем текущий день недели и дату
DAY_OF_WEEK=$(date +%a)
CURRENT_DATE=$(date +%d_%m)

# Проверяем, является ли день праздничным
if [ -f "$HOLIDAYS_FILE" ]; then
    if grep -qw "$CURRENT_DATE" "$HOLIDAYS_FILE"; then
        # Сегодня праздник — доступ разрешён всем
        exit 0
    fi
fi

# Если сегодня выходной (суббота или воскресенье)
if [ "$DAY_OF_WEEK" = "Sat" ] || [ "$DAY_OF_WEEK" = "Sun" ]; then
    # Проверяем, входит ли пользователь в группу admin
    if getent group admin | grep -qw "$PAM_USER"; then
        exit 0   # администратору можно
    else
        exit 1   # остальным запрет
    fi
else
    # Будний день — доступ всем
    exit 0
fi
