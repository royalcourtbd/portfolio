import 'dart:developer';

import 'package:portfolio/data/datasources/local/category_local_data_source.dart';
import 'package:portfolio/data/models/category_model.dart';
import 'package:portfolio/data/services/cache_data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:collection/collection.dart';
import 'package:portfolio/core/utility/trial_utility.dart';
import 'package:portfolio/domain/entities/category_entity.dart';
import 'package:portfolio/domain/repositories/category_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource _localDataSource;
  final ErrorMessageHandler _errorMessageHandler;

  CategoryRepositoryImpl(this._localDataSource, this._errorMessageHandler);

  @override
  Future<Either<String, List<CategoryEntity>>> getAllCategories({
    required String language,
  }) async {
    if (CacheData.allCategoriesCache.isNotEmpty) {
      log('CacheData.allCategoriesCache: ${CacheData.allCategoriesCache}');
      return right(CacheData.allCategoriesCache);
    }

    final List<CategoryModel>? categories = await catchAndReturnFuture(
      () async {
        log('Fetching categories from local data source');
        return await _localDataSource.getAllCategories(language: language);
      },
    );

    return categories != null
        ? right(categories)
        : left(
          _errorMessageHandler.generateErrorMessage(
            'Failed to load categories',
          ),
        );
  }

  @override
  Future<Either<String, CategoryEntity?>> getCategoryById({
    required int id,
    required String language,
  }) async {
    // ক্যাশ চেক করার পার্ট অপটিমাইজ
    if (CacheData.allCategoriesCache.isNotEmpty) {
      final category = CacheData.allCategoriesCache.firstWhereOrNull(
        (category) => category.id == id,
      );
      if (category != null) {
        return right(category);
      }
    }

    final category = await catchAndReturnFuture(() {
      return _localDataSource.getCategoryById(id: id, language: language);
    });

    return category != null
        ? right(category)
        : left(_errorMessageHandler.generateErrorMessage('Category not found'));
  }

  @override
  Future<Either<String, Map<int, int>>> getDuaCountByCategory({
    required String language,
  }) async {
    final countMap = await catchAndReturnFuture(() async {
      return await _localDataSource.getDuaCountByCategory(language: language);
    });

    return countMap != null
        ? right(countMap)
        : left(
          _errorMessageHandler.generateErrorMessage(
            'ক্যাটাগরি অনুযায়ী দোয়ার সংখ্যা গণনা করতে ব্যর্থ',
          ),
        );
  }
}
