part of 'place_list_bloc.dart';

@immutable
class PlaceListState {
  const PlaceListState({
    required this.placeList,
    required this.status,
    required this.activeCategories,
    required this.filteredPlaces,
    this.distanceLimit,
    this.distanceFilter,
  });

  final List<PlaceEntity> placeList;
  final LoadPlaceListStatus status;
  final List<bool> activeCategories;
  final List<PlaceEntity> filteredPlaces;
  final RangeValues? distanceLimit;
  final RangeValues? distanceFilter;

  PlaceListState copyWith({
    List<PlaceEntity>? placeList,
    LoadPlaceListStatus? status,
    List<bool>? activeCategories,
    List<PlaceEntity>? filteredPlaces,
    RangeValues? distanceLimit,
    RangeValues? distanceFilter,
  }) {
    
    return PlaceListState(
      placeList: placeList ?? this.placeList,
      status: status ?? this.status,
      activeCategories: activeCategories ?? this.activeCategories,
      filteredPlaces: filteredPlaces ?? this.filteredPlaces,
      distanceLimit: distanceLimit ?? this.distanceLimit,
      distanceFilter: distanceFilter ?? this.distanceFilter,
    );
  }
}

enum LoadPlaceListStatus { none, processing, loaded, failed }
