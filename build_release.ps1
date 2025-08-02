# PowerShell скрипт для сборки APK
Write-Host "🚀 Начинаем сборку APK для Obsidian Randomizer Mobile" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Cyan

# Проверяем, что мы в правильной директории
if (-not (Test-Path "pubspec.yaml")) {
    Write-Host "❌ Ошибка: pubspec.yaml не найден. Убедитесь, что вы в корне проекта Flutter." -ForegroundColor Red
    exit 1
}

Write-Host "🧹 Шаг 1: Очистка проекта..." -ForegroundColor Yellow
flutter clean

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Ошибка при очистке проекта" -ForegroundColor Red
    exit 1
}

Write-Host "📦 Шаг 2: Получение зависимостей..." -ForegroundColor Yellow
flutter pub get

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Ошибка при получении зависимостей" -ForegroundColor Red
    exit 1
}

Write-Host "🔨 Шаг 3: Сборка APK..." -ForegroundColor Yellow
flutter build apk --release

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Ошибка при сборке APK" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "✅ Сборка завершена успешно!" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "📁 APK файл создан:" -ForegroundColor White
Write-Host "   build/app/outputs/flutter-apk/app-release.apk" -ForegroundColor White
Write-Host ""
Write-Host "📤 Следующие шаги:" -ForegroundColor Yellow
Write-Host "1. Загрузите APK файл в GitHub Release" -ForegroundColor White
Write-Host "2. Обновите README.md с ссылкой на скачивание" -ForegroundColor White
Write-Host "3. Создайте QR-код для быстрого доступа" -ForegroundColor White
Write-Host ""

# Показываем размер файла
$apkPath = "build/app/outputs/flutter-apk/app-release.apk"
if (Test-Path $apkPath) {
    $fileSize = (Get-Item $apkPath).Length
    $fileSizeMB = [math]::Round($fileSize / 1MB, 2)
    Write-Host "🎯 Размер APK: $fileSizeMB MB" -ForegroundColor Green
} else {
    Write-Host "⚠️ APK файл не найден" -ForegroundColor Yellow
} 