import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/add_image/presentation/widgets/image_row.dart';
import 'package:interesting_places/features/create_new_place/presentation/widgets/choose_category_button.dart.dart';

class CreateNewPlaceForm extends StatelessWidget {
  const CreateNewPlaceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ImageRow()),
         SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Категория'.toUpperCase(),
                    style: textTheme.labelSmall,
                  ),
                  const ChooseCategoryButton(),
                  const SizedBox(height: 24),
                  Text(
                    'Название'.toUpperCase(),
                    style: textTheme.labelSmall,
                  ),
                  const SizedBox(height: 12),
                  const _Field(
                    borderColor: AppColors.green,
                  ),
                  const SizedBox(height: 24),
                  const _CoordinatesRow(),
                  const _MapButton(),
                  const SizedBox(height: 24),
                  Text(
                    'Описание'.toUpperCase(),
                    style: textTheme.labelSmall,
                  ),
                  const SizedBox(height: 12),
                  const _Field(
                    maxLines: 3,
                    borderColor: AppColors.lightGrey,
                  ),
                  const Spacer(),
                  const _CreateButton()
                ],
              ),
            ),
          ),
        
      ],
    );
  }
}

class _CoordinatesRow extends StatelessWidget {
  const _CoordinatesRow({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Широта'.toUpperCase(),
                style: textTheme.labelSmall,
              ),
              const SizedBox(height: 12),
              const _Field(
                borderColor: AppColors.green,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Долгота'.toUpperCase(),
                style: textTheme.labelSmall,
              ),
              const SizedBox(height: 12),
              const _Field(
                borderColor: AppColors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MapButton extends StatelessWidget {
  const _MapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Указать на карте',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.green,
                ),
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final Color borderColor;
  final int? maxLines;

  const _Field({
    super.key,
    required this.borderColor,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: borderColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor:
              const MaterialStatePropertyAll(AppColors.lightestGrey),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Создать'.toUpperCase(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
