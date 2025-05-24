import 'package:portfolio/core/base/base_ui_state.dart';
import 'package:portfolio/domain/entities/category_entity.dart';

class HomeUiState extends BaseUiState {
  const HomeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.categoryList,
  });

  factory HomeUiState.empty() {
    return HomeUiState(isLoading: false, userMessage: '', categoryList: []);
  }

  final List<CategoryEntity> categoryList;

  @override
  List<Object?> get props => [isLoading, userMessage, categoryList];

  HomeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<CategoryEntity>? categoryList,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      categoryList: categoryList ?? this.categoryList,
    );
  }
}
