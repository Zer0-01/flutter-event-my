import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_my_event/config/app_env.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/config/app_storage.dart';
import 'package:flutter_my_event/main/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.configure(isProduction: false);
  final logger = AppLogger.getLogger("main");
  ProfileConstants.setEnvironment(Environment.dev);
  logger.info("Starting App with env: {}", [Environment.dev.name]);
  final String language =
      await AppLocalStorage().read(StorageKeys.language.name) ?? "en";
  const initialTheme = AdaptiveThemeMode.light;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(App(language: language, initialTheme: initialTheme));
  });
}
