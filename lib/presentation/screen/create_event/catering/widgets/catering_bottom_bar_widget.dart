import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/bloc/create_event_bloc.dart';
import 'package:flutter_my_event/presentation/screen/create_event/widgets/event_bottom_app_bar_widget.dart';

class CateringBottomBarWidget extends StatelessWidget {
  const CateringBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return EventBottomAppBarWidget(
          onPressedPreviousButton: () {
            context.router.pop();
          },
          onPressedNextButton: state.selectedCateringId != -1 ? () {} : null,
        );
      },
    );
  }
}
