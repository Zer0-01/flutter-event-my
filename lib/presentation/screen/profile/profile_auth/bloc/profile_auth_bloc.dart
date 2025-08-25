import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/data/model/response/profile_dto_response.dart';
import 'package:flutter_my_event/data/repository/auth_repository.dart';

part 'profile_auth_event.dart';
part 'profile_auth_state.dart';

class ProfileAuthBloc extends Bloc<ProfileAuthEvent, ProfileAuthState> {
  final _logger = AppLogger.getLogger("ProfileAuthBloc");
  final AuthRepository _authRepository;
  ProfileAuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const ProfileAuthState()) {
    on<OnInitProfileAuthEvent>(_onInitProfileAuth);
  }

  Future<void> _onInitProfileAuth(
    OnInitProfileAuthEvent event,
    Emitter<ProfileAuthState> emit,
  ) async {
    _logger.debug("onInitProfileAuth");
    await _getProfile(emit);
    _logger.debug("onInitProfileAuth end");
  }

  Future<void> _getProfile(Emitter<ProfileAuthState> emit) async {
    _logger.debug("getProfile");
    try {
      emit(state.copyWith(getProfileStatus: GetProfileStatus.loading));
      final ProfileDtoResponse profileDtoResponse =
          await _authRepository.getProfile();
      final ProfileData profileData = profileDtoResponse.data;
      final String name = profileData.name;
      final String email = profileData.email;

      _logger.debug("name: {}, email: {}", [name, email]);
      emit(
        state.copyWith(
          getProfileStatus: GetProfileStatus.success,
          name: name,
          email: email,
        ),
      );
    } on DioException catch (e) {
      _logger.error("DioException: ${e.message}");
      emit(
        state.copyWith(
          getProfileStatus: GetProfileStatus.error,
          dioTypeGetProfile: e.type,
          dioCodeGetProfile: e.response?.statusCode ?? -1,
        ),
      );
    } catch (e) {
      _logger.error("Error: {}", [e]);
      emit(state.copyWith(getProfileStatus: GetProfileStatus.error));
    }
  }
}
