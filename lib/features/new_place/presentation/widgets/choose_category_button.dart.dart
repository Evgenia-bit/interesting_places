import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/new_place/presentation/bloc/new_place_bloc.dart';

class ChooseCategoryButton extends StatelessWidget {
  const ChooseCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final category = context.watch<NewPlaceBloc>().state.category;
    
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.lightGrey),
        ),
      ),
      child: TextButton(
        onPressed: () {
          context.router.push(const CategoryRoute());
        },
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.all(0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category == null ? 'Не выбрано' : category.name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
