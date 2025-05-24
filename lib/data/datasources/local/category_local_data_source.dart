import 'package:portfolio/core/utility/trial_utility.dart';
import 'package:portfolio/data/models/category_model.dart';
import 'package:portfolio/data/services/cache_data.dart';
import 'package:portfolio/data/services/database/app_database.dart';
import 'package:portfolio/data/services/running_compute.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getAllCategories({required String language});
  Future<CategoryModel?> getCategoryById({
    required int id,
    required String language,
  });
  Future<Map<int, int>> getDuaCountByCategory({required String language});
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final AppDatabase _appDatabase;

  CategoryLocalDataSourceImpl(this._appDatabase);

  @override
  Future<List<CategoryModel>> getAllCategories({
    required String language,
  }) async {
    if (CacheData.allCategoriesCache.isNotEmpty) {
      return CacheData.allCategoriesCache.cast<CategoryModel>();
    }

    return await catchAndReturnFuture<List<CategoryModel>>(() async {
          final List<CategoriesTableData> categoryDataList = await _appDatabase
              .getAllCategoriesByLang(language: language);

          List<CategoryModel> categories;

          if (categoryDataList.length > 50) {
            categories = await compute(
              _mapCategoryTableDataListToCategoryModelList,
              categoryDataList,
            );
          } else {
            categories = _mapCategoryTableDataListToCategoryModelList(
              categoryDataList,
            );
          }

          CacheData.allCategoriesCache = categories;
          CacheData.allCategoriesNamesCache =
              categories.map((category) => category.category).toList();
          return categories;
        }) ??
        [];
  }

  @override
  Future<CategoryModel?> getCategoryById({
    required int id,
    required String language,
  }) async {
    if (CacheData.allCategoriesCache.isNotEmpty) {
      try {
        return CacheData.allCategoriesCache.firstWhere(
              (category) => category.id == id,
            )
            as CategoryModel;
      } catch (_) {
        // ক্যাশে না পাওয়া গেলে ডাটাবেস থেকে লোড করা হবে
      }
    }

    return await catchAndReturnFuture<CategoryModel?>(() async {
      final categoryData = await _appDatabase.getCategoryByIdAndLang(
        id: id,
        language: language,
      );
      return categoryData != null
          ? _mapCategoryTableDataToCategoryModel(categoryData)
          : null;
    });
  }

  @override
  Future<Map<int, int>> getDuaCountByCategory({
    required String language,
  }) async {
    return await _appDatabase.getDuaCountByCategory(language: language);
  }
}

// Helper methods
CategoryModel _mapCategoryTableDataToCategoryModel(CategoriesTableData data) {
  return CategoryModel(
    id: data.id,
    lang: data.lang,
    category: data.category,
    duaCount: data.duaCount,
  );
}

List<CategoryModel> _mapCategoryTableDataListToCategoryModelList(
  List<CategoriesTableData> dataList,
) {
  return dataList.map(_mapCategoryTableDataToCategoryModel).toList();
}
