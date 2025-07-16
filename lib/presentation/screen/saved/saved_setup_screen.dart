import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/saved/saved_screen.dart';

@RoutePage()
class SavedSetupScreen extends StatelessWidget {
  const SavedSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SavedScreen();
  }
}
