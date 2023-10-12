import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/cancel_button.dart';
import 'package:interesting_places/core/widgets/current_position_button.dart';
import 'package:interesting_places/core/widgets/map.dart';
import 'package:interesting_places/features/new_place/presentation/bloc/new_place_bloc.dart';

@RoutePage()
class PlacePointMapScreen extends StatefulWidget {
  const PlacePointMapScreen({super.key});

  @override
  State<PlacePointMapScreen> createState() => _PlacePointMapScreenState();
}

class _PlacePointMapScreenState extends State<PlacePointMapScreen> {
  final _mapKey = GlobalKey<MapViewState>();
  double? _initialLatitude;
  double? _initialLongitude;

  @override
  void initState() {
    final placeState = context.read<NewPlaceBloc>().state;
    if (placeState.isValidLatitude && placeState.isValidLongitude) {
      _initialLatitude = double.tryParse(placeState.latitude);
      _initialLongitude = double.tryParse(placeState.longitude);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Местоположение',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.tertiary,
          ),
        ),
        leadingWidth: 80,
        leading: const CancelButton(),
        actions: [
          TextButton(
            onPressed: () {
              final center = _mapKey.currentState?.controller.center;

              context.read<NewPlaceBloc>().add(
                    UpdatePlaceStateEvent(
                      latitude: center?.latitude.toStringAsFixed(6),
                      longitude: center?.longitude.toStringAsFixed(6),
                    ),
                  );

              context.router.pop();
            },
            child: Text(
              'Готово',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: theme.colorScheme.primary),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.lightestGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'потяните карту чтобы выбрать правильное местоположение',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: MapView(
              key: _mapKey,
              initialLatitude: _initialLatitude,
              initialLongitude: _initialLongitude,
              nonRotatedChildren: [
                Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: theme.colorScheme.tertiary,
                      fontSize: 56,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                const CurrentPositionButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
