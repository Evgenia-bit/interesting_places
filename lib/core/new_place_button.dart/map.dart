import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:interesting_places/features/get_current_position/presentation/bloc/get_current_position_bloc.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatefulWidget {
  final double? initialLatitude;
  final double? initialLongitude;
  final List<Widget>? nonRotatedChildren;
  final List<Marker>? markers;

  const MapView({
    super.key,
    this.initialLatitude,
    this.initialLongitude,
    this.nonRotatedChildren,
    this.markers,
  });

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final controller = MapController();
  double? _initialLatitude;
  double? _initialLongitude;

  @override
  void initState() {
    context.read<GetCurrentPositionBloc>().add(GetCurrentPositionEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final positionState = context.watch<GetCurrentPositionBloc>().state;

    if (widget.initialLatitude == null || widget.initialLongitude == null) {
      _initialLatitude = positionState.latitude;
      _initialLongitude = positionState.longitude;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

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
              center: LatLng(
                _initialLatitude!,
                _initialLongitude!,
              ),
              zoom: 13,
            ),
            nonRotatedChildren: widget.nonRotatedChildren ?? [],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              if (widget.markers != null)
                MarkerLayer(
                  markers: widget.markers!,
                ),
            ],
          );
        },
      ),
    );
  }
}
