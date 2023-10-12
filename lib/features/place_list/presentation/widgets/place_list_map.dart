import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/core/widgets/current_position_button.dart';
import 'package:interesting_places/core/widgets/map.dart';
import 'package:interesting_places/core/widgets/new_place_button.dart';
import 'package:interesting_places/features/get_current_position/presentation/bloc/get_current_position_bloc.dart';
import 'package:interesting_places/features/place_list/domain/entity/place_entity.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/place_list_item.dart';
import 'package:latlong2/latlong.dart';

class PlaceListMap extends StatefulWidget {
  const PlaceListMap({super.key});

  @override
  State<PlaceListMap> createState() => _PlaceListMapState();
}

class _PlaceListMapState extends State<PlaceListMap> {
  PlaceEntity? activePlace;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final filteredPlaces = context.watch<PlaceListBloc>().state.filteredPlaces;
    final currentPositionMarker = _currentPositionMarker(context);
    final List<Widget>? notRotatedChildren;

    if (activePlace == null) {
      notRotatedChildren = const [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: NewPlaceButton(),
          ),
        ),
        CurrentPositionButton()
      ];
    } else {
      notRotatedChildren = [
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CurrentPositionButton(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  bottom: 16.0,
                  left: 16.0,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: PlaceListItem(
                        place: activePlace!,
                        withDescription: false,
                        backgroundColor: colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ];
    }

    return MapView(
      nonRotatedChildren: notRotatedChildren,
      markers: [
        if (currentPositionMarker != null) currentPositionMarker,
        ...filteredPlaces
            .map(
              (place) => Marker(
                point: LatLng(place.latitude, place.longitude),
                width: 80,
                height: 80,
                builder: (BuildContext context) {
                  final isActive = activePlace?.id == place.id;
                  return IconButton(
                    iconSize: isActive ? 24 : 8,
                    onPressed: () {
                      setState(() {
                        activePlace = isActive ? null : place;
                      });
                    },
                    icon: Icon(
                      Icons.circle,
                      color:
                          isActive ? colorScheme.primary : colorScheme.tertiary,
                    ),
                  );
                },
              ),
            )
            .toList(),
      ],
    );
  }
}

Marker? _currentPositionMarker(BuildContext context) {
  final primaryColor = Theme.of(context).colorScheme.primary;
  final position = context.watch<GetCurrentPositionBloc>().state;

  if (position.latitude != null || position.longitude != null) {
    return Marker(
      point: LatLng(position.latitude!, position.longitude!),
      width: 104,
      height: 104,
      builder: (context) {
        return CircleAvatar(
          radius: 52,
          backgroundColor: primaryColor.withOpacity(0.12),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: primaryColor.withOpacity(0.24),
            child: SizedBox(
              height: 24,
              width: 24,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.white, width: 2),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.yellow,
                      primaryColor,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  return null;
}
