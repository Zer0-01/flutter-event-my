import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_logger.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _logger = AppLogger.getLogger("RegisterBloc");
  RegisterBloc() : super(const RegisterState()) {
    on<OnChangedCheckBoxEvent>(_onChangedCheckBox);
  }

  void _onChangedCheckBox(
    OnChangedCheckBoxEvent event,
    Emitter<RegisterState> emit,
  ) {
    _logger.debug("onChangedCheckBox");
    emit(state.copyWith(isAgree: !state.isAgree));
  }
}
