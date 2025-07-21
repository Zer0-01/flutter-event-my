import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_category/event_category_screen.dart';

@RoutePage()
class EventCategorySetupScreen extends StatelessWidget {
  const EventCategorySetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventCategoryScreen();
  }
}
