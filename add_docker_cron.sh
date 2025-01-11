#!/bin/bash

# Шлях до Docker
DOCKER_PATH=$(which docker)

# Імена контейнерів
CONTAINER_1="opl_worker"
CONTAINER_2="opl_scraper"

# Перевірка, чи існує контейнер
if [ -z "$DOCKER_PATH" ]; then
    echo "Docker не знайдений на системі."
    exit 1
fi

# Формуємо cron-завдання
CRON_JOB="*/30 * * * * sudo $DOCKER_PATH restart $CONTAINER_1 $CONTAINER_2"

# Додаємо завдання в crontab
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron-завдання додано для перезавантаження контейнерів $CONTAINER_1 та $CONTAINER_2 кожні 30 хвилин."
