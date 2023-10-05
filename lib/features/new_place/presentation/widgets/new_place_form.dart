import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/app_button.dart';
import 'package:interesting_places/features/new_place/presentation/widgets/image_row.dart';
import 'package:interesting_places/features/new_place/presentation/bloc/new_place_bloc.dart';
import 'package:interesting_places/features/new_place/presentation/widgets/choose_category_button.dart.dart';

class NewPlaceForm extends StatelessWidget {
  const NewPlaceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final newPlaceBloc = context.watch<NewPlaceBloc>();

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
                _Field(
                  borderColor: AppColors.green,
                  onChanged: (v) {
                    newPlaceBloc.add(UpdatePlaceStateEvent(name: v));
                  },
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
                _Field(
                  maxLines: 3,
                  borderColor: AppColors.lightGrey,
                  onChanged: (v) {
                    newPlaceBloc.add(UpdatePlaceStateEvent(description: v));
                  },
                ),
                const SizedBox(height: 28),
                const Spacer(),
                AppButton(
                  text: 'Создать',
                  onPressed: newPlaceBloc.state.isValid
                      ? () {
                          newPlaceBloc.add(CreatePlaceEvent());
                        }
                      : null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CoordinatesRow extends StatelessWidget {
  const _CoordinatesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final newPlaceBloc = context.watch<NewPlaceBloc>();
    final state = newPlaceBloc.state;

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
              _Field(
                borderColor: AppColors.green,
                onChanged: (v) {
                  newPlaceBloc.add(UpdatePlaceStateEvent(latitude: v));
                },
                isValid: state.latitude.isEmpty || state.isValidLatitude,
                keyboardType: TextInputType.number,
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
              _Field(
                borderColor: AppColors.green,
                onChanged: (v) {
                  newPlaceBloc.add(UpdatePlaceStateEvent(longitude: v));
                },
                isValid: state.longitude.isEmpty ||
                    newPlaceBloc.state.isValidLongitude,
                keyboardType: TextInputType.number,
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
  const _Field({
    super.key,
    required Color borderColor,
    this.maxLines,
    required this.onChanged,
    this.isValid = true,
    this.keyboardType,
  }) : _borderColor = isValid ? borderColor : AppColors.red;

  final int? maxLines;
  final void Function(String) onChanged;
  final bool isValid;
  final TextInputType? keyboardType;
  final Color _borderColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: _borderColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: _borderColor,
          ),
        ),
      ),
    );
  }
}
