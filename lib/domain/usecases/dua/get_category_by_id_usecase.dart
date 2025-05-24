import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/category_entity.dart';
import 'package:portfolio/domain/repositories/category_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';
import 'package:fpdart/fpdart.dart';

class GetCategoryByIdUseCase extends BaseUseCase<CategoryEntity> {
  final CategoryRepository _categoryRepository;

  GetCategoryByIdUseCase(
    this._categoryRepository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Future<Either<String, CategoryEntity?>> execute({
    required int id,
    required String language,
  }) async {
    return await _categoryRepository.getCategoryById(
      id: id,
      language: language,
    );
  }
}
