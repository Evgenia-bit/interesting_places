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
    final placeList = await _database.select(_database.places).get();
    final imageList = await _database.select(_database.images).get();
    final placeEntityList = placeList.map(
      (p) 
      { return PlaceEntity(
        imageList: imageList.where((image) => image.placeId = p.id).toList(),
        name: name,
        description: description,
        category: category,
        latitude: latitude,
        longitude: longitude,
      );}
    );
    for (var place in placeList) {}
  }
}
