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

class OnRegisterEvent extends RegisterEvent {
  final String email;
  final String password;
  final String name;
  const OnRegisterEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}
