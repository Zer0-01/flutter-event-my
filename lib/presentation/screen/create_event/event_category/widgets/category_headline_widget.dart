import 'package:flutter/material.dart';

class CategoryHeadlineWidget extends StatelessWidget {
  const CategoryHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 4),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Event Category",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Text("Select the type of event you want to plan"),
          ],
        ),
      ),
    );
  }
}
