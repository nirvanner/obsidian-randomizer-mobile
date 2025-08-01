# 🌐 Создание APK онлайн (без Android SDK)

## 🚀 Способ 1: FlutterFlow (Рекомендуется)

1. **Перейдите на** https://flutterflow.io/
2. **Создайте аккаунт** (бесплатно)
3. **Создайте новый проект**
4. **Скопируйте код** из нашего проекта:
   - `lib/main.dart`
   - `lib/screens/randomizer_screen.dart`
   - `lib/screens/settings_screen.dart`
   - `lib/services/config_service.dart`
   - `lib/services/file_service.dart`
5. **Соберите APK** через интерфейс FlutterFlow

## 🔧 Способ 2: Codemagic

1. **Перейдите на** https://codemagic.io/
2. **Подключите GitHub репозиторий**
3. **Настройте сборку** для Android
4. **Запустите сборку** - APK будет создан автоматически

## 📱 Способ 3: GitHub Actions

Добавьте файл `.github/workflows/build.yml`:

```yaml
name: Build APK
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.0.0'
    - run: flutter pub get
    - run: flutter build apk --release
    - uses: actions/upload-artifact@v2
      with:
        name: release-apk
        path: build/app/outputs/flutter-apk/app-release.apk
```

## 🎯 Способ 4: Локальная сборка (если есть Android Studio)

1. **Установите Android Studio**
2. **Установите Android SDK**
3. **Выполните команды:**
   ```bash
   flutter pub get
   flutter build apk --release
   ```

## 📦 Готовый APK

После любого из способов APK будет доступен для загрузки в GitHub Releases! 