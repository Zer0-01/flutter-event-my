import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/presentation/common_blocs/language_bloc/language_bloc.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';
import 'package:flutter_my_event/routes/app_auto_router_observer.dart';

/// Main application widget. This widget is the root of your application.
///
/// It is configured to provide a [ThemeData] based on the current
/// [AdaptiveThemeMode] and to provide a [MaterialApp] with the
/// [AdaptiveThemeMode] as the initial theme mode.
///

class App extends StatelessWidget {
  final String language;
  final AdaptiveThemeMode initialTheme;
  final _appRouter = AppAutoRoute();

  App({super.key, required this.language, required this.initialTheme});

  @override
  Widget build(BuildContext context) {
    return buildHomeApp();
  }

  AdaptiveTheme buildHomeApp() {
    return AdaptiveTheme(
      light: _buildLightTheme(),
      dark: _buildDarkTheme(),
      debugShowFloatingThemeButton: true,
      initial: initialTheme,
      builder: (light, dark) => _buildMultiBlocProvider(light, dark),
    );
  }

  ThemeData _buildDarkTheme() => ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
  );

  ThemeData _buildLightTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const Color(0xff079669),
      secondary: const Color(0xffd8f8e9),
      outline: Colors.grey.shade300,
      onSurfaceVariant: Colors.grey.shade600,
    ),
  );

  MultiBlocProvider _buildMultiBlocProvider(ThemeData light, ThemeData dark) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LanguageBloc())],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(
          navigatorObservers: () => [AppAutoRouterObserver()],
        ),
        theme: light,
        darkTheme: dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
