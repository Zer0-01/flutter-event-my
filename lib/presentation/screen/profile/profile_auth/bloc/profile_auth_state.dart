part of 'profile_auth_bloc.dart';

enum GetProfileStatus { initial, loading, success, error }

class ProfileAuthState extends Equatable {
  final GetProfileStatus getProfileStatus;
  final String name;
  final String email;
  final DioExceptionType dioTypeGetProfile;
  final int dioCodeGetProfile;

  const ProfileAuthState({
    this.getProfileStatus = GetProfileStatus.initial,
    this.name = '',
    this.email = '',
    this.dioTypeGetProfile = DioExceptionType.unknown,
    this.dioCodeGetProfile = -1,
  });

  ProfileAuthState copyWith({
    GetProfileStatus? getProfileStatus,
    String? name,
    String? email,
    DioExceptionType? dioTypeGetProfile,
    int? dioCodeGetProfile,
  }) {
    return ProfileAuthState(
      getProfileStatus: getProfileStatus ?? this.getProfileStatus,
      name: name ?? this.name,
      email: email ?? this.email,
      dioTypeGetProfile: dioTypeGetProfile ?? this.dioTypeGetProfile,
      dioCodeGetProfile: dioCodeGetProfile ?? this.dioCodeGetProfile,
    );
  }

  @override
  List<Object> get props => [
    getProfileStatus,
    dioTypeGetProfile,
    dioCodeGetProfile,
  ];
}
