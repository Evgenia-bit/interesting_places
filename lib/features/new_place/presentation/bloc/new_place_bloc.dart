import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/features/category/data/models/category.dart';

part 'new_place_event.dart';
part 'new_place_state.dart';

const _initialState = NewPlaceState();

class NewPlaceBloc extends Bloc<NewPlaceEvent, NewPlaceState> {
  NewPlaceBloc() : super(_initialState) {
    on<CreatePlaceEvent>(_handleCreatePlaceEvent);
    on<UpdatePlaceStateEvent>(_handleUpdateEvent);
    on<AddImageToPlaceStateEvent>(_handleAddImageToPlaceStateEvent);
    on<DeleteImageFromPlaceStateEvent>(_handleDeleteImageFromPlaceStateEvent);
  }

  void _handleCreatePlaceEvent(
    CreatePlaceEvent event,
    Emitter<NewPlaceState> emit,
  ) {
    //TODO: save place
  }

  void _handleUpdateEvent(
    UpdatePlaceStateEvent event,
    Emitter<NewPlaceState> emit,
  ) {
    emit(state.copyWith(
      category: event.category,
      name: event.name,
      latitude: event.latitude,
      longitude: event.longitude,
      description: event.description,
    ));
  }

  void _handleAddImageToPlaceStateEvent(
    AddImageToPlaceStateEvent event,
    Emitter<NewPlaceState> emit,
  ) {
    emit(
      state.copyWith(
        imagePathList: [...state.imagePathList, event.path],
      ),
    );
  }

  void _handleDeleteImageFromPlaceStateEvent(
    DeleteImageFromPlaceStateEvent event,
    Emitter<NewPlaceState> emit,
  ) {
    final imagePathList = state.imagePathList;
    imagePathList.remove(event.path);
    emit(
      state.copyWith(
        imagePathList: imagePathList,
      ),
    );
  }



}
