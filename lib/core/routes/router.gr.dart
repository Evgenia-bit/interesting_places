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
    EmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FilterScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
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
    PlaceListMapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceListMapScreen(),
      );
    },
    PlaceListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceListScreen(),
      );
    },
    PlacePointMapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlacePointMapScreen(),
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
/// [EmptyScreen]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

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
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

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
/// [PlaceListMapScreen]
class PlaceListMapRoute extends PageRouteInfo<void> {
  const PlaceListMapRoute({List<PageRouteInfo>? children})
      : super(
          PlaceListMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceListMapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

/// generated route for
/// [PlacePointMapScreen]
class PlacePointMapRoute extends PageRouteInfo<void> {
  const PlacePointMapRoute({List<PageRouteInfo>? children})
      : super(
          PlacePointMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlacePointMapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
