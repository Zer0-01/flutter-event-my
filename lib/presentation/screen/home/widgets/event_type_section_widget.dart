import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/home/widgets/first_row_event_type_widget.dart';
import 'package:flutter_my_event/presentation/screen/home/widgets/second_row_event_type_widget.dart';

class EventTypeSectionWidget extends StatelessWidget {
  const EventTypeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [FirstRowEventTypeWidget(), SecondRowEventTypeWidget()],
    );
  }
}
