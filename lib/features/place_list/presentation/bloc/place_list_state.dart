part of 'place_list_bloc.dart';

@immutable
class PlaceListState {
  const PlaceListState({
    this.placeList = const [],
    this.status = LoadPlaceListStatus.none,
  });

  final List<Place> placeList;
  final LoadPlaceListStatus status;
  PlaceListState copyWith({List<Place>? placeList}) {
    return PlaceListState(
      placeList: placeList ?? this.placeList,
    );
  }
}

enum LoadPlaceListStatus { none, processing, loaded, failed }
