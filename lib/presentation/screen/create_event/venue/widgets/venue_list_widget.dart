import 'package:flutter/material.dart';

class VenueListWidget extends StatelessWidget {
  const VenueListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      sliver: SliverList.separated(
        itemCount: 8,
        itemBuilder: (context, index) {
          return const Text("Meow");
        },
        separatorBuilder: (context, index) => const SizedBox(height: 4),
      ),
    );
  }
}
