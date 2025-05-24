import 'package:drift/drift.dart';
import 'package:portfolio/core/utility/trial_utility.dart';
import 'package:portfolio/data/services/database/database_loader.dart';
import 'package:portfolio/data/services/database/tables/categories_table.dart';
import 'package:portfolio/data/services/database/tables/dua_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [DuaTable, CategoriesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? queryExecutor})
    : super(queryExecutor ?? loadDatabase());

  @override
  int get schemaVersion => 1;

  // Dua related functions
  Future<List<DuaTableData>> getAllDuasByLang({
    required String language,
  }) async {
    return await catchAndReturnFuture<List<DuaTableData>>(() async {
          return await (select(duaTable)
            ..where((t) => t.lang.equals(language))).get();
        }) ??
        [];
  }

  Future<DuaTableData?> getDuaByIdAndLang({
    required int id,
    required String language,
  }) async {
    return await catchAndReturnFuture<DuaTableData?>(() async {
      return await (select(duaTable)..where(
        (t) => t.id.equals(id) & t.lang.equals(language),
      )).getSingleOrNull();
    });
  }

  Future<List<DuaTableData>> getDuasByCategoryAndLang({
    required int categoryId,
    required String language,
  }) async {
    return await catchAndReturnFuture<List<DuaTableData>>(() async {
          return await (select(duaTable)..where(
            (t) => t.categoryId.equals(categoryId) & t.lang.equals(language),
          )).get();
        }) ??
        [];
  }

  // Category related functions
  Future<List<CategoriesTableData>> getAllCategoriesByLang({
    required String language,
  }) async {
    try {
      return await (select(categoriesTable)
        ..where((t) => t.lang.equals(language))).get();
    } catch (e) {
      return [];
    }
  }

  Future<CategoriesTableData?> getCategoryByIdAndLang({
    required int id,
    required String language,
  }) async {
    return await catchAndReturnFuture<CategoriesTableData?>(() async {
      return await (select(categoriesTable)..where(
        (t) => t.id.equals(id) & t.lang.equals(language),
      )).getSingleOrNull();
    });
  }

  // ক্যাটাগরি ওয়াইজ দোয়া কাউন্ট
  Future<Map<int, int>> getDuaCountByCategory({
    required String language,
  }) async {
    return await catchAndReturnFuture<Map<int, int>>(() async {
          final result =
              await customSelect(
                '''
            SELECT 
              category_id,
              COUNT(*) as count
            FROM dua_table
            WHERE lang = ?
            GROUP BY category_id
            ''',
                variables: [Variable(language)],
              ).get();

          return Map.fromEntries(
            result.map(
              (row) => MapEntry(
                row.read<int>('category_id'),
                row.read<int>('count'),
              ),
            ),
          );
        }) ??
        {};
  }

  // সার্চ ফাংশনালিটি
  Future<List<DuaTableData>> searchDuas({
    required String keyword,
    required String language,
    int? categoryId,
  }) async {
    return await catchAndReturnFuture<List<DuaTableData>>(() async {
          final query = select(duaTable);

          final conditions = [
            duaTable.lang.equals(language),
            duaTable.name.like('%$keyword%') |
                duaTable.translation.like('%$keyword%') |
                duaTable.reference.like('%$keyword%'),
          ];

          if (categoryId != null) {
            conditions.add(duaTable.categoryId.equals(categoryId));
          }

          query.where(
            (tbl) => conditions.fold<Expression<bool>>(
              const Constant(true),
              (prev, expr) => prev & expr,
            ),
          );

          return await query.get();
        }) ??
        [];
  }

  // স্ট্যাটিসটিক্স
  Future<int> getTotalDuaCount({required String language}) async {
    try {
      final result =
          await (select(duaTable)..where((t) => t.lang.equals(language))).get();
      return result.length;
    } catch (e) {
      return 0;
    }
  }
}
