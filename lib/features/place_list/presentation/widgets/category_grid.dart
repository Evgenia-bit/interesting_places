import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/core/data/models/category.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
import 'package:provider/provider.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final placeListBloc = context.watch<PlaceListBloc>();
    final activeCategories = placeListBloc.state.activeCategories;

    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        children: Category.values.indexed
            .map(
              (c) => _CategoryGridItem(
                category: c.$2,
                isActive: activeCategories[c.$1],
                onPressed: () {
                  placeListBloc.add(SetFilterCategory(categoryId: c.$1));
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class _CategoryGridItem extends StatelessWidget {
  final Category category;
  final bool isActive;
  final VoidCallback onPressed;

  const _CategoryGridItem({
    super.key,
    required this.category,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightestGreen,
                radius: 32,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    'assets/icons/${category.iconFileName}',
                  ),
                ),
              ),
              if (isActive)
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.black,
                    size: 16,
                  ),
                )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: AppColors.black),
          )
        ],
      ),
    );
  }
}