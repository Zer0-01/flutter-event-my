import 'package:flutter/material.dart';

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
          Text("Event Name"),
          TextFormField(
            controller: eventNameController,
            decoration: InputDecoration(
              isCollapsed: true,
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
