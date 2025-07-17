import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/routes/app_auto_route.gr.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeSetupRoute(),
        EventSetupRoute(),
        DealsSetupRoute(),
        SavedSetupRoute(),
        ProfileSetupRoute(),
      ],
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
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            unselectedItemColor: Theme.of(context).colorScheme.outline,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                label: 'My Events',
                icon: Icon(Icons.event),
              ),
              BottomNavigationBarItem(
                label: 'Deals',
                icon: Icon(Icons.discount),
              ),
              BottomNavigationBarItem(
                label: 'Saved',
                icon: Icon(CupertinoIcons.heart_fill),
              ),
              BottomNavigationBarItem(
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
