# 📱 Как установить Obsidian Randomizer на телефон

## 🚀 Быстрая установка (Рекомендуется)

### 1. Скачайте готовый APK
- Перейдите в раздел [Releases](https://github.com/nirvanner/obsidian-randomizer-mobile/releases)
- Скачайте файл `obsidian-randomizer-v1.0.0.apk`

### 2. Установите на Android
1. **Включите "Неизвестные источники":**
   - Настройки → Безопасность → Неизвестные источники
   - Или Настройки → Приложения → Специальный доступ → Установка неизвестных приложений

2. **Откройте APK файл** и нажмите "Установить"

3. **Запустите приложение**

### 3. Настройте путь к Obsidian
1. Откройте приложение
2. Нажмите ⚙️ (настройки)
3. Укажите путь к вашему Obsidian vault:
   - `/storage/emulated/0/Documents/Obsidian Vault`
   - `/storage/emulated/0/Download/Obsidian Vault`
   - `/storage/emulated/0/Obsidian Vault`

## 🔧 Альтернативные способы установки

### Способ 1: Через ADB (для разработчиков)
```bash
# Подключите телефон по USB
adb install obsidian-randomizer-v1.0.0.apk
```

### Способ 2: Сборка из исходников
```bash
git clone https://github.com/nirvanner/obsidian-randomizer-mobile.git
cd obsidian-randomizer-mobile
flutter pub get
flutter build apk --release
```

## 📋 Требования
- **Android 5.0+** (API 21+)
- **Разрешения:** Чтение файлов
- **Место:** ~50 MB свободного места

## 🎯 Использование
- **🎲 Случайная** - показать случайную заметку
- **← → Навигация** - кнопки вперед/назад по истории
- **⚙️ Настройки** - настройка пути к хранилищу

## ❓ Проблемы?
- Убедитесь, что путь к Obsidian vault указан правильно
- Проверьте, что у приложения есть разрешение на чтение файлов
- Перезапустите приложение после изменения настроек 