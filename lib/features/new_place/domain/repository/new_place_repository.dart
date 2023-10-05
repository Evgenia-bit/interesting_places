import 'package:injectable/injectable.dart';
import 'package:interesting_places/core/data/database/database.dart';

@Injectable()
class NewPlaceRepository {
  NewPlaceRepository({
    required AppDatabase database,
  }) : _database = database;

  final AppDatabase _database;

  Future<void> save({
    required String name,
    required String description,
    required double latitude,
    required double longitude,
  }) async {
    await _database.into(_database.places).insert(
          PlacesCompanion.insert(
            name: '',
            description: '',
            latitude: latitude,
            longitude: longitude,
          ),
        );
  }
}
