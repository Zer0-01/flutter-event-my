import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';

class EventBasicBottomButtonWidget extends StatelessWidget {
  final TextEditingController eventNameController;
  final TextEditingController eventDateController;
  final TextEditingController startTimeController;
  final TextEditingController durationController;
  const EventBasicBottomButtonWidget({
    super.key,
    required this.eventNameController,
    required this.eventDateController,
    required this.startTimeController,
    required this.durationController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
      ),
      child: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed:
                    isActive(
                          eventNameController: eventNameController,
                          eventDateController: eventDateController,
                          startTimeController: startTimeController,
                          durationController: durationController,
                        )
                        ? () {
                          context.router.pushPath(RoutePath.eventCategory);
                        }
                        : null,
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isActive({
    required TextEditingController eventNameController,
    required TextEditingController eventDateController,
    required TextEditingController startTimeController,
    required TextEditingController durationController,
  }) {
    return eventNameController.text.isNotEmpty &&
        eventDateController.text.isNotEmpty &&
        startTimeController.text.isNotEmpty &&
        durationController.text.isNotEmpty;
  }
}
