import 'package:drift/drift.dart';
import 'package:interesting_places/core/data/models/category.dart';

class Places extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get category => intEnum<Category>()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
}
