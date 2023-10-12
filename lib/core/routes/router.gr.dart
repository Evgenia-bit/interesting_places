// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FilterScreen(),
      );
    },
    MapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapScreen(),
      );
    },
    NewPlaceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPlaceScreen(),
      );
    },
    PlaceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PlaceDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlaceDetailsScreen(
          key: args.key,
          place: args.place,
        ),
      );
    },
    PlaceListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceListScreen(),
      );
    },
  };
}

/// generated route for
/// [CategoryScreen]
class CategoryRoute extends PageRouteInfo<void> {
  const CategoryRoute({List<PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FilterScreen]
class FilterRoute extends PageRouteInfo<void> {
  const FilterRoute({List<PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapScreen]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPlaceScreen]
class NewPlaceRoute extends PageRouteInfo<void> {
  const NewPlaceRoute({List<PageRouteInfo>? children})
      : super(
          NewPlaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPlaceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceDetailsScreen]
class PlaceDetailsRoute extends PageRouteInfo<PlaceDetailsRouteArgs> {
  PlaceDetailsRoute({
    Key? key,
    required PlaceEntity place,
    List<PageRouteInfo>? children,
  }) : super(
          PlaceDetailsRoute.name,
          args: PlaceDetailsRouteArgs(
            key: key,
            place: place,
          ),
          initialChildren: children,
        );

  static const String name = 'PlaceDetailsRoute';

  static const PageInfo<PlaceDetailsRouteArgs> page =
      PageInfo<PlaceDetailsRouteArgs>(name);
}

class PlaceDetailsRouteArgs {
  const PlaceDetailsRouteArgs({
    this.key,
    required this.place,
  });

  final Key? key;

  final PlaceEntity place;

  @override
  String toString() {
    return 'PlaceDetailsRouteArgs{key: $key, place: $place}';
  }
}

/// generated route for
/// [PlaceListScreen]
class PlaceListRoute extends PageRouteInfo<void> {
  const PlaceListRoute({List<PageRouteInfo>? children})
      : super(
          PlaceListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
