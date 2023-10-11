part of 'place_list_bloc.dart';

@immutable
class PlaceListState {
  const PlaceListState({
    this.placeList = const [],
    this.status = LoadPlaceListStatus.none,
  });

  final List<PlaceEntity> placeList;
  final LoadPlaceListStatus status;

  PlaceListState copyWith({
    List<PlaceEntity>? placeList,
    LoadPlaceListStatus? status,
  }) {
    return PlaceListState(
      placeList: placeList ?? this.placeList,
      status: status ?? this.status,
    );
  }
}

enum LoadPlaceListStatus { none, processing, loaded, failed }
