import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const AppButton({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
            Theme.of(context).textTheme.displaySmall,
          ),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.grey;
            }
            return AppColors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.lightestGrey;
              }
              return AppColors.green;
            },
          ),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
