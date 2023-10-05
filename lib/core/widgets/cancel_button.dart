import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'Отмена',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      onPressed: () {
        context.router.pop();
      },
    );
  }
}
