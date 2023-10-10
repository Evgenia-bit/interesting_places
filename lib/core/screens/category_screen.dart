import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/data/models/category.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/app_button.dart';
import 'package:interesting_places/features/new_place/presentation/bloc/new_place_bloc.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Category? activeCategory;

  @override
  void initState() {
    activeCategory = context.read<NewPlaceBloc>().state.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Категория',
          style: textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ...Category.values
                .map(
                  (c) => _CategoryListItem(
                    name: c.name,
                    isActive: c == activeCategory,
                    onPressed: () {
                      setState(() {
                        activeCategory = c;
                      });
                    },
                  ),
                )
                .toList(),
            const Spacer(),
            AppButton(
              onPressed: activeCategory != null
                  ? () {
                      context.read<NewPlaceBloc>().add(
                            UpdatePlaceStateEvent(category: activeCategory),
                          );
                      context.router.pop();
                    }
                  : null,
              child: Text('Сохранить'.toUpperCase()),
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryListItem extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final bool isActive;

  const _CategoryListItem({
    super.key,
    required this.name,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.lightestGrey,
            ),
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.black),
              ),
              if (isActive)
                const Icon(
                  Icons.check,
                  color: AppColors.green,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
