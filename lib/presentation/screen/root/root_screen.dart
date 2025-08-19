import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';
import 'package:flutter_my_event/routes/app_auto_route.gr.dart';
import 'package:flutter_my_event/routes/app_router.dart';
import 'package:flutter_my_event/utils/extensions.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeSetupRoute(),
        EventSetupRoute(),
        SavedSetupRoute(),
        ProfileSetupRoute(),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter().push(context, RoutePath.createEvent);
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex:
                tabsRouter.activeIndex > 1
                    ? tabsRouter.activeIndex + 1
                    : tabsRouter.activeIndex,
            onTap: (index) {
              if (index == 2) return; // middle (FAB) tap - do nothing

              final correctedIndex = index > 2 ? index - 1 : index;
              tabsRouter.setActiveIndex(correctedIndex);
            },
            unselectedItemColor: Theme.of(context).colorScheme.outline,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            items: [
              BottomNavigationBarItem(
                label: context.l10n.home,
                icon: const Icon(Icons.home),
              ),
              const BottomNavigationBarItem(
                label: 'My Events',
                icon: Icon(Icons.event),
              ),

              const BottomNavigationBarItem(label: '', icon: SizedBox.shrink()),

              const BottomNavigationBarItem(
                label: 'Saved',
                icon: Icon(CupertinoIcons.heart_fill),
              ),
              const BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        );
      },
    );
  }
}
