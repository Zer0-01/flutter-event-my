part of 'register_bloc.dart';

enum PostRegisterStatus { initial, loading, success, error }

class RegisterState extends Equatable {
  final PostRegisterStatus postRegisterStatus;
  final bool isAgree;
  final DioExceptionType dioTypePostRegister;
  final int dioCodePostRegister;

  const RegisterState({
    this.postRegisterStatus = PostRegisterStatus.initial,
    this.isAgree = false,
    this.dioTypePostRegister = DioExceptionType.unknown,
    this.dioCodePostRegister = -1,
  });

  RegisterState copyWith({
    PostRegisterStatus? postRegisterStatus,
    bool? isAgree,
    DioExceptionType? dioTypePostRegister,
    int? dioCodePostRegister,
  }) {
    return RegisterState(
      postRegisterStatus: postRegisterStatus ?? this.postRegisterStatus,
      isAgree: isAgree ?? this.isAgree,
      dioTypePostRegister: dioTypePostRegister ?? this.dioTypePostRegister,
      dioCodePostRegister: dioCodePostRegister ?? this.dioCodePostRegister,
    );
  }

  @override
  List<Object> get props => [
    postRegisterStatus,
    isAgree,
    dioTypePostRegister,
    dioCodePostRegister,
  ];
}
