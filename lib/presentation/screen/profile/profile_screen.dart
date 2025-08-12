import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            context.router.pushPath(RoutePath.login);
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
