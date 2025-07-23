import 'package:flutter/material.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';
import 'package:flutter_my_event/routes/app_router.dart';

class CategoryNavigationButtonWidget extends StatelessWidget {
  const CategoryNavigationButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 4),
      sliver: SliverToBoxAdapter(
        child: Row(
          spacing: 16,
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
                onPressed: () {
                  AppRouter().pop(context);
                },
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
                onPressed: () {
                  AppRouter().push(context, RoutePath.venue);
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
