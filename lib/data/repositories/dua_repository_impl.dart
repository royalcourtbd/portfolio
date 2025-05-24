// lib/data/repositories/dua_repository_impl.dart
import 'dart:developer';

import 'package:portfolio/data/models/dua_model.dart';
import 'package:portfolio/data/services/cache_data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/utility/trial_utility.dart';
import 'package:portfolio/data/datasources/local/dua_local_data_source.dart';
import 'package:portfolio/domain/entities/dua_entity.dart';
import 'package:portfolio/domain/repositories/dua_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class DuaRepositoryImpl implements DuaRepository {
  final DuaLocalDataSource _localDataSource;
  final ErrorMessageHandler _errorMessageHandler;

  DuaRepositoryImpl(this._localDataSource, this._errorMessageHandler);

  @override
  Future<Either<String, List<DuaEntity>>> getAllDuas({
    required String language,
  }) async {
    if (CacheData.allDuasCache.isNotEmpty) {
      log('CacheData.allDuasCache: ${CacheData.allDuasCache.length}');
      return right(CacheData.allDuasCache);
    }

    final List<DuaModel>? duas = await catchAndReturnFuture(() async {
      log('Fetching all duas from local data source');
      return await _localDataSource.getAllDuas(language: language);
    });

    return duas != null
        ? right(duas)
        : left(
          _errorMessageHandler.generateErrorMessage('দোয়া লোড করতে ব্যর্থ'),
        );
  }

  @override
  Future<Either<String, DuaEntity?>> getDuaById({
    required int id,
    required String language,
  }) async {
    final dua = await catchAndReturnFuture(() async {
      return await _localDataSource.getDuaById(id: id, language: language);
    });

    if (dua == null) {
      return left(
        _errorMessageHandler.generateErrorMessage('দোয়া পাওয়া যায়নি'),
      );
    }
    return right(dua);
  }

  @override
  Future<Either<String, List<DuaEntity>>> getDuasByCategory({
    required int categoryId,
    required String language,
  }) async {
    final List<DuaModel>? duas = await catchAndReturnFuture(() async {
      return await _localDataSource.getDuasByCategory(
        categoryId: categoryId,
        language: language,
      );
    });

    return duas != null
        ? right(duas)
        : left(
          _errorMessageHandler.generateErrorMessage(
            'Failed to load duas by category',
          ),
        );
  }

  @override
  Future<Either<String, List<DuaEntity>>> searchDuas({
    required String keyword,
    required String language,
    int? categoryId,
  }) async {
    final List<DuaModel>? duas = await catchAndReturnFuture(() async {
      return await _localDataSource.searchDuas(
        keyword: keyword,
        language: language,
        categoryId: categoryId,
      );
    });

    return duas != null
        ? right(duas)
        : left(_errorMessageHandler.generateErrorMessage('সার্চ করতে ব্যর্থ'));
  }

  @override
  Future<Either<String, int>> getTotalDuaCount({
    required String language,
  }) async {
    final count = await catchAndReturnFuture(() async {
      return await _localDataSource.getTotalDuaCount(language: language);
    });

    return count != null
        ? right(count)
        : left(
          _errorMessageHandler.generateErrorMessage(
            'দোয়ার সংখ্যা গণনা করতে ব্যর্থ',
          ),
        );
  }
}
