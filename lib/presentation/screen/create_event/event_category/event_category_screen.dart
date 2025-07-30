import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_category/widgets/category_grid_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_category/widgets/category_headline_widget.dart';
import 'package:flutter_my_event/presentation/screen/create_event/event_category/widgets/category_navigation_button_widget.dart';

class EventCategoryScreen extends StatelessWidget {
  const EventCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CategoryHeadlineWidget(),
          CategoryGridWidget(),
          //CategoryNavigationButtonWidget(),
        ],
      ),
      bottomNavigationBar: CategoryNavigationButtonWidget(),
    );
  }
}
