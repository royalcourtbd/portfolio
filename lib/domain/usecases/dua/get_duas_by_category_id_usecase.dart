// lib/domain/usecases/get_duas_by_category_id_usecase.dart

import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/dua_entity.dart';
import 'package:portfolio/domain/repositories/dua_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class GetDuasByCategoryUseCase extends BaseUseCase<List<DuaEntity>> {
  final DuaRepository _duaRepository;

  GetDuasByCategoryUseCase(
    this._duaRepository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Future<Either<String, List<DuaEntity>>> execute({
    required int categoryId,
    required String language,
  }) async {
    return await _duaRepository.getDuasByCategory(
      categoryId: categoryId,
      language: language,
    );
  }
}
