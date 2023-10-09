import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/data/database/database.dart';
import 'package:interesting_places/features/place_list/domain/repository/place_list_repository.dart';

part 'place_list_event.dart';
part 'place_list_state.dart';

class PlaceListBloc extends Bloc<PlaceListEvent, PlaceListState> {
  PlaceListBloc({required PlaceListRepository repository})
      : _repository = repository,
        super(const PlaceListState()) {
    on<GetPlaceListEvent>(_handleGetPlaceList);
  }

  final PlaceListRepository _repository;
  Future<void> _handleGetPlaceList(
      GetPlaceListEvent _, Emitter<PlaceListState> emit)  async {
        _repository.getPlaceList();
      }
}
