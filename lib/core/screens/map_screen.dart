import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/cancel_button.dart';
import 'package:interesting_places/features/get_current_position/presentation/bloc/get_current_position_bloc.dart';
import 'package:interesting_places/features/new_place/presentation/bloc/new_place_bloc.dart';
import 'package:latlong2/latlong.dart';

@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _mapKey = GlobalKey<_MapState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Местоположение',
          style: textTheme.headlineSmall,
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
                  ?.copyWith(color: AppColors.green),
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
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: _Map(
              key: _mapKey,
            ),
          ),
        ],
      ),
    );
  }
}

class _Map extends StatefulWidget {
  const _Map({super.key});

  @override
  State<_Map> createState() => _MapState();
}

class _MapState extends State<_Map> {
  final controller = MapController();
  double? _initialLatitude;
  double? _initialLongitude;

  @override
  void initState() {
    final placeState = context.read<NewPlaceBloc>().state;
    if (placeState.isValidLatitude && placeState.isValidLongitude) {
      _initialLatitude = double.tryParse(placeState.latitude);
      _initialLongitude = double.tryParse(placeState.longitude);
    } else {
      context.read<GetCurrentPositionBloc>().add(GetCurrentPositionEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final positionState = context.watch<GetCurrentPositionBloc>().state;

    if (_initialLatitude == null || _initialLongitude == null) {
      _initialLatitude = positionState.latitude;
      _initialLongitude = positionState.longitude;
      setState(() {});
    }

    return BlocListener<GetCurrentPositionBloc, GetCurrentPositionState>(
      listener: (context, state) {
        if (state.status == GetCurrentPositionStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ??
                  'Не удалось получить текущее местоположение'),
            ),
          );
        }

        if (state.status == GetCurrentPositionStatus.success &&
            state.latitude != null &&
            state.longitude != null) {
          controller.move(
            LatLng(state.latitude!, state.longitude!),
            controller.zoom,
          );
          setState(() {});
        }
      },
      child: Builder(
        builder: (context) {
          if (_initialLatitude == null || _initialLongitude == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return FlutterMap(
            mapController: controller,
            options: MapOptions(
              center: LatLng(_initialLatitude!, _initialLongitude!),
              zoom: 13,
            ),
            nonRotatedChildren: [
              const Center(
                child: Text(
                  '+',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 56,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context
                              .read<GetCurrentPositionBloc>()
                              .add(GetCurrentPositionEvent());
                        },
                        iconSize: 24,
                        icon: Transform.rotate(
                          angle: pi / 4,
                          child: const Icon(
                            Icons.navigation,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
            ],
          );
        },
      ),
    );
  }
}
