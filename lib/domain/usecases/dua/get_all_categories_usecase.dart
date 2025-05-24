import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/category_entity.dart';
import 'package:portfolio/domain/repositories/category_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class GetAllCategoriesUseCase extends BaseUseCase<List<CategoryEntity>> {
  final CategoryRepository _categoryRepository;

  GetAllCategoriesUseCase(
    this._categoryRepository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Future<Either<String, List<CategoryEntity>>> execute({
    required String language,
  }) async {
    return await _categoryRepository.getAllCategories(language: language);
  }
}
