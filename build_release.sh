#!/bin/bash

echo "🚀 Начинаем сборку APK для Obsidian Randomizer Mobile"
echo "=================================================="

# Проверяем, что мы в правильной директории
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Ошибка: pubspec.yaml не найден. Убедитесь, что вы в корне проекта Flutter."
    exit 1
fi

echo "🧹 Шаг 1: Очистка проекта..."
flutter clean

if [ $? -ne 0 ]; then
    echo "❌ Ошибка при очистке проекта"
    exit 1
fi

echo "📦 Шаг 2: Получение зависимостей..."
flutter pub get

if [ $? -ne 0 ]; then
    echo "❌ Ошибка при получении зависимостей"
    exit 1
fi

echo "🔨 Шаг 3: Сборка APK..."
flutter build apk --release

if [ $? -ne 0 ]; then
    echo "❌ Ошибка при сборке APK"
    exit 1
fi

echo ""
echo "✅ Сборка завершена успешно!"
echo "=================================================="
echo "📁 APK файл создан:"
echo "   build/app/outputs/flutter-apk/app-release.apk"
echo ""
echo "📤 Следующие шаги:"
echo "1. Загрузите APK файл в GitHub Release"
echo "2. Обновите README.md с ссылкой на скачивание"
echo "3. Создайте QR-код для быстрого доступа"
echo ""
echo "🎯 Размер APK:"
ls -lh build/app/outputs/flutter-apk/app-release.apk 