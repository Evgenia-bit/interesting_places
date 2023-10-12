import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      var placeList = await _placeListRepository.getPlaceList();
      final position = await _positiontRepository.getCurrentPosition();

      if (position != null) {
        _placeListRepository.sortPlaceListByDistance(placeList, position);
      }


      emit(state.copyWith(
        status: LoadPlaceListStatus.loaded,
        placeList: placeList,
        filteredPlaces: _filterPlaceList(placeList),
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
      filteredPlaces: _filterPlaceList(state.placeList),
    ));
  }

  List<PlaceEntity> _filterPlaceList(List<PlaceEntity> placeList) {
    return placeList
        .where((p) => state.activeCategories[p.category.index])
        .toList();
  }
}
