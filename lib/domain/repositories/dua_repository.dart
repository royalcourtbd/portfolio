import 'package:portfolio/domain/entities/dua_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class DuaRepository {
  /// Get All Duas
  Future<Either<String, List<DuaEntity>>> getAllDuas({
    required String language,
  });

  /// আইডি দিয়ে একটি দোয়া পাওয়া
  Future<Either<String, DuaEntity?>> getDuaById({
    required int id,
    required String language,
  });

  /// ক্যাটাগরি আইডি দিয়ে দোয়া পাওয়া
  Future<Either<String, List<DuaEntity>>> getDuasByCategory({
    required int categoryId,
    required String language,
  });

  /// কীওয়ার্ড দিয়ে দোয়া সার্চ
  Future<Either<String, List<DuaEntity>>> searchDuas({
    required String keyword,
    required String language,
    int? categoryId,
  });

  /// মোট দোয়া সংখ্যা
  Future<Either<String, int>> getTotalDuaCount({required String language});
}
