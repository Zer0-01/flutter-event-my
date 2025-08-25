import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/data/repository/auth_repository.dart';
import 'package:flutter_my_event/presentation/screen/profile/profile_auth/bloc/profile_auth_bloc.dart';
import 'package:flutter_my_event/presentation/screen/profile/profile_auth/profile_auth_screen.dart';

class ProfileAuthSetupScreen extends StatelessWidget {
  const ProfileAuthSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileAuthBloc(authRepository: AuthRepository()),
      child: const ProfileAuthScreen(),
    );
  }
}
