import 'package:drift/drift.dart';

class DuaTable extends Table {
  @override
  String get tableName => 'duas';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get lang => text()();
  IntColumn get categoryId => integer()();
  IntColumn get surahId => integer()();
  TextColumn get ayahId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get uthmani => text()();
  TextColumn get indopak => text()();
  TextColumn get translation => text()();
  TextColumn get reference => text()();
  TextColumn get audio => text().nullable()();
}
