import 'package:auto_route/auto_route.dart';
import 'package:flutter_my_event/routes/app_auto_route.gr.dart';

@AutoRouterConfig()
class AppAutoRoute extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeSetupRoute.page, path: RoutePath.home, initial: true),
  ];
}

class RoutePath {
  static const String home = '/';
}
