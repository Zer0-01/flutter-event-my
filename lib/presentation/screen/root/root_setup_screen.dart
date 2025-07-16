import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/root/root_screen.dart';

@RoutePage()
class RootSetupScreen extends StatelessWidget {
  const RootSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RootScreen();
  }
}
