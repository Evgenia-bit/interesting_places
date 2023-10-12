part of 'place_list_bloc.dart';

@immutable
class PlaceListState {
  const PlaceListState({
    required this.placeList,
    required this.status,
    required this.activeCategories,
    required this.filteredPlaces,
  });

  final List<PlaceEntity> placeList;
  final LoadPlaceListStatus status;
  final List<bool> activeCategories;
  final List<PlaceEntity> filteredPlaces;

  PlaceListState copyWith({
    List<PlaceEntity>? placeList,
    LoadPlaceListStatus? status,
    List<bool>? activeCategories,
    List<PlaceEntity>? filteredPlaces,
  }) {
    return PlaceListState(
      placeList: placeList ?? this.placeList,
      status: status ?? this.status,
      activeCategories: activeCategories ?? this.activeCategories,
      filteredPlaces: filteredPlaces ?? this.filteredPlaces,
    );
  }
}

enum LoadPlaceListStatus { none, processing, loaded, failed }
