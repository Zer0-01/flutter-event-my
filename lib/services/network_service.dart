import 'package:dio/dio.dart';
import 'package:flutter_my_event/config/app_env.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/config/app_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;

  final Dio _dio;
  final _logger = AppLogger.getLogger("NetworkService");
  final AppSecureStorage _appSecureStorage = AppSecureStorage();

  NetworkService._internal()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ProfileConstants.api,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          responseType: ResponseType.json,
        ),
      ) {
    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // ✅ Add token only if required
          final requiresAuth = options.extra["requiresAuth"] ?? true;
          if (requiresAuth) {
            final token = await _appSecureStorage.read(
              SecureStorageKeys.accessToken.name,
            );
            if (token != null && token.isNotEmpty) {
              options.headers["Authorization"] = "Bearer $token";
            }
          }

          _logger.debug("➡️ ${options.method} ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.debug(
            "✅ ${response.statusCode} ${response.requestOptions.uri}",
          );
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          _logger.error("❌ ${e.response?.statusCode} ${e.message}");
          return handler.next(e); // bubble up
        },
      ),
    );

    if (ProfileConstants.isDevelopment) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: true,
        ),
      );
    }
  }

  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    bool requiresAuth = true,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParams,
      options: Options(headers: headers, extra: {"requiresAuth": requiresAuth}),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(
    String url,
    dynamic data, {
    Map<String, String>? headers,
    bool requiresAuth = true,
  }) async {
    final response = await _dio.post(
      url,
      data: data,
      options: Options(headers: headers, extra: {"requiresAuth": requiresAuth}),
    );
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    }
    return {"data": response.data};
  }
}
