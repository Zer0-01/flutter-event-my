import 'package:flutter/material.dart';
import 'package:flutter_my_event/routes/app_router.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => AppRouter().pop(context),
              icon: Icon(Icons.chevron_left),
            ),
            title: Text(
              "Create Your Event",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
