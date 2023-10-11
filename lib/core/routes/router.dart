import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/screens/category_screen.dart';
import 'package:interesting_places/core/screens/empty_route.dart';
import 'package:interesting_places/core/screens/filter_screen.dart';
import 'package:interesting_places/core/screens/main_screen.dart';
import 'package:interesting_places/core/screens/place_list_map_screen.dart';
import 'package:interesting_places/core/screens/place_point_map_screen.dart';
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
          page: MainRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: PlaceListRoute.page,
              path: 'place_list',
            ),
            AutoRoute(
              page: PlaceListMapRoute.page,
              path: 'place_list_map',
            ),
            AutoRoute(
              page: EmptyRoute.page,
              path: 'empty',
            ),
          ],
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
          page: PlacePointMapRoute.page,
          path: '/place_point_on_map',
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
