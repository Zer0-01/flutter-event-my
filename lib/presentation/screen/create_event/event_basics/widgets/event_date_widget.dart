import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_text_form_field_widget.dart';

class EventDateWidget extends StatelessWidget {
  final TextEditingController eventDateController;
  const EventDateWidget({super.key, required this.eventDateController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Event Date"),
          AppTextFormFieldWidget(
            controller: eventDateController,
            readOnly: true,
            onTap: () async {
              final DateTime? selectedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(
                  DateTime.now().toLocal().year - 5,
                  DateTime.now().toLocal().month,
                  DateTime.now().toLocal().day,
                ),
                lastDate: DateTime(
                  DateTime.now().toLocal().year + 10,
                  DateTime.now().toLocal().month,
                  DateTime.now().toLocal().day,
                ),
                initialDate: DateTime.now(),
              );

              if (selectedDate != null) {
                eventDateController.text =
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
              }
            },
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.calendar_month),
            ),
          ),
        ],
      ),
    );
  }
}
