import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/settings/widgets/language_bottom_sheet_widget.dart';
import 'package:flutter_my_event/presentation/screen/settings/widgets/settings_app_bar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsAppBarWidget(),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            subtitle: const Text("English (Device Langauge)"),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const LanguageBottomSheetWidget();
                },
              );
            },
          ),
          // Divider(),
        ],
      ),
    );
  }
}
