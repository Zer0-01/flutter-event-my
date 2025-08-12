import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/login/login_screen.dart';

@RoutePage()
class LoginSetupScreen extends StatelessWidget {
  const LoginSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
