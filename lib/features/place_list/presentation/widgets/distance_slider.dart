import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
import 'package:provider/provider.dart';

class DistanceSlider extends StatelessWidget {
  const DistanceSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (distanceLimit, distanceFilter) = context.select(
      (PlaceListBloc bloc) => (
        bloc.state.distanceLimit,
        bloc.state.distanceFilter,
      ),
    );

    if (distanceLimit == null || distanceFilter == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Расстояние',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.tertiary,
              ),
            ),
            Text(
              'от ${distanceFilter.start.toInt()} до ${distanceFilter.end.toInt()} км',
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2,
            overlayShape: SliderComponentShape.noOverlay,
            activeTrackColor: theme.colorScheme.primary,
            inactiveTrackColor: AppColors.lightGrey,
            thumbShape: const RoundSliderThumbShape(elevation: 10),
            thumbColor: AppColors.white,
            inactiveTickMarkColor: Colors.white,
          ),
          child: RangeSlider(
            values: distanceFilter,
            min: distanceLimit.start,
            max: distanceLimit.end,
            onChanged: (v) {
              context.read<PlaceListBloc>().add(SetFilterDistance(distance: v));
            },
          ),
        ),
      ],
    );
  }
}
