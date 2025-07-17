import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/create_event/create_event_screen.dart';

@RoutePage()
class CreateEventSetupScreen extends StatelessWidget {
  const CreateEventSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateEventScreen();
  }
}
