import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/profile/profile_auth/bloc/profile_auth_bloc.dart';

class ProfileAuthScreen extends StatefulWidget {
  const ProfileAuthScreen({super.key});

  @override
  State<ProfileAuthScreen> createState() => _ProfileAuthScreenState();
}

class _ProfileAuthScreenState extends State<ProfileAuthScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileAuthBloc>().add(const OnInitProfileAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
