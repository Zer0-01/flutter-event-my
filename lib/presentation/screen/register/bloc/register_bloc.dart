import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/data/repository/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _logger = AppLogger.getLogger("RegisterBloc");
  late final AuthRepository _authRepository;
  RegisterBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const RegisterState()) {
    on<OnChangedCheckBoxEvent>(_onChangedCheckBox);
    on<OnRegisterEvent>(_onRegister);
  }

  void _onChangedCheckBox(
    OnChangedCheckBoxEvent event,
    Emitter<RegisterState> emit,
  ) {
    _logger.debug("onChangedCheckBox");
    emit(state.copyWith(isAgree: !state.isAgree));
  }

  Future<void> _onRegister(
    OnRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    _logger.debug("onRegister");

    await _postRegister(
      emit,
      email: event.email,
      password: event.password,
      name: event.name,
    );

    _logger.debug("onRegister end");
  }

  Future<void> _postRegister(
    Emitter<RegisterState> emit, {
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      emit(state.copyWith(postRegisterStatus: PostRegisterStatus.loading));
      await _authRepository.registerUser(
        email: email,
        password: password,
        name: name,
      );

      emit(state.copyWith(postRegisterStatus: PostRegisterStatus.success));
    } catch (e) {
      _logger.error(e);
      emit(state.copyWith(postRegisterStatus: PostRegisterStatus.error));
    }
  }
}
