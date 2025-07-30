import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/bloc/create_event_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/widgets/event_bottom_app_bar_widget.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';

class CategoryNavigationButtonWidget extends StatelessWidget {
  const CategoryNavigationButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return EventBottomAppBarWidget(
          onPressedPreviousButton: () {
            context.router.pop();
          },
          onPressedNextButton:
              state.category.isNotEmpty
                  ? () {
                    context.router.pushPath(RoutePath.venue);
                  }
                  : null,
        );
      },
    );
  }
}
