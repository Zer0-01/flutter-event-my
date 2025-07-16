import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_my_event/config/app_env.dart';
import 'package:flutter_my_event/config/app_logger.dart';
import 'package:flutter_my_event/config/app_storage.dart';
import 'package:flutter_my_event/main/app.dart';
import 'package:flutter_my_event/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.configure(isProduction: false);
  final logger = AppLogger.getLogger("main");
  ProfileConstants.setEnvironment(Environment.dev);
  logger.info("Starting App with env: {}", [Environment.dev.name]);
  const defaultLanguage = "en";
  AppLocalStorage().setStorage(StorageType.sharedPreferences);
  await AppLocalStorage().save(StorageKeys.language.name, defaultLanguage);
  AppRouter().setRouter(RouterType.autoRoute);
  const initialTheme = AdaptiveThemeMode.light;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(App(language: defaultLanguage, initialTheme: initialTheme));
  });
}
