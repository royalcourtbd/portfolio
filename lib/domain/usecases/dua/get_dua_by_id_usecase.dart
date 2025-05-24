// lib/domain/usecases/get_dua_by_id_usecase.dart

import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/dua_entity.dart';
import 'package:portfolio/domain/repositories/dua_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class GetDuaByIdUseCase extends BaseUseCase<DuaEntity> {
  final DuaRepository _duaRepository;

  GetDuaByIdUseCase(
    this._duaRepository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Future<Either<String, DuaEntity?>> execute({
    required int id,
    required String language,
  }) async {
    return await _duaRepository.getDuaById(id: id, language: language);
  }
}
