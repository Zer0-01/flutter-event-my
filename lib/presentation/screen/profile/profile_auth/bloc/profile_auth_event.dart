part of 'profile_auth_bloc.dart';

sealed class ProfileAuthEvent extends Equatable {
  const ProfileAuthEvent();

  @override
  List<Object> get props => [];
}

class OnInitProfileAuthEvent extends ProfileAuthEvent {
  const OnInitProfileAuthEvent();

  @override
  List<Object> get props => [];
}
