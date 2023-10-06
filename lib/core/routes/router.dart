import 'package:auto_route/auto_route.dart';
import 'package:interesting_places/core/screens/category_screen.dart';
import 'package:interesting_places/core/screens/map_screen.dart';
import 'package:interesting_places/core/screens/new_place_screen.dart';
import 'package:interesting_places/core/screens/place_list_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: PlaceListRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: NewPlaceRoute.page,
          path: '/create',
        ),
        AutoRoute(
          page: CategoryRoute.page,
          path: '/category',
        ),
        AutoRoute(
          page: MapRoute.page,
          path: '/map',
        ),
      ];
}
