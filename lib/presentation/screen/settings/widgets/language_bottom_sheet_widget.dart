import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheetWidget extends StatelessWidget {
  const LanguageBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 5,
              child: Text(
                "Language",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            ListTile(
              title: const Text("English"),
              onTap: () => context.router.pop("en"),
            ),
            ListTile(
              title: const Text("Bahasa Melayu"),
              onTap: () => context.router.pop("ms"),
            ),
          ],
        ),
      ],
    );
  }
}
