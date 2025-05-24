import 'package:drift/drift.dart';

class CategoriesTable extends Table {
  @override
  String get tableName => 'category';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lang => text()();
  TextColumn get category => text()();
  IntColumn get duaCount => integer()();
}
