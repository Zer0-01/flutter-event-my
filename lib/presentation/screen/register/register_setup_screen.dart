import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/register/register_screen.dart';

@RoutePage()
class RegisterSetupScreen extends StatelessWidget {
  const RegisterSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterScreen();
  }
}
