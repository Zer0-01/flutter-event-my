import 'package:auto_route/auto_route.dart';
import 'package:flutter_my_event/routes/app_auto_route.gr.dart';

@AutoRouterConfig()
class AppAutoRoute extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RootSetupRoute.page,
      path: RoutePath.root,
      initial: true,
      children: [
        AutoRoute(
          page: HomeSetupRoute.page,
          path: RoutePath.home,
          initial: true,
        ),
        AutoRoute(page: SavedSetupRoute.page, path: RoutePath.saved),
        AutoRoute(page: DealsSetupRoute.page, path: RoutePath.deals),
        AutoRoute(page: ProfileSetupRoute.page, path: RoutePath.profile),
        AutoRoute(page: EventSetupRoute.page, path: RoutePath.event),
      ],
    ),
    AutoRoute(
      page: CreateEventSetupRoute.page,
      path: RoutePath.createEvent,
      children: [
        AutoRoute(
          page: EventBasicsSetupRoute.page,
          path: RoutePath.eventBasics,
          initial: true,
        ),
        AutoRoute(
          page: EventCategorySetupRoute.page,
          path: RoutePath.eventCategory,
        ),
        AutoRoute(page: VenueSetupRoute.page, path: RoutePath.venue),
      ],
    ),
  ];
}

class RoutePath {
  static const String root = '/';
  static const String home = 'home';
  static const String deals = 'deals';
  static const String profile = 'profile';
  static const String event = 'event';
  static const String saved = 'saved';
  static const String createEvent = '/create-event';
  static const String eventBasics = 'event-basics';
  static const String eventCategory = 'event-category';
  static const String venue = 'venue';
}
