# 📱 Obsidian Randomizer Mobile

Мобильная версия элегантного виджета для случайного просмотра заметок из вашего Obsidian хранилища.

## ✨ Особенности

- 🎯 **Адаптивный дизайн** - оптимизирован для мобильных устройств
- 🔄 **Случайные заметки** - мгновенный доступ к любой заметке из вашего vault
- ⚙️ **Гибкие настройки** - настройка пути к хранилищу
- 🎨 **Современный UI** - темная тема в стиле Obsidian
- 📝 **Поддержка Markdown** - заголовки, жирный текст, курсив, зачеркивание
- 💾 **Автосохранение** - запоминает ваши настройки между запусками
- 📱 **Кроссплатформенность** - работает на Android и iOS

## 🚀 Быстрый старт

### Установка Flutter

1. **Скачайте Flutter SDK:** https://flutter.dev/docs/get-started/install
2. **Добавьте Flutter в PATH**
3. **Установите зависимости:** `flutter doctor`

### Запуск проекта

```bash
# Установите зависимости
flutter pub get

# Запустите на Android
flutter run

# Запустите на iOS (только на macOS)
flutter run -d ios
```

### Сборка APK

```bash
# Сборка debug APK
flutter build apk --debug

# Сборка release APK
flutter build apk --release
```

## 🎮 Использование

### Основные функции
- **🎲 Случайная** - показать случайную заметку
- **← → Навигация** - кнопки вперед/назад по истории
- **⚙️ Настройки** - настройка пути к хранилищу

### Настройка пути к хранилищу
1. Откройте настройки (⚙️)
2. Введите путь к папке с заметками Obsidian
3. Нажмите "Сохранить"

### Стандартные пути для Android:
- `/storage/emulated/0/Documents/Obsidian Vault`
- `/storage/emulated/0/Download/Obsidian Vault`
- `/storage/emulated/0/Obsidian Vault`

## 🔧 Системные требования

- **Android**: API 21+ (Android 5.0+)
- **iOS**: iOS 12.0+
- **Flutter**: 3.0.0+

## 📁 Структура проекта

```
lib/
├── main.dart                 # Главный файл приложения
├── screens/
│   ├── randomizer_screen.dart    # Главный экран
│   └── settings_screen.dart      # Экран настроек
└── services/
    ├── config_service.dart       # Управление настройками
    └── file_service.dart         # Работа с файлами
```

## 🛠️ Зависимости

- **flutter_markdown** - отображение Markdown
- **shared_preferences** - сохранение настроек
- **path_provider** - работа с файловой системой
- **http** - HTTP запросы
- **url_launcher** - открытие ссылок

## 📝 Лицензия

Этот проект распространяется под лицензией MIT. См. файл [LICENSE](LICENSE) для подробностей. 