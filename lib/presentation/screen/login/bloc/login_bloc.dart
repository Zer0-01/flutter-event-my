import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/config/app_secure_storage.dart';
import 'package:flutter_my_event/data/model/request/login_dto_request.dart';
import 'package:flutter_my_event/data/model/response/login_dto_response.dart';
import 'package:flutter_my_event/data/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppLogger _logger = AppLogger.getLogger("LoginBloc");
  late final AuthRepository _authRepository;
  late final AppSecureStorage _appSecureStorage;

  LoginBloc({
    required AuthRepository authRepository,
    required AppSecureStorage appSecureStorage,
  }) : _authRepository = authRepository,
       _appSecureStorage = appSecureStorage,

       super(const LoginState()) {
    on<OnPressedLoginEvent>(_onPressedLogin);
  }

  Future<void> _onPressedLogin(
    OnPressedLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    _logger.debug("onPressedLogin");
    final String email = event.email;
    final String password = event.password;
    _logger.debug("email: {}, password: {}", [email, password]);
    await _postLogin(emit, email: email, password: password);
    _logger.debug("onPressedLogin end");
  }

  Future<void> _postLogin(
    Emitter<LoginState> emit, {
    required String email,
    required String password,
  }) async {
    _logger.debug("postLogin");
    try {
      emit(state.copyWith(postLoginStatus: PostLoginStatus.loading));
      final LoginDtoRequest loginDtoRequest = LoginDtoRequest(
        email: email,
        password: password,
      );
      final LoginDtoResponse loginDtoResponse = await _authRepository.loginUser(
        loginDtoRequest: loginDtoRequest,
      );
      final String accessToken = loginDtoResponse.data.accessToken;
      final String refreshToken = loginDtoResponse.data.refreshToken;
      _logger.debug("accessToken: {}, refreshToken: {}", [
        accessToken,
        refreshToken,
      ]);

      await _saveLocalStorage(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      emit(state.copyWith(postLoginStatus: PostLoginStatus.success));
    } on DioException catch (e) {
      _logger.error(e);
      emit(
        state.copyWith(
          postLoginStatus: PostLoginStatus.error,
          dioTypePostLogin: e.type,
          dioCodePostLogin: e.response?.statusCode ?? -1,
        ),
      );
    } catch (e) {
      _logger.error(e);
      emit(
        state.copyWith(
          postLoginStatus: PostLoginStatus.error,
          dioTypePostLogin: DioExceptionType.unknown,
          dioCodePostLogin: -1,
        ),
      );
    }
  }

  Future<void> _saveLocalStorage({
    required String accessToken,
    required String refreshToken,
  }) async {
    _logger.debug("saveLocalStorage");
    await _appSecureStorage.save(
      SecureStorageKeys.accessToken.name,
      accessToken,
    );
    await _appSecureStorage.save(
      SecureStorageKeys.refreshToken.name,
      refreshToken,
    );
    _logger.debug("saveLocalStorage end");
  }
}
