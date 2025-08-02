# ⚡ Быстрая сборка APK для GitHub релиза

## 🎯 Цель: Создать APK за 5 минут и загрузить в GitHub релиз

### 1️⃣ Сборка APK через FlutterFlow (Самый быстрый способ)

#### Шаг 1: Регистрация
1. Перейдите на https://flutterflow.io/
2. Создайте бесплатный аккаунт
3. Войдите в систему

#### Шаг 2: Создание проекта
1. Нажмите "Create New Project"
2. Выберите "Flutter Project"
3. Назовите проект "obsidian-randomizer-mobile"

#### Шаг 3: Импорт кода
1. Скопируйте код из файлов:
   - `lib/main.dart`
   - `lib/screens/randomizer_screen.dart`
   - `lib/screens/settings_screen.dart`
   - `lib/services/config_service.dart`
   - `lib/services/file_service.dart`

2. Вставьте код в соответствующие файлы в FlutterFlow

#### Шаг 4: Настройка зависимостей
В pubspec.yaml добавьте:
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  http: ^1.1.0
  path_provider: ^2.1.1
  shared_preferences: ^2.2.2
  url_launcher: ^6.2.1
  flutter_markdown: ^0.6.18
```

#### Шаг 5: Сборка APK
1. Нажмите "Build" → "APK"
2. Выберите "Release" версию
3. Дождитесь сборки (2-3 минуты)
4. Скачайте готовый APK

### 2️⃣ Загрузка в GitHub релиз

#### Шаг 1: Перейдите в GitHub
1. Откройте ваш репозиторий: https://github.com/nirvanner/obsidian-randomizer-mobile
2. Нажмите "Releases" в правом меню

#### Шаг 2: Создание релиза
1. Нажмите "Create a new release"
2. Заполните поля:
   - **Tag version:** `v1.0.1`
   - **Release title:** `Obsidian Randomizer Mobile v1.0.1`
   - **Description:** 
     ```
     🎉 Новый релиз Obsidian Randomizer Mobile!
     
     ✨ Что нового:
     - Исправлена совместимость с новыми версиями Flutter
     - Улучшен пользовательский интерфейс
     - Добавлена поддержка PWA
     
     📱 Как установить:
     1. Скачайте APK файл ниже
     2. Включите "Неизвестные источники" в настройках
     3. Установите APK
     4. Настройте путь к Obsidian vault
     
     🎯 Особенности:
     - Случайные заметки из Obsidian
     - Навигация по истории
     - Темная тема
     - Поддержка Markdown
     ```

#### Шаг 3: Загрузка APK
1. Перетащите скачанный APK файл в область загрузки
2. Переименуйте файл в `obsidian-randomizer-v1.0.1.apk`
3. Нажмите "Publish release"

### 3️⃣ Обновление README

Добавьте в README.md секцию для скачивания:

```markdown
## 📥 Скачать APK

### Прямая ссылка на скачивание:
[Скачать APK v1.0.1](https://github.com/nirvanner/obsidian-randomizer-mobile/releases/download/v1.0.1/obsidian-randomizer-v1.0.1.apk)

### Через GitHub Releases:
1. Перейдите в раздел [Releases](https://github.com/nirvanner/obsidian-randomizer-mobile/releases)
2. Скачайте `obsidian-randomizer-v1.0.1.apk`
3. Установите на Android (включите "Неизвестные источники")
```

## 🎉 Результат

После выполнения всех шагов:
- ✅ Пользователи смогут скачать APK одним кликом
- ✅ Установка займет 30 секунд
- ✅ Приложение будет работать как нативное
- ✅ Процесс похож на App Store

---

**Время выполнения: 5-10 минут** ⏱️ 