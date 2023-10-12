import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PositionRepository {
  Future<Position?> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      return position;
    } catch (_) {
      return null;
    }
  }
}
