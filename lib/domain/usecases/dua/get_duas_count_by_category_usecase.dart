// lib/domain/usecases/get_duas_by_category_name_usecase.dart

import 'package:portfolio/domain/repositories/category_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/dua_entity.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class GetDuaCountByCategoryUseCase extends BaseUseCase<List<DuaEntity>> {
  final CategoryRepository _repository;

  GetDuaCountByCategoryUseCase(
    this._repository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Future<Either<String, Map<int, int>>> execute({
    required String language,
  }) async {
    return await _repository.getDuaCountByCategory(language: language);
  }
}
