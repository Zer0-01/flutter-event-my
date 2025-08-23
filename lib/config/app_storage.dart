import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static final _log = AppLogger.getLogger("AppLocalStorage");

  // Singleton instance
  static final AppLocalStorage _instance = AppLocalStorage._internal();
  factory AppLocalStorage() => _instance;
  AppLocalStorage._internal();

  SharedPreferences? _prefsInstance;

  /// Shared Preferences private instance
  Future<SharedPreferences> get _prefs async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  /// For unit testing
  @visibleForTesting
  void setPreferencesInstance(SharedPreferences prefs) {
    _prefsInstance = prefs;
  }

  /// Save data to local storage
  Future<bool> save(String key, dynamic value) async {
    final prefs = await _prefs;
    try {
      if (value is String) {
        await prefs.setString(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      } else if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value is List<String>) {
        await prefs.setStringList(key, value);
      } else {
        throw Exception("Unsupported value type");
      }

      await AppLocalStorageCached.loadCache();
      _log.trace("Saved data to local storage {} {}", [key, value]);
      return true;
    } catch (e) {
      _log.error("Error saving data to local storage: {}, {}", [key, e]);
      return false;
    }
  }

  /// Read data
  Future<dynamic> read(String key) async {
    final prefs = await _prefs;
    return prefs.get(key);
  }

  /// Remove data
  Future<bool> remove(String key) async {
    try {
      final prefs = await _prefs;
      await prefs.remove(key);
      await AppLocalStorageCached.loadCache();
      _log.trace("Removed data from local storage {}", [key]);
      return true;
    } catch (e) {
      _log.error("Error removing data from local storage: {}, {}", [key, e]);
      return false;
    }
  }

  /// Clear all data
  Future<void> clear() async {
    final prefs = await _prefs;
    await prefs.clear();
    await AppLocalStorageCached.loadCache();
    _log.info("Cleared all local storage");
  }
}

/// Cached values in memory
class AppLocalStorageCached {
  static final _log = AppLogger.getLogger("AppLocalStorageCached");

  static String? jwtToken;
  static List<String>? roles;
  static String? language;
  static String? username;
  static String? theme;

  static Future<void> loadCache() async {
    _log.trace("Loading cache");
    final storage = AppLocalStorage();
    jwtToken = await storage.read(StorageKeys.jwtToken.name);
    roles = await storage.read(StorageKeys.roles.name);
    language = await storage.read(StorageKeys.language.name) ?? "en";
    username = await storage.read(StorageKeys.username.name);
    theme =
        await storage.read(StorageKeys.theme.name) ??
        AdaptiveThemeMode.light.name;

    _log.trace(
      "Loaded cache with username:{}, roles:{}, language:{}, jwtToken:{}, theme:{}",
      [username, roles, language, jwtToken, theme],
    );
  }
}

/// LocalStorage predefined keys
enum StorageKeys { jwtToken, roles, language, username, theme }
