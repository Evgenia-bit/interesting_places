part of 'place_list_bloc.dart';

@immutable
sealed class PlaceListEvent {}

class GetPlaceListEvent extends PlaceListEvent {
  GetPlaceListEvent({this.completer});

  final Completer? completer;
}

class SetFilterCategory extends PlaceListEvent {
  final int categoryId;

  SetFilterCategory({
    required this.categoryId,
  });
}

class SetFilterDistance extends PlaceListEvent {
  final RangeValues distance;

  SetFilterDistance({
    required this.distance,
  });
}

class ClearFilterEvent extends PlaceListEvent {}
