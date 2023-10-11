import 'package:drift/drift.dart';
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

  Future<List<PlaceEntity>> getPlaceList(Position? currentPosition) async {
    final placeList = await (_database.select(_database.places)
          ..orderBy(
            [
              (p) => OrderingTerm(expression: p.id, mode: OrderingMode.desc),
            ],
          ))
        .get();

    final imageList = await _database.select(_database.images).get();

    return placeList
        .map(
          (place) => PlaceEntity(
            id: place.id,
            imageList: _getImageBlobListForPlace(imageList, place.id),
            name: place.name,
            description: place.description,
            category: place.category,
            latitude: place.latitude,
            longitude: place.longitude,
            distance: _getDistance(place, currentPosition),
          ),
        )
        .toList();
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

  double? _getDistance(Place place, Position? currentPosition) {
    if (currentPosition != null) {
      return Geolocator.distanceBetween(
        place.latitude,
        place.longitude,
        currentPosition.latitude,
        currentPosition.longitude,
      ) / 1000;
    }
    return null;
  }
}
