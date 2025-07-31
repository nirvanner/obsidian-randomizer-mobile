# 🚀 Инструкция по публикации мобильной версии в GitHub

## 1. Создание репозитория

1. Перейдите на [GitHub](https://github.com)
2. Нажмите "New repository"
3. Название: `obsidian-randomizer-mobile`
4. Описание: `Мобильная версия элегантного виджета для случайного просмотра заметок из Obsidian хранилища`
5. Выберите "Public"
6. НЕ ставьте галочки на README, .gitignore, license (у нас уже есть)
7. Нажмите "Create repository"

## 2. Загрузка файлов

```bash
# Клонируйте репозиторий
git clone https://github.com/YOUR_USERNAME/obsidian-randomizer-mobile.git
cd obsidian-randomizer-mobile

# Скопируйте все файлы из папки obs_vidg_for_phone
# Добавьте файлы в git
git add .

# Сделайте первый коммит
git commit -m "Initial commit: Obsidian Randomizer Mobile v1.0.0"

# Отправьте на GitHub
git push origin main
```

## 3. Настройка Releases

1. Перейдите в раздел "Releases"
2. Нажмите "Create a new release"
3. Tag: `v1.0.0`
4. Title: `Obsidian Randomizer Mobile v1.0.0 - Мобильная версия`
5. Описание:
```
## 🎉 Первый релиз мобильной версии!

### ✨ Что нового:
- 📱 Полнофункциональная мобильная версия
- 🎨 Адаптивный дизайн для мобильных устройств
- 📝 Поддержка Markdown разметки
- ⚙️ Настройки пути к хранилищу
- 🔄 Навигация по истории заметок
- 💾 Автосохранение настроек

### 📱 Платформы:
- Android (APK)
- iOS (через App Store)
- Web (браузер)

### 🛠️ Технологии:
- Flutter 3.32.8
- Dart 3.8.1
- Material Design
```

## 4. Структура проекта

```
obsidian-randomizer-mobile/
├── lib/
│   ├── main.dart                 # Главный файл (1.2KB, 40 строк)
│   ├── screens/
│   │   ├── randomizer_screen.dart    # Главный экран (8.5KB, 200 строк)
│   │   └── settings_screen.dart      # Настройки (6.2KB, 150 строк)
│   └── services/
│       ├── config_service.dart       # Конфигурация (1.1KB, 25 строк)
│       └── file_service.dart         # Работа с файлами (4.8KB, 100 строк)
├── android/                    # Android конфигурация
├── web/                       # Web конфигурация
├── pubspec.yaml               # Зависимости Flutter
├── README.md                  # Документация
├── LICENSE                    # MIT лицензия
└── .gitignore                # Исключения Git
```

## 5. Сборка APK

```bash
# Установите Flutter SDK
# Скачайте с: https://flutter.dev/docs/get-started/install

# Добавьте Flutter в PATH
export PATH="$PATH:/path/to/flutter/bin"

# Проверьте установку
flutter doctor

# Установите зависимости
flutter pub get

# Сборка debug APK
flutter build apk --debug

# Сборка release APK
flutter build apk --release
```

## 6. Готово! 🎉

Ваш мобильный проект готов к использованию! Пользователи смогут:
- Скачать исходный код
- Установить Flutter: `flutter doctor`
- Установить зависимости: `flutter pub get`
- Запустить: `flutter run`
- Собрать APK: `flutter build apk --release`

## 7. Дополнительные настройки

### Issues и Discussions
- Включите Issues в настройках репозитория
- Включите Discussions для обсуждений

### GitHub Pages (опционально)
1. Перейдите в Settings → Pages
2. Source: "Deploy from a branch"
3. Branch: `main`
4. Folder: `/docs`
5. Создайте папку `docs` с документацией

### CI/CD (опционально)
Можно настроить автоматическую сборку APK через GitHub Actions 