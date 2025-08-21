import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/common_blocs/language_bloc/language_bloc.dart';
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
            onTap: () async {
              final String? selectedLanguage = await showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const LanguageBottomSheetWidget();
                },
              );

              if (selectedLanguage != null) {
                if (!context.mounted) return;
                context.read<LanguageBloc>().add(
                  OnSelectLanguageEvent(language: selectedLanguage),
                );
              }
            },
          ),
          // Divider(),
        ],
      ),
    );
  }
}
