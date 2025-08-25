part of 'profile_bloc.dart';

enum GetSecureStorageStatus { initial, loading, success, error }

class ProfileState extends Equatable {
  final GetSecureStorageStatus getSecureStorageStatus;
  final bool isLogin;

  const ProfileState({
    this.getSecureStorageStatus = GetSecureStorageStatus.initial,
    this.isLogin = false,
  });

  ProfileState copyWith({
    GetSecureStorageStatus? getSecureStorageStatus,
    bool? isLogin,
  }) {
    return ProfileState(
      getSecureStorageStatus:
          getSecureStorageStatus ?? this.getSecureStorageStatus,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object> get props => [getSecureStorageStatus, isLogin];
}
