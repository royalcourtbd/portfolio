import 'dart:async';
import 'package:portfolio/core/base/base_presenter.dart';
import 'package:portfolio/core/utility/logger_utility.dart';
import 'package:portfolio/core/utility/utility.dart';
import 'package:portfolio/data/services/cache_data.dart';
import 'package:portfolio/domain/entities/category_entity.dart';
import 'package:portfolio/domain/entities/language_type_enum.dart';
import 'package:portfolio/presentation/home/presenter/home_ui_state.dart';
import 'package:portfolio/domain/usecases/usecase.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetDuasByCategoryUseCase _getDuasByCategoryUseCase;
  HomePresenter(this._getAllCategoriesUseCase, this._getDuasByCategoryUseCase);

  final Obs<HomeUiState> uiState = Obs<HomeUiState>(HomeUiState.empty());
  HomeUiState get currentUiState => uiState.value;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    final String language = LanguageType.english.code;
    await executeTaskWithLoading(() async {
      await parseDataFromEitherWithUserMessage(
        task: () => _getAllCategoriesUseCase.execute(language: language),
        onDataLoaded: (List<CategoryEntity> data) {
          uiState.value = currentUiState.copyWith(categoryList: data);
          preloadPopularCategories(language);
        },
      );
    });
  }

  Future<void> preloadPopularCategories(String language) async {
    final List<int> popularCategoryIds = [1, 3, 5];
    for (final categoryId in popularCategoryIds) {
      if (!CacheData.duasByCategoryCache.containsKey(categoryId)) {
        _getDuasByCategoryUseCase
            .execute(categoryId: categoryId, language: language)
            .then((result) {
              result.fold((error) => logError(error), (duas) {
                CacheData.duasByCategoryCache[categoryId] = duas;
              });
            });
      }
    }
  }

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = currentUiState.copyWith(userMessage: message);
    showMessage(message: currentUiState.userMessage);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
