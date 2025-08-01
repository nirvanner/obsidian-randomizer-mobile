# 🔨 Как собрать APK файл

## 🚀 Автоматическая сборка

### Требования:
- Flutter SDK 3.0.0+
- Android Studio
- Android SDK

### Команды:
```bash
# Установите зависимости
flutter pub get

# Соберите APK
flutter build apk --release

# APK будет создан в:
# build/app/outputs/flutter-apk/app-release.apk
```

## 📦 Альтернативные способы

### 1. Через Android Studio
1. Откройте проект в Android Studio
2. Build → Build Bundle(s) / APK(s) → Build APK(s)
3. APK будет в `build/app/outputs/flutter-apk/`

### 2. Через Flutter DevTools
1. Запустите `flutter run`
2. Откройте DevTools
3. Performance → Build APK

### 3. Онлайн сборка
- [FlutterFlow](https://flutterflow.io/) - онлайн IDE
- [Codemagic](https://codemagic.io/) - CI/CD для Flutter

## 📱 Создание Release на GitHub

1. **Соберите APK** (см. выше)
2. **Перейдите в репозиторий** на GitHub
3. **Releases** → **Create a new release**
4. **Загрузите APK файл**
5. **Опубликуйте релиз**

## 🎯 Готовый APK

После сборки APK будет доступен для скачивания в разделе Releases:
`https://github.com/nirvanner/obsidian-randomizer-mobile/releases` 