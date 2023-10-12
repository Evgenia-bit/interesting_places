import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

class DistanceSlider extends StatelessWidget {
  const DistanceSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Расстояние',
              style: textTheme.labelMedium?.copyWith(
                color: AppColors.black,
              ),
            ),
            Text(
              'от 10 до 30 км',
              style: textTheme.labelMedium?.copyWith(
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
            activeTrackColor: AppColors.green,
            inactiveTrackColor: AppColors.lightGrey,
            thumbShape: const RoundSliderThumbShape(elevation: 10),
            thumbColor: AppColors.white,
            inactiveTickMarkColor: Colors.white,
          ),
          child: RangeSlider(
            labels: RangeLabels(
              10.round().toString(),
              30.round().toString(),
            ),
            values: const RangeValues(10, 30),
            max: 50,
            onChanged: (v) {},
          ),
        ),
      ],
    );
  }
}
