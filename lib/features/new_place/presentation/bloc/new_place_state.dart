part of 'new_place_bloc.dart';

@immutable
class NewPlaceState {
  const NewPlaceState({
    this.status = CreatePlaceStatus.none,
    this.imagePathList = const [],
    this.category,
    this.name = '',
    this.latitude = '',
    this.longitude = '',
    this.description = '',
  });

  final CreatePlaceStatus status;
  final List<String> imagePathList;
  final Category? category;
  final String name;
  final String latitude;
  final String longitude;
  final String description;

  bool get isValidLatitude {
    final lat = double.tryParse(latitude);
    return lat != null && -90 <= lat && lat <= 90;
  }

  bool get isValidLongitude {
    final lon = double.tryParse(longitude);
    return lon != null && -180 <= lon && lon <= 180;
  }

  bool get isValid =>
      imagePathList.isNotEmpty &&
      category != null &&
      name.isNotEmpty &&
      isValidLatitude &&
      isValidLongitude &&
      description.isNotEmpty;

  NewPlaceState copyWith({
    CreatePlaceStatus? status,
    List<String>? imagePathList,
    Category? category,
    String? name,
    String? latitude,
    String? longitude,
    String? description,
  }) {
    return NewPlaceState(
      status: status ?? this.status,
      imagePathList: imagePathList ?? this.imagePathList,
      category: category ?? this.category,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
    );
  }
}

enum CreatePlaceStatus { none, processing, created, failed }
