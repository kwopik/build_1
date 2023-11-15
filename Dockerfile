# Используем базовый образ Python
FROM python:3.8-slim

# Устанавливаем рабочую директорию в /app
WORKDIR /app

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем текущий каталог в /app в контейнере
COPY . .

# Запускаем приложение при старте контейнера
CMD ["python", "app.py"]
