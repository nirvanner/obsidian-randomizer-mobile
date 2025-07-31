import 'dart:io';
import 'package:obsidian_randomizer/services/config_service.dart';

class FileService {
  static List<String> _mdFiles = [];
  static List<String> _history = [];
  static int _historyIndex = -1;
  
  static List<String> get mdFiles => _mdFiles;
  static List<String> get history => _history;
  static int get historyIndex => _historyIndex;
  
  static Future<void> findMdFiles() async {
    _mdFiles.clear();
    final vaultPath = ConfigService.vaultPath;
    final directory = Directory(vaultPath);
    
    if (!await directory.exists()) {
      return;
    }
    
    await _scanDirectory(directory);
  }
  
  static Future<void> _scanDirectory(Directory dir) async {
    try {
      final entities = await dir.list().toList();
      
      for (final entity in entities) {
        if (entity is File && entity.path.endsWith('.md')) {
          _mdFiles.add(entity.path);
        } else if (entity is Directory) {
          await _scanDirectory(entity);
        }
      }
    } catch (e) {
      // Игнорируем ошибки доступа
    }
  }
  
  static String? getRandomNote() {
    if (_mdFiles.isEmpty) return null;
    
    final random = DateTime.now().millisecondsSinceEpoch;
    final index = random % _mdFiles.length;
    final filePath = _mdFiles[index];
    
    _addToHistory(filePath);
    return filePath;
  }
  
  static void _addToHistory(String filePath) {
    if (_historyIndex == -1 || (_history.isNotEmpty && _history[_historyIndex] != filePath)) {
      _history = _history.take(_historyIndex + 1).toList();
      _history.add(filePath);
      _historyIndex++;
    }
  }
  
  static String? getNextNote() {
    if (_historyIndex < _history.length - 1) {
      _historyIndex++;
      return _history[_historyIndex];
    } else {
      return getRandomNote();
    }
  }
  
  static String? getPrevNote() {
    if (_historyIndex > 0) {
      _historyIndex--;
      return _history[_historyIndex];
    }
    return null;
  }
  
  static Future<String?> readNoteContent(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        return await file.readAsString();
      }
    } catch (e) {
      // Игнорируем ошибки чтения
    }
    return null;
  }
  
  static String getNoteTitle(String filePath) {
    final fileName = filePath.split('/').last;
    return fileName.replaceAll('.md', '');
  }
  
  static String getNotePath(String filePath) {
    final vaultPath = ConfigService.vaultPath;
    if (filePath.startsWith(vaultPath)) {
      return filePath.substring(vaultPath.length + 1);
    }
    return filePath;
  }
} 