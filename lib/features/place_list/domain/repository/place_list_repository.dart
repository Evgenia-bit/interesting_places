import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:interesting_places/core/data/database/database.dart';
import 'package:interesting_places/features/place_list/domain/entity/place_entity.dart';

@Injectable()
class PlaceListRepository {
  PlaceListRepository({
    required AppDatabase database,
  }) : _database = database;

  final AppDatabase _database;

  Future<List<PlaceEntity>> getPlaceList() async {
    final placeList = await (_database.select(_database.places)
          ..orderBy(
            [
              (p) => OrderingTerm(expression: p.id, mode: OrderingMode.desc),
            ],
          ))
        .get();
        
    final imageList = await _database.select(_database.images).get();

    return placeList.map(
      (place) {
        return PlaceEntity(
          imageList: _getImageBlobListForPlace(imageList, place.id),
          name: place.name,
          description: place.description,
          category: place.category,
          latitude: place.latitude,
          longitude: place.longitude,
        );
      },
    ).toList();
  }

  List<Uint8List> _getImageBlobListForPlace(
    List<Image> imageList,
    int placeId,
  ) {
    final List<Uint8List> imageBlobList = [];
    for (final image in imageList) {
      if (image.placeId == placeId) {
        imageBlobList.add(image.data);
      }
    }
    return imageBlobList;
  }

  void sortPlaceListByDistance(
    List<PlaceEntity> placeList,
    Position currentPosition,
  ) {
    placeList.sort(
      (place1, place2) {
        final place1Distance = Geolocator.distanceBetween(
          place1.latitude,
          place1.longitude,
          currentPosition.latitude,
          currentPosition.longitude,
        );

        final place2Distance = Geolocator.distanceBetween(
          place2.latitude,
          place2.longitude,
          currentPosition.latitude,
          currentPosition.longitude,
        );

        return place1Distance.compareTo(place2Distance);
      },
    );
  }
}
