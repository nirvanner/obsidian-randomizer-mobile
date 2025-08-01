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

## 🚀 Быстрая установка

### 📥 Скачать готовый APK
1. Перейдите в раздел [Releases](https://github.com/nirvanner/obsidian-randomizer-mobile/releases)
2. Скачайте `obsidian-randomizer-v1.0.0.apk`
3. Установите на Android (включите "Неизвестные источники")
4. Настройте путь к Obsidian vault в приложении

### 📋 Требования
- **Android 5.0+** (API 21+)
- **Разрешения:** Чтение файлов
- **Место:** ~50 MB свободного места

## 🎮 Использование

- **🎲 Случайная** - показать случайную заметку
- **← → Навигация** - кнопки вперед/назад по истории
- **⚙️ Настройки** - настройка пути к хранилищу

### Стандартные пути для Android:
- `/storage/emulated/0/Documents/Obsidian Vault`
- `/storage/emulated/0/Download/Obsidian Vault`
- `/storage/emulated/0/Obsidian Vault`

## 🔧 Для разработчиков

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

## 📖 Документация

- [Инструкция по установке](INSTALLATION_GUIDE.md)
- [Как собрать APK](BUILD_APK.md) 