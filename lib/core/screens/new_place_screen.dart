import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/widgets/cancel_button.dart';
import 'package:interesting_places/features/new_place/presentation/widgets/new_place_form.dart';

@RoutePage()
class NewPlaceScreen extends StatelessWidget {
  const NewPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Новое место',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.tertiary,
          ),
        ),
        leadingWidth: 80,
        leading: const CancelButton(),
      ),
      body: const NewPlaceForm(),
    );
  }
}
