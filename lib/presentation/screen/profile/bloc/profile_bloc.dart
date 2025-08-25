import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/config/app_secure_storage.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _logger = AppLogger.getLogger("ProfileBloc");
  final AppSecureStorage _appSecureStorage;
  ProfileBloc({required AppSecureStorage appSecureStorage})
    : _appSecureStorage = appSecureStorage,
      super(const ProfileState()) {
    on<OnInitProfileEvent>(_onInitProfile);
  }

  Future<void> _onInitProfile(
    OnInitProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    _logger.debug("onInitProfile");
    await _getAppSecureStorage(emit);
    _logger.debug("onInitProfile end");
  }

  Future<void> _getAppSecureStorage(Emitter<ProfileState> emit) async {
    _logger.debug("getAppSecureStorage");
    try {
      emit(
        state.copyWith(getSecureStorageStatus: GetSecureStorageStatus.loading),
      );
      final String? accessToken = await _appSecureStorage.read(
        SecureStorageKeys.accessToken.name,
      );
      _logger.debug("accessToken: {}", [accessToken]);

      if (accessToken == null || accessToken.isEmpty) {
        _logger.debug("accessToken is null or empty");
        emit(
          state.copyWith(
            getSecureStorageStatus: GetSecureStorageStatus.success,
            isLogin: false,
          ),
        );
        return;
      }

      _logger.debug("accessToken is not null or empty");
      emit(
        state.copyWith(
          getSecureStorageStatus: GetSecureStorageStatus.success,
          isLogin: true,
        ),
      );
      _logger.debug("getAppSecureStorage end");
    } catch (e) {
      _logger.error(e);
      emit(
        state.copyWith(getSecureStorageStatus: GetSecureStorageStatus.error),
      );
    }
  }
}
