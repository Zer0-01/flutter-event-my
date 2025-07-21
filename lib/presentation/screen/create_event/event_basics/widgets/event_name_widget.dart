import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_text_form_field_widget.dart';

class EventNameWidget extends StatelessWidget {
  final TextEditingController eventNameController;

  const EventNameWidget({super.key, required this.eventNameController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Event Name"),
          AppTextFormFieldWidget(controller: eventNameController),
        ],
      ),
    );
  }
}
