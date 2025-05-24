import 'package:portfolio/domain/entities/category_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class CategoryRepository {
  /// Get all categories
  /// [language] - The language code for the categories
  Future<Either<String, List<CategoryEntity>>> getAllCategories({
    required String language,
  });

  /// Get all categories by ID
  /// [id] - The ID of the category
  /// [language] - The language code for the categories
  Future<Either<String, CategoryEntity?>> getCategoryById({
    required int id,
    required String language,
  });

  /// Get dua count by category
  /// [language] - The language code for the categories
  Future<Either<String, Map<int, int>>> getDuaCountByCategory({
    required String language,
  });
}
