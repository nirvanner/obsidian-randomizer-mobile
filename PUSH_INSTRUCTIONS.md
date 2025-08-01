# 🚀 Инструкция по пуше на GitHub

## 1. Создайте репозиторий на GitHub

1. Перейдите на https://github.com
2. Нажмите "New repository"
3. Название: `obsidian-randomizer-mobile`
4. Описание: `Мобильная версия виджета для случайного просмотра заметок из Obsidian хранилища`
5. Выберите "Public"
6. НЕ ставьте галочки на README, .gitignore, license
7. Нажмите "Create repository"

## 2. Добавьте remote и запушите

После создания репозитория выполните эти команды:

```bash
# Добавьте remote (замените YOUR_USERNAME на ваш GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/obsidian-randomizer-mobile.git

# Запушите код
git push -u origin main
```

## 3. Если у вас другой username

Если ваш GitHub username не `nirvanner`, замените в команде выше:
- `YOUR_USERNAME` → ваш реальный GitHub username

## 4. Пример для username "example":
```bash
git remote add origin https://github.com/example/obsidian-randomizer-mobile.git
git push -u origin main
```

## 5. Готово! 🎉

После успешного пуша ваш проект будет доступен на GitHub по адресу:
`https://github.com/YOUR_USERNAME/obsidian-randomizer-mobile` 