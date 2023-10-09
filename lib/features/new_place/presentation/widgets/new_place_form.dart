import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/app_button.dart';
import 'package:interesting_places/features/new_place/presentation/widgets/image_row.dart';
import 'package:interesting_places/features/new_place/presentation/bloc/new_place_bloc.dart';
import 'package:interesting_places/features/new_place/presentation/widgets/choose_category_button.dart.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';

class NewPlaceForm extends StatelessWidget {
  const NewPlaceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final placeBloc = context.read<NewPlaceBloc>();
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
                    placeBloc.add(UpdatePlaceStateEvent(name: v));
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
                    placeBloc.add(UpdatePlaceStateEvent(description: v));
                  },
                ),
                const SizedBox(height: 28),
                const Spacer(),
                const _CreateButton(),
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
    final placeBloc = context.read<NewPlaceBloc>();

    final (latitude, longitude, isValidLatitude, isValidLongitude) =
        context.select(
      (NewPlaceBloc bloc) => (
        bloc.state.latitude,
        bloc.state.longitude,
        bloc.state.isValidLatitude,
        bloc.state.isValidLongitude,
      ),
    );

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
                borderColor: latitude.isEmpty || isValidLatitude
                    ? AppColors.green
                    : AppColors.red,
                onChanged: (v) {
                  placeBloc.add(UpdatePlaceStateEvent(latitude: v));
                },
                keyboardType: TextInputType.number,
                value: latitude,
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
                borderColor: longitude.isEmpty || isValidLongitude
                    ? AppColors.green
                    : AppColors.red,
                onChanged: (v) {
                  placeBloc.add(UpdatePlaceStateEvent(longitude: v));
                },
                keyboardType: TextInputType.number,
                value: longitude,
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
        onPressed: () {
          context.router.push(const MapRoute());
        },
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

class _CreateButton extends StatelessWidget {
  const _CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPlaceBloc, NewPlaceState>(
      listener: (context, state) {
        if (state.status == CreatePlaceStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Не удалось создать место'),
            ),
          );
        } else if (state.status == CreatePlaceStatus.created) {
          context.read<NewPlaceBloc>().add(ClearFormEvent());
          context.read<PlaceListBloc>().add(GetPlaceListEvent());
          context.router.pop();
        }
      },
      child: Builder(builder: (context) {
        final (status, isValid) = context.select((NewPlaceBloc bloc) => (
              bloc.state.status,
              bloc.state.isValid,
            ));

        return AppButton(
          onPressed: isValid
              ? () {
                  context.read<NewPlaceBloc>().add(CreatePlaceEvent());
                }
              : null,
          child: status == CreatePlaceStatus.processing
              ? Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(),
                )
              : Text('Создать'.toUpperCase()),
        );
      }),
    );
  }
}

class _Field extends StatefulWidget {
  const _Field({
    super.key,
    required this.borderColor,
    this.maxLines,
    required this.onChanged,
    this.keyboardType,
    this.value,
  });

  final int? maxLines;
  final void Function(String) onChanged;
  final TextInputType? keyboardType;
  final Color borderColor;
  final String? value;

  @override
  State<_Field> createState() => _FieldState();
}

class _FieldState extends State<_Field> {
  final _controller = TextEditingController();

  @override
  void didUpdateWidget(covariant _Field oldWidget) {
    if (widget.value != null) {
      _controller.text = widget.value!;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
      ),
    );
  }
}
