part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class OnChangedCheckBoxEvent extends RegisterEvent {
  const OnChangedCheckBoxEvent();

  @override
  List<Object> get props => [];
}
