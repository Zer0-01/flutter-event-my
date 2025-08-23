import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/create_event/widgets/exit_create_event_dialog_widget.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          onPressed: () async {
            final bool? isExit = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const ExitCreateEventDialogWidget();
              },
            );
            if (isExit == true) {
              if (!context.mounted) return;
              context.router.pop();
            }
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(
          "Create Your Event",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: const AutoRouter(),
    );
  }
}
