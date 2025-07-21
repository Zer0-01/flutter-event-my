import 'package:flutter/cupertino.dart';

class DurationModalBottomSheetWidget extends StatelessWidget {
  const DurationModalBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Duration duration = const Duration(hours: 1);
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm, // hours and minutes
              initialTimerDuration: const Duration(hours: 1),
              onTimerDurationChanged: (Duration newDuration) {
                duration = newDuration;
              },
            ),
          ),
          CupertinoButton(
            child: const Text("Done"),
            onPressed: () {
              Navigator.of(context).pop(duration);
            },
          ),
        ],
      ),
    );
  }
}
