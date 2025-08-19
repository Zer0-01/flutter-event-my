import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';

class ProfileAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () => context.router.pushPath(RoutePath.settings),
          icon: Icon(
            Icons.settings,
            color:
                Theme.of(
                  context,
                ).inputDecorationTheme.errorBorder?.borderSide.color,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
