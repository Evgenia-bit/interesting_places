import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/widgets/search_field.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/place_list_map.dart';

@RoutePage()
class PlaceListMapScreen extends StatelessWidget {
  const PlaceListMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 56,
        title: Text(
          'Карта',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.tertiary,
          ),
        ),
      ),
      body: const Column(
        children: [
          SearchField(),
          SizedBox(height: 12),
          Expanded(child: PlaceListMap()),
        ],
      ),
    );
  }
}
