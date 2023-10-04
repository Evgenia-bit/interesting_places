import 'package:flutter/material.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/theme.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      routerConfig: _appRouter.config(),
    );
  }
}
