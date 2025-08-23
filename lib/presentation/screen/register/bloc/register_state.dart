part of 'register_bloc.dart';

enum PostRegisterStatus { initial, loading, success, error }

class RegisterState extends Equatable {
  final PostRegisterStatus postRegisterStatus;
  final bool isAgree;

  const RegisterState({
    this.postRegisterStatus = PostRegisterStatus.initial,
    this.isAgree = false,
  });

  RegisterState copyWith({
    PostRegisterStatus? postRegisterStatus,
    bool? isAgree,
  }) {
    return RegisterState(
      postRegisterStatus: postRegisterStatus ?? this.postRegisterStatus,
      isAgree: isAgree ?? this.isAgree,
    );
  }

  @override
  List<Object> get props => [postRegisterStatus, isAgree];
}
