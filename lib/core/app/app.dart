import 'package:flutter/material.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/theme.dart';
import 'package:interesting_places/features/add_image/add_image_module.dart';
import 'package:interesting_places/features/new_place/new_place_module.dart';
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
      ],
      child: MaterialApp.router(
        theme: theme,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
