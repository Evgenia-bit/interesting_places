import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

class NewPlaceButton extends StatelessWidget {
  const NewPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            AppColors.yellow,
            AppColors.green,
          ],
        ),
      ),
      child: TextButton(
        onPressed: () {
          context.router.push(const NewPlaceRoute());
        },
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              size: 24,
              color: AppColors.white,
            ),
            const SizedBox(width: 8),
            Text(
              'новое место'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}