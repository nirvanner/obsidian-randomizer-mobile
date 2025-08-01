import 'package:flutter/material.dart';
import 'package:obsidian_randomizer/services/config_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _vaultPathController;

  @override
  void initState() {
    super.initState();
    _vaultPathController = TextEditingController(text: ConfigService.vaultPath);
  }

  @override
  void dispose() {
    _vaultPathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        actions: [
          TextButton(
            onPressed: _saveSettings,
            child: const Text('Сохранить', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVaultPathSection(),
            const SizedBox(height: 24),
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildVaultPathSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Путь к хранилищу Obsidian',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              'Укажите путь к папке с вашими заметками Obsidian',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _vaultPathController,
              decoration: const InputDecoration(
                labelText: 'Путь к хранилищу',
                border: OutlineInputBorder(),
                hintText: '/storage/emulated/0/Documents/Obsidian Vault',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _resetToDefault,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Сбросить'),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF404244)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _browseFolder,
                    icon: const Icon(Icons.folder_open),
                    label: const Text('Выбрать'),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Информация',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              '• Приложение ищет .md файлы в указанной папке\n'
              '• Поддерживается навигация по истории\n'
              '• Markdown разметка отображается корректно\n'
              '• Настройки сохраняются автоматически',
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  void _resetToDefault() {
    _vaultPathController.text = '/storage/emulated/0/Documents/Obsidian Vault';
  }

  void _browseFolder() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выбор папки'),
        content: const Text(
          'Для выбора папки введите путь вручную или используйте стандартные пути:\n\n'
          '/storage/emulated/0/Documents/Obsidian Vault\n'
          '/storage/emulated/0/Download/Obsidian Vault\n'
          '/storage/emulated/0/Obsidian Vault',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _saveSettings() async {
    await ConfigService.setVaultPath(_vaultPathController.text);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Настройки сохранены'), backgroundColor: Colors.green),
      );
      Navigator.pop(context);
    }
  }
} 