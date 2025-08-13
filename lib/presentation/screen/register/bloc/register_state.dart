part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isAgree;

  const RegisterState({this.isAgree = false});

  RegisterState copyWith({bool? isAgree}) {
    return RegisterState(isAgree: isAgree ?? this.isAgree);
  }

  @override
  List<Object> get props => [isAgree];
}
