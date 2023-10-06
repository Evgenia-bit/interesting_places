import 'package:drift/drift.dart';

class Images extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get placeId => integer()();
  BlobColumn get data => blob()();
}
