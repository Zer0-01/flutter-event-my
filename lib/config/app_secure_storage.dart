import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_my_event/config/app_logger.dart';

class AppSecureStorage {
  static final _log = AppLogger.getLogger("AppSecureStorage");

  // Singleton instance
  static final AppSecureStorage _instance = AppSecureStorage._internal();
  factory AppSecureStorage() => _instance;

  AppSecureStorage._internal();

  // Secure storage instance
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Save value (only String supported by secure storage)
  Future<bool> save(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      _log.trace("Saved {} to secure storage", [key]);
      return true;
    } catch (e) {
      _log.error("Error saving {} to secure storage: {}", [key, e]);
      return false;
    }
  }

  /// Read value
  Future<String?> read(String key) async {
    try {
      final value = await _storage.read(key: key);
      _log.trace("Read {} from secure storage: {}", [key, value]);
      return value;
    } catch (e) {
      _log.error("Error reading {} from secure storage: {}", [key, e]);
      return null;
    }
  }

  /// Remove value
  Future<bool> remove(String key) async {
    try {
      await _storage.delete(key: key);
      _log.trace("Removed {} from secure storage", [key]);
      return true;
    } catch (e) {
      _log.error("Error removing {} from secure storage: {}", [key, e]);
      return false;
    }
  }

  /// Clear all values
  Future<void> clear() async {
    try {
      await _storage.deleteAll();
      _log.info("Cleared all secure storage");
    } catch (e) {
      _log.error("Error clearing secure storage: {}", [e]);
    }
  }
}

enum SecureStorageKeys { accessToken, refreshToken }
