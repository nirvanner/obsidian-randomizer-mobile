import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  static const String _vaultPathKey = 'vault_path';
  static const String _defaultVaultPath = '/storage/emulated/0/Documents/Obsidian Vault';
  
  static late SharedPreferences _prefs;
  
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  static String get vaultPath {
    return _prefs.getString(_vaultPathKey) ?? _defaultVaultPath;
  }
  
  static Future<void> setVaultPath(String path) async {
    await _prefs.setString(_vaultPathKey, path);
  }
  
  static Future<void> resetToDefaults() async {
    await _prefs.clear();
  }
} 