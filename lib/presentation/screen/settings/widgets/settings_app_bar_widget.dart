import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SettingsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.router.pop(),
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text("Settings"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
