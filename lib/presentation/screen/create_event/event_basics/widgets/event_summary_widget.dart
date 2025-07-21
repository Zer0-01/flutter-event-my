import 'package:flutter/material.dart';

class EventSummaryWidget extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventTime;
  final String eventDuration;

  const EventSummaryWidget({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Event Summary",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text("Event: $eventName"),
            Text("Date: $eventDate"),
            Text("Time: $eventTime ($eventDuration)"),
          ],
        ),
      ),
    );
  }
}
