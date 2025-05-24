import 'dart:developer';

import 'package:portfolio/core/utility/trial_utility.dart';
import 'package:portfolio/data/models/dua_model.dart';
import 'package:portfolio/data/services/cache_data.dart';
import 'package:portfolio/data/services/database/app_database.dart';
import 'package:portfolio/data/services/running_compute.dart';

abstract class DuaLocalDataSource {
  Future<List<DuaModel>> getAllDuas({required String language});
  Future<DuaModel?> getDuaById({required int id, required String language});
  Future<List<DuaModel>> getDuasByCategory({
    required int categoryId,
    required String language,
  });
  Future<List<DuaModel>> searchDuas({
    required String keyword,
    required String language,
    int? categoryId,
  });
  Future<int> getTotalDuaCount({required String language});
}

class DuaLocalDataSourceImpl implements DuaLocalDataSource {
  final AppDatabase _appDatabase;

  DuaLocalDataSourceImpl(this._appDatabase);

  @override
  Future<List<DuaModel>> getAllDuas({required String language}) async {
    if (CacheData.allDuasCache.isNotEmpty) {
      return CacheData.allDuasCache.cast<DuaModel>();
    }

    return await catchAndReturnFuture<List<DuaModel>>(() async {
          final duaTableDataList = await _appDatabase.getAllDuasByLang(
            language: language,
          );
          final List<DuaModel> duas = await compute(
            (List<DuaTableData> data) =>
                _mapDuaTableDataListToDuaModelList(data),
            duaTableDataList,
          );

          CacheData.allDuasCache = duas;
          return duas;
        }) ??
        [];
  }

  @override
  Future<DuaModel?> getDuaById({
    required int id,
    required String language,
  }) async {
    return await catchAndReturnFuture<DuaModel?>(() async {
      final duaTableData = await _appDatabase.getDuaByIdAndLang(
        id: id,
        language: language,
      );
      return duaTableData != null
          ? _mapDuaTableDataToDuaModel(duaTableData)
          : null;
    });
  }

  @override
  Future<List<DuaModel>> getDuasByCategory({
    required int categoryId,
    required String language,
  }) async {
    // Check if the category ID is already cached
    if (CacheData.duasByCategoryCache.containsKey(categoryId)) {
      log('Cache hit for category: $categoryId');
      return CacheData.duasByCategoryCache[categoryId]!.cast<DuaModel>();
    }

    return await catchAndReturnFuture<List<DuaModel>>(() async {
          log('Cache miss for category: $categoryId');
          final duaTableDataList = await _appDatabase.getDuasByCategoryAndLang(
            categoryId: categoryId,
            language: language,
          );

          final List<DuaModel> duas = _mapDuaTableDataListToDuaModelList(
            duaTableDataList,
          );

          // Background thread এ mapping লজিক
          // final List<DuaModel> duas = await compute(
          //   (List<DuaTableData> data) =>
          //       _mapDuaTableDataListToDuaModelList(data),
          //   duaTableDataList,
          // );

          CacheData.duasByCategoryCache[categoryId] = duas;

          return duas;
        }) ??
        [];
  }

  @override
  Future<List<DuaModel>> searchDuas({
    required String keyword,
    required String language,
    int? categoryId,
  }) async {
    // Create a cache key based on the search parameters
    final String cacheKey = '${keyword}_${language}_${categoryId ?? 0}';

    // Check cache for the search results
    if (CacheData.searchResultsCache.containsKey(cacheKey)) {
      List<DuaModel> searchKey =
          CacheData.searchResultsCache[cacheKey]!.cast<DuaModel>();

      log('Cache hit for search: $cacheKey');
      return searchKey;
    }

    return await catchAndReturnFuture<List<DuaModel>>(() async {
          log('Cache miss for search: $cacheKey');
          final duaTableDataList = await _appDatabase.searchDuas(
            keyword: keyword,
            language: language,
            categoryId: categoryId,
          );
          // Background thread এ searching/filtering লজিক
          final results = await compute(
            (List<DuaTableData> data) =>
                _mapDuaTableDataListToDuaModelList(data),
            duaTableDataList,
          );

          // ক্যাশে সংরক্ষণ করুন
          CacheData.searchResultsCache[cacheKey] = results;

          return results;
        }) ??
        [];
  }

  @override
  Future<int> getTotalDuaCount({required String language}) async {
    return await _appDatabase.getTotalDuaCount(language: language);
  }
}

// Helper methods
DuaModel _mapDuaTableDataToDuaModel(DuaTableData data) {
  return DuaModel(
    id: data.id,
    lang: data.lang,
    categoryId: data.categoryId,
    surahId: data.surahId,
    ayahId: data.ayahId,
    name: data.name,
    uthmani: data.uthmani,
    indopak: data.indopak,
    translation: data.translation,
    reference: data.reference,
    audio: data.audio,
  );
}

List<DuaModel> _mapDuaTableDataListToDuaModelList(List<DuaTableData> dataList) {
  return dataList.map(_mapDuaTableDataToDuaModel).toList();
}
