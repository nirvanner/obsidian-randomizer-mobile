# 🚀 Полная инструкция по релизу APK

## 📋 Пошаговый план действий

### 1️⃣ Подготовка проекта (ДО релиза)

#### Шаг 1: Обновление версии
```bash
# В pubspec.yaml измените версию на новую
version: 1.0.0+1  # Увеличьте номер версии
```

#### Шаг 2: Проверка конфигурации Android
Убедитесь, что в `android/app/build.gradle` есть правильные настройки:
```gradle
android {
    compileSdkVersion 34
    
    defaultConfig {
        applicationId "com.example.obsidian_randomizer"
        minSdkVersion 21  // Android 5.0+
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
    }
}
```

#### Шаг 3: Сборка APK
```bash
# Очистите предыдущие сборки
flutter clean

# Получите зависимости
flutter pub get

# Соберите релизную версию APK
flutter build apk --release
```

### 2️⃣ Создание релиза на GitHub

#### Шаг 1: Подготовка файлов
После сборки APK будет создан файл:
```
build/app/outputs/flutter-apk/app-release.apk
```

#### Шаг 2: Создание релиза
1. Перейдите в ваш GitHub репозиторий
2. Нажмите "Releases" в правом меню
3. Нажмите "Create a new release"
4. Заполните поля:
   - **Tag version:** `v1.0.0`
   - **Release title:** `Obsidian Randomizer Mobile v1.0.0`
   - **Description:** Добавьте описание изменений
5. Загрузите файл `app-release.apk`
6. Нажмите "Publish release"

### 3️⃣ Настройка для пользователей

#### Шаг 1: Обновление README
Добавьте в README.md секцию для скачивания:

```markdown
## 📥 Скачать APK

### Прямая ссылка на скачивание:
[Скачать APK v1.0.0](https://github.com/YOUR_USERNAME/YOUR_REPO/releases/download/v1.0.0/app-release.apk)

### QR-код для скачивания:
[Добавьте QR-код, ведущий на страницу релиза]
```

#### Шаг 2: Создание QR-кода
Создайте QR-код, ведущий на страницу релиза:
```
https://github.com/YOUR_USERNAME/YOUR_REPO/releases/latest
```

### 4️⃣ Инструкция для пользователей

#### Для Android:
1. **Скачайте APK** по ссылке выше
2. **Разрешите установку** из неизвестных источников:
   - Настройки → Безопасность → Неизвестные источники
3. **Установите приложение** из скачанного файла
4. **Настройте путь** к Obsidian vault в приложении

#### Стандартные пути для Android:
- `/storage/emulated/0/Documents/Obsidian Vault`
- `/storage/emulated/0/Download/Obsidian Vault`
- `/storage/emulated/0/Obsidian Vault`

### 5️⃣ Автоматизация процесса

#### Создание скрипта сборки:
Создайте файл `build_release.sh`:

```bash
#!/bin/bash

echo "🧹 Очистка проекта..."
flutter clean

echo "📦 Получение зависимостей..."
flutter pub get

echo "🔨 Сборка APK..."
flutter build apk --release

echo "✅ APK готов!"
echo "📁 Файл: build/app/outputs/flutter-apk/app-release.apk"
echo "📤 Загрузите его в GitHub Release"
```

#### Создание GitHub Actions (опционально):
Создайте `.github/workflows/build.yml`:

```yaml
name: Build APK

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.16.0'
      - run: flutter pub get
      - run: flutter build apk --release
      - uses: actions/upload-artifact@v3
        with:
          name: app-release
          path: build/app/outputs/flutter-apk/app-release.apk
```

## 🎯 Результат

После выполнения всех шагов:
1. ✅ Пользователи смогут скачать APK одним кликом
2. ✅ QR-код позволит быстро перейти к скачиванию
3. ✅ Процесс установки будет простым и понятным
4. ✅ Автоматическая сборка при новых релизах

## 📱 Дополнительные улучшения

### Для лучшего UX:
1. **Добавьте скриншоты** приложения в README
2. **Создайте видео-инструкцию** по установке
3. **Добавьте FAQ** с частыми вопросами
4. **Создайте Telegram-бот** для автоматической отправки APK

### Для безопасности:
1. **Подпишите APK** цифровой подписью
2. **Добавьте проверку целостности** файла
3. **Укажите хеш-сумму** APK файла

---

**Важно:** APK нужно собрать ДО создания релиза на GitHub, так как файл должен быть готов к загрузке при публикации релиза. 