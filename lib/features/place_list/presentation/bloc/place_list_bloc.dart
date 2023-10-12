import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:interesting_places/core/data/models/category.dart';
import 'package:interesting_places/features/place_list/domain/entity/place_entity.dart';
import 'package:interesting_places/features/get_current_position/domain/repository/get_current_position_repository.dart';
import 'package:interesting_places/features/place_list/domain/repository/place_list_repository.dart';

part 'place_list_event.dart';
part 'place_list_state.dart';

final _initialState = PlaceListState(
  placeList: const [],
  status: LoadPlaceListStatus.none,
  activeCategories: List.filled(Category.values.length, true),
  filteredPlaces: const [],
);

class PlaceListBloc extends Bloc<PlaceListEvent, PlaceListState> {
  PlaceListBloc({
    required PlaceListRepository placeListRepository,
    required PositionRepository positionRepository,
  })  : _placeListRepository = placeListRepository,
        _positiontRepository = positionRepository,
        super(_initialState) {
    on<GetPlaceListEvent>(_handleGetPlaceList);
    on<SetFilterCategory>(_handleSetFilterCategory);
    on<SetFilterDistance>(_handleSetFilterDistance);
    on<ClearFilterEvent>(_handleClearFilter);
  }

  final PlaceListRepository _placeListRepository;
  final PositionRepository _positiontRepository;

  Future<void> _handleGetPlaceList(
    GetPlaceListEvent event,
    Emitter<PlaceListState> emit,
  ) async {
    if (state.status == LoadPlaceListStatus.processing) return;

    if (event.completer == null) {
      emit(state.copyWith(status: LoadPlaceListStatus.processing));
    }

    try {
      final position = await _positiontRepository.getCurrentPosition();
      var placeList = await _placeListRepository.getPlaceList(position);
      RangeValues? distanceLimit;
      RangeValues? distanceFilter;

      if (position != null) {
        _sortPlaceListByDistance(placeList);
        distanceLimit = _getDistanceLimit(placeList, position);
        distanceFilter = _getDistanceFilter(distanceLimit);
      }

      emit(state.copyWith(
        status: LoadPlaceListStatus.loaded,
        filteredPlaces: _filterPlaceList(placeList, distanceFilter),
        placeList: placeList,
        distanceFilter: distanceFilter,
        distanceLimit: distanceLimit,
      ));
    } catch (e) {
      emit(state.copyWith(status: LoadPlaceListStatus.failed));
    } finally {
      emit(state.copyWith(status: LoadPlaceListStatus.none));
      event.completer?.complete();
    }
  }

  void _handleSetFilterCategory(
    SetFilterCategory event,
    Emitter<PlaceListState> emit,
  ) {
    final activeCategories = state.activeCategories;
    activeCategories[event.categoryId] = !activeCategories[event.categoryId];

    emit(state.copyWith(
      activeCategories: activeCategories,
      filteredPlaces: _filterPlaceList(
        state.placeList,
        state.distanceFilter,
      ),
    ));
  }

  void _handleSetFilterDistance(
    SetFilterDistance event,
    Emitter<PlaceListState> emit,
  ) {
    emit(state.copyWith(
      filteredPlaces: _filterPlaceList(state.placeList, event.distance),
      distanceFilter: RangeValues(
        event.distance.start.roundToDouble(),
        event.distance.end.roundToDouble(),
      ),
    ));
  }

  void _handleClearFilter(
    ClearFilterEvent event,
    Emitter<PlaceListState> emit,
  ) {
    emit(state.copyWith(
      activeCategories: List.filled(Category.values.length, false),
      filteredPlaces: [],
      distanceFilter: state.distanceLimit,
    ));
  }

  List<PlaceEntity> _filterPlaceList(
    List<PlaceEntity> placeList,
    RangeValues? distanceFilter,
  ) {
    return placeList.where((p) {
      final isActiveCategory = state.activeCategories[p.category.index];
      final isIncludeDistance = p.distance == null ||
          (distanceFilter!.start <= p.distance! &&
              p.distance! <= distanceFilter.end);

      return isActiveCategory && isIncludeDistance;
    }).toList();
  }

  void _sortPlaceListByDistance(List<PlaceEntity> placeList) {
    placeList.sort((p1, p2) => p1.distance!.compareTo(p2.distance!));
  }

  RangeValues _getDistanceLimit(List<PlaceEntity> placeList, position) {
    final minDistance = (Geolocator.distanceBetween(
              position.latitude,
              position.longitude,
              placeList.first.latitude,
              placeList.first.longitude,
            ) /
            1000)
        .roundToDouble();
    final maxDistance = (Geolocator.distanceBetween(
              position.latitude,
              position.longitude,
              placeList.last.latitude,
              placeList.last.longitude,
            ) /
            1000)
        .roundToDouble();
    return RangeValues(minDistance, maxDistance);
  }

  RangeValues _getDistanceFilter(RangeValues distanceLimit) {
    if (state.distanceFilter == null) {
      return distanceLimit;
    } else {
      return RangeValues(
        max(state.distanceFilter!.start, distanceLimit.start),
        min(state.distanceFilter!.end, distanceLimit.end),
      );
    }
  }
}
