import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/data/api_endpoints.dart';
import 'package:flutter_my_event/services/network_service.dart';

class AuthRepository {
  final NetworkService _network;
  final _logger = AppLogger.getLogger("AuthRepository");

  AuthRepository({NetworkService? network})
    : _network = network ?? NetworkService();

  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _network.post(ApiEndpoints.register, {
        "email": email,
        "password": password,
        "name": name,
      });

      if (response == null) return null;
    } catch (e, stack) {
      _logger.error("Failed to register user", [e, stack]);
    }
  }
}
