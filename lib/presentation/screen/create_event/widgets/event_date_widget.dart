import 'package:flutter/material.dart';

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
          Text("Event Date"),
          TextFormField(
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
            decoration: InputDecoration(
              isCollapsed: true,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(Icons.event),
              ),
              suffixIconConstraints: BoxConstraints(),
              contentPadding: EdgeInsets.all(4),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
