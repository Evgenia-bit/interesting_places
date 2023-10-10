import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/screens/category_screen.dart';
import 'package:interesting_places/core/screens/filter_screen.dart';
import 'package:interesting_places/core/screens/map_screen.dart';
import 'package:interesting_places/core/screens/new_place_screen.dart';
import 'package:interesting_places/core/screens/place_details_screen.dart';
import 'package:interesting_places/core/screens/place_list_screen.dart';
import 'package:interesting_places/features/place_list/domain/entity/place_entity.dart';

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
        AutoRoute(
          page: FilterRoute.page,
          path: '/filter',
        ),
        AutoRoute(
          page: PlaceDetailsRoute.page,
          path: '/details',
        ),
      ];
}
