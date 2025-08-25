import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/profile/bloc/profile_bloc.dart';
import 'package:flutter_my_event/presentation/screen/profile/profile_auth/profile_auth_setup_screen.dart';
import 'package:flutter_my_event/presentation/screen/profile/profile_unauth/profile_unauth_setup_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const OnInitProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.getSecureStorageStatus == GetSecureStorageStatus.loading ||
            state.getSecureStorageStatus == GetSecureStorageStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        }

        return state.isLogin
            ? const ProfileAuthSetupScreen()
            : const ProfileUnauthSetupScreen();
      },
    );
  }
}
