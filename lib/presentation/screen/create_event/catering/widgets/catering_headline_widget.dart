import 'package:flutter/material.dart';

class CateringHeadlineWidget extends StatelessWidget {
  const CateringHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, bottom: 4, right: 16, top: 16),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catering",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Text("Choose your preferred catering vendor"),
          ],
        ),
      ),
    );
  }
}
