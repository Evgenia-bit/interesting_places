import 'package:flutter/services.dart';
import 'package:interesting_places/core/data/models/category.dart';

class PlaceEntity {
  const PlaceEntity({
    required this.id,
    required this.imageList,
    required this.name,
    required this.description,
    required this.category,
    required this.latitude,
    required this.longitude,
    this.distance,
  });

  final int id;
  final List<Uint8List> imageList;
  final String name;
  final String description;
  final Category category;
  final double latitude;
  final double longitude;
  final double? distance;
}
