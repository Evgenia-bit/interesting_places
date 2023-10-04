part of 'new_place_bloc.dart';

@immutable
class NewPlaceState {
  final List<String> imageFileNameList;
  final Category? category;
  final String name;
  final double? latitude;
  final double? longitude;
  final String description;

  const NewPlaceState({
    this.imageFileNameList = const [],
    this.name = '',
    this.description = '',
    this.category,
    this.latitude,
    this.longitude,
  });

  NewPlaceState copyWith({
    List<String>? imageFileNameList,
    Category? category,
    String? name,
    double? latitude,
    double? longitude,
    String? description,
  }) {
    return NewPlaceState(
      imageFileNameList: imageFileNameList ?? this.imageFileNameList,
      category: category ?? this.category,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
    );
  }
}
