import 'package:flutter/material.dart';

class EventBottomAppBarWidget extends StatelessWidget {
  final void Function()? onPressedPreviousButton;
  final void Function()? onPressedNextButton;

  const EventBottomAppBarWidget({
    super.key,
    this.onPressedPreviousButton,
    this.onPressedNextButton,
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
          spacing: 8,
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onPressedPreviousButton,
                child: const Text("Previous"),
              ),
            ),
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onPressedNextButton,
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
