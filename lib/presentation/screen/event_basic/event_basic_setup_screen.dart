import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/event_basic/event_basic_screen.dart';

@RoutePage()
class EventBasicSetupScreen extends StatelessWidget {
  const EventBasicSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EventBasicScreen();
  }
}
