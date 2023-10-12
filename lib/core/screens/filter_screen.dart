import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/app_button.dart';
import 'package:interesting_places/core/widgets/custom_back_button.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/category_grid.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/distance_slider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const AppBarBackButton(),
        actions: [
          TextButton(
            onPressed: () {
              context.read<PlaceListBloc>().add(ClearFilterEvent());
            },
            child: Text(
              'Очистить',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: theme.colorScheme.primary),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Категории'.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: AppColors.lightGrey,
              ),
            ),
            const SizedBox(height: 24),
            const CategoryGrid(),
            const SizedBox(height: 50),
            const DistanceSlider(),
            const Spacer(),
            const _ShowButton(),
          ],
        ),
      ),
    );
  }
}

class _ShowButton extends StatelessWidget {
  const _ShowButton({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select(
      (PlaceListBloc bloc) => bloc.state.filteredPlaces.length,
    );
    return AppButton(
      onPressed: count == 0
          ? null
          : () {
              context.router.pop();
            },
      child: Text('ПОКАЗАТЬ ($count)'),
    );
  }
}
