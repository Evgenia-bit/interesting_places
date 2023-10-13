import 'package:flutter/material.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/theme.dart';
import 'package:interesting_places/features/add_image/add_image_module.dart';
import 'package:interesting_places/features/get_current_position/get_current_position_module.dart';
import 'package:interesting_places/features/new_place/new_place_module.dart';
import 'package:interesting_places/features/place_list/place_list_module.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [
        AddImageModule(),
        NewPlaceModule(),
        GetCurrentPositionModule(),
        PlaceListModule(),
      ],
      child: MaterialApp.router(
        theme: lightTheme,
        darkTheme: darkTheme,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
