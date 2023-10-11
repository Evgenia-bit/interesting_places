import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interesting_places/core/data/models/category.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/app_button.dart';
import 'package:interesting_places/core/widgets/custom_back_button.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/category_grid.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/distance_slider.dart';

@RoutePage()
class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const AppBarBackButton(),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Очистить',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: AppColors.green),
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
              style: textTheme.labelSmall?.copyWith(
                color: AppColors.lightGrey,
              ),
            ),
            const SizedBox(height: 24),
            const CategoryGrid(),
            const SizedBox(height: 50),
            const DistanceSlider(),
            const Spacer(),
            _ShowButton(
              count: 10,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class _ShowButton extends StatelessWidget {
  final int count;
  final VoidCallback onPressed;
  const _ShowButton({
    super.key,
    required this.count,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: count == 0 ? null : onPressed,
      child: Text('ПОКАЗАТЬ ($count)'),
    );
  }
}
