import 'package:portfolio/domain/entities/category_entity.dart';
import 'package:portfolio/domain/entities/dua_entity.dart';

class CacheData {
  static List<DuaEntity> allDuasCache = [];
  static List<CategoryEntity> allCategoriesCache = [];
  static List<String> allCategoriesNamesCache = [];
  static final Map<int, List<DuaEntity>> duasByCategoryCache = {};
  static Map<String, Map<int, DuaEntity>> duaCache = {};
  static Map<String, Map<int, int>> duaCountByCategoryCache = {};
  static Map<String, List<DuaEntity>> searchResultsCache = {};

  static void clearAllCaches() {
    allDuasCache.clear();
    allCategoriesCache.clear();
    allCategoriesNamesCache.clear();
    duasByCategoryCache.clear();
    duaCache.clear();
    duaCountByCategoryCache.clear();
    searchResultsCache.clear();
  }
}
