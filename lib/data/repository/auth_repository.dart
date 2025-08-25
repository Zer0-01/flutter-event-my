import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/data/api_endpoints.dart';
import 'package:flutter_my_event/data/model/request/login_dto_request.dart';
import 'package:flutter_my_event/data/model/request/register_dto_request.dart';
import 'package:flutter_my_event/data/model/response/login_dto_response.dart';
import 'package:flutter_my_event/data/model/response/profile_dto_response.dart';
import 'package:flutter_my_event/services/network_service.dart';

class AuthRepository {
  final NetworkService _network;
  final _logger = AppLogger.getLogger("AuthRepository");

  AuthRepository({NetworkService? network})
    : _network = network ?? NetworkService();

  Future<void> registerUser({
    required RegisterDtoRequest registerDtoRequest,
  }) async {
    _logger.info("Registering user with email: {}, password: {}, name: {}", [
      registerDtoRequest.email,
      registerDtoRequest.password,
      registerDtoRequest.name,
    ]);
    await _network.post(ApiEndpoints.register, registerDtoRequest.toJson());
    _logger.info("User registered successfully");
  }

  Future<LoginDtoResponse> loginUser({
    required LoginDtoRequest loginDtoRequest,
  }) async {
    _logger.info("Logging in user with email: {}, password: {}", [
      loginDtoRequest.email,
      loginDtoRequest.password,
    ]);
    final Map<String, dynamic> response = await _network.post(
      ApiEndpoints.login,
      loginDtoRequest.toJson(),
    );

    _logger.info("User logged in successfully");
    return LoginDtoResponse.fromJson(response);
  }

  Future<ProfileDtoResponse> getProfile() async {
    _logger.info("Getting profile");
    final Map<String, dynamic> response = await _network.get(
      ApiEndpoints.profile,
    );
    return ProfileDtoResponse.fromJson(response);
  }
}
