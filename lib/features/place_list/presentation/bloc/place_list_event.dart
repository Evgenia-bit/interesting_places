part of 'place_list_bloc.dart';

@immutable
sealed class PlaceListEvent {}

class GetPlaceListEvent extends PlaceListEvent {
  GetPlaceListEvent({this.completer});

  final Completer? completer;
}
