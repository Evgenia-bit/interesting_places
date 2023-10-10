import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.router.pop(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.black,
        size: 24,
      ),
    );
  }
}
