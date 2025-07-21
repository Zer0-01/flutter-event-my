import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/routes/app_router.dart';

class EventBasicsScreen extends StatelessWidget {
  const EventBasicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Create Your Event"),
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () => AppRouter().pop(context),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height, // to avoid shrink issues
              child: AutoRouter(),
            ),
          ),
        ],
      ),
    );
  }
}
