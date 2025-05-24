// lib/domain/usecases/search_duas_usecase.dart

import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/dua_entity.dart';
import 'package:portfolio/domain/repositories/dua_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class SearchDuasUseCase extends BaseUseCase<List<DuaEntity>> {
  final DuaRepository _duaRepository;

  SearchDuasUseCase(
    this._duaRepository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Future<Either<String, List<DuaEntity>>> execute({
    required String keyword,
    required String language,
    int? categoryId,
  }) async {
    return await _duaRepository.searchDuas(
      keyword: keyword,
      language: language,
      categoryId: categoryId,
    );
  }
}
