import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.router.pop(),
      icon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.tertiary,
        size: 24,
      ),
    );
  }
}
