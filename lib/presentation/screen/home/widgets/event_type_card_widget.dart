import 'package:flutter/material.dart';

class EventTypeCardWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? color;
  const EventTypeCardWidget({
    super.key,
    required this.title,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
