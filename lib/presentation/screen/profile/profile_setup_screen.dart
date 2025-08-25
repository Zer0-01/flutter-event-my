import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_secure_storage.dart';
import 'package:flutter_my_event/presentation/screen/profile/bloc/profile_bloc.dart';
import 'package:flutter_my_event/presentation/screen/profile/profile_screen.dart';

@RoutePage()
class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(appSecureStorage: AppSecureStorage()),
      child: const ProfileScreen(),
    );
  }
}
