part of 'new_place_bloc.dart';

@immutable
sealed class NewPlaceEvent {}

class CreatePlaceEvent extends NewPlaceEvent {}

class UpdatePlaceStateEvent extends NewPlaceEvent {
  UpdatePlaceStateEvent({
    this.category,
    this.name,
    this.latitude,
    this.longitude,
    this.description,
  });

  final Category? category;
  final String? name;
  final String? latitude;
  final String? longitude;
  final String? description;
}

class AddImageToPlaceStateEvent extends NewPlaceEvent {
  AddImageToPlaceStateEvent({required this.path});
  final String path;
}

class DeleteImageFromPlaceStateEvent extends NewPlaceEvent {
  DeleteImageFromPlaceStateEvent({required this.path});
  final String path;
}

class ClearFormEvent extends NewPlaceEvent {
  ClearFormEvent();
}
