import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/app_button.dart';
import 'package:interesting_places/features/category/presentation/bloc/category_bloc.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int? activeCategoryId;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final category = context.watch<CategoryBloc>().state.categoryList;

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
            ...category
                .map(
                  (c) => _CategoryListItem(
                    name: c.name,
                    isActive: c.id == activeCategoryId,
                    onPressed: () {
                      setState(() {
                        activeCategoryId = c.id;
                      });
                    },
                  ),
                )
                .toList(),
            const Spacer(),
            AppButton(
              text: 'Сохранить',
              onPressed: activeCategoryId != null
                  ? () {
                      context.router.pop();
                    }
                  : null,
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
                style: Theme.of(context).textTheme.labelMedium,
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
