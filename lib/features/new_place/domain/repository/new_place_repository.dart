import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:interesting_places/core/data/database/database.dart';
import 'package:interesting_places/core/data/models/category.dart';

@Injectable()
class NewPlaceRepository {
  NewPlaceRepository({
    required AppDatabase database,
  }) : _database = database;

  final AppDatabase _database;

  Future<void> save({
    required List<String> imagePathList,
    required Category category,
    required String name,
    required String description,
    required double latitude,
    required double longitude,
  }) async {
    final placeId = await _database.into(_database.places).insert(
          PlacesCompanion.insert(
            category: category,
            name: name,
            description: description,
            latitude: latitude,
            longitude: longitude,
          ),
        );
    for (var path in imagePathList) {
      await _database.into(_database.images).insert(
            ImagesCompanion.insert(
              placeId: placeId,
              data: getBlobFromPath(path),
            ),
          );
    }
  }

  Uint8List getBlobFromPath(String path) {
    return Uint8List.fromList(File(path).readAsBytesSync());
  }
}
