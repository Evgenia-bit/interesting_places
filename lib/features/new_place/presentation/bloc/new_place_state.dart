part of 'new_place_bloc.dart';

@immutable
class NewPlaceState {
  const NewPlaceState({
    this.status = NewPlaceStatus.none,
    this.imageFileNameList = const [],
    this.category,
    this.name = '',
    this.latitude = '',
    this.longitude = '',
    this.description = '',
  });

  final NewPlaceStatus status;
  final List<String> imageFileNameList;
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
      imageFileNameList.isNotEmpty &&
      category != null &&
      name.isNotEmpty &&
      latitude.isNotEmpty &&
      longitude.isNotEmpty &&
      isValidLatitude &&
      isValidLongitude &&
      description.isNotEmpty;

  NewPlaceState copyWith({
    NewPlaceStatus? status,
    List<String>? imageFileNameList,
    Category? category,
    String? name,
    String? latitude,
    String? longitude,
    String? description,
  }) {
    return NewPlaceState(
      status: status ?? this.status,
      imageFileNameList: imageFileNameList ?? this.imageFileNameList,
      category: category ?? this.category,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
    );
  }
}

enum NewPlaceStatus { none, processing, created, failed }
