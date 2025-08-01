# 📱 Obsidian Randomizer Mobile

Мобильная версия виджета для случайного просмотра заметок из Obsidian хранилища.

## ✨ Особенности

- 🎯 Адаптивный дизайн для мобильных устройств
- 🔄 Случайные заметки из вашего vault
- ⚙️ Настройка пути к хранилищу
- 🎨 Темная тема в стиле Obsidian
- 📝 Поддержка Markdown
- 💾 Автосохранение настроек
- 📱 Кроссплатформенность

## 🚀 Быстрый старт

### Установка Flutter
1. Скачайте Flutter SDK: https://flutter.dev/docs/get-started/install
2. Добавьте Flutter в PATH
3. Выполните: `flutter doctor`

### Запуск проекта
```bash
flutter pub get
flutter run
```

### Сборка APK
```bash
flutter build apk --release
```

## 🎮 Использование

- **🎲 Случайная** - показать случайную заметку
- **← → Навигация** - кнопки вперед/назад по истории
- **⚙️ Настройки** - настройка пути к хранилищу

### Стандартные пути для Android:
- `/storage/emulated/0/Documents/Obsidian Vault`
- `/storage/emulated/0/Download/Obsidian Vault`
- `/storage/emulated/0/Obsidian Vault`

## 🔧 Системные требования

- Android: API 21+ (Android 5.0+)
- iOS: iOS 12.0+
- Flutter: 3.0.0+

## 📁 Структура проекта

```
lib/
├── main.dart                 # Главный файл
├── screens/
│   ├── randomizer_screen.dart    # Главный экран
│   └── settings_screen.dart      # Настройки
└── services/
    ├── config_service.dart       # Конфигурация
    └── file_service.dart         # Работа с файлами
```

## 📝 Лицензия

MIT License. См. файл [LICENSE](LICENSE). 