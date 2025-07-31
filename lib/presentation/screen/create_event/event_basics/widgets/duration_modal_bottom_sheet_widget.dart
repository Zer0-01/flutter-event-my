import 'package:flutter/material.dart';

class DurationModalBottomSheetWidget extends StatelessWidget {
  const DurationModalBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Spacer(),
                Expanded(
                  child: Text(
                    "Select Duration",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final int hour = index + 1;
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, hour);
                    },
                    child: Row(children: [Text(hour.toString())]),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
