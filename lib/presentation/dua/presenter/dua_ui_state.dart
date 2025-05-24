import 'package:portfolio/core/base/base_ui_state.dart';
import 'package:portfolio/domain/entities/dua_entity.dart';

class DuaUiState extends BaseUiState {
  const DuaUiState({
    required super.isLoading,
    required super.userMessage,
    required this.duaList,
    required this.selectedCategoryId,
    required this.showArabic,
    required this.showReference,
    required this.showTranslation,
    required this.arabicFontSize,
    required this.localFontSize,
  });

  factory DuaUiState.empty() {
    return const DuaUiState(
      isLoading: false,
      userMessage: '',
      duaList: [],
      selectedCategoryId: 0,
      showArabic: true,
      showReference: true,
      showTranslation: true,
      arabicFontSize: 30.0,
      localFontSize: 16.0,
    );
  }

  final int selectedCategoryId;
  final bool showArabic;
  final bool showTranslation;
  final bool showReference;
  final double arabicFontSize;
  final double localFontSize;
  final List<DuaEntity> duaList;

  @override
  List<Object?> get props => [
    isLoading,
    userMessage,
    duaList,
    selectedCategoryId,
    showArabic,
    showReference,
    showTranslation,
    arabicFontSize,
    localFontSize,
  ];

  DuaUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<DuaEntity>? duaList,
    int? selectedCategoryIndex,
    bool? showArabic,
    bool? showReference,
    bool? showTranslation,
    double? arabicFontSize,
    double? localFontSize,
  }) {
    return DuaUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      duaList: duaList ?? this.duaList,
      selectedCategoryId: selectedCategoryIndex ?? selectedCategoryId,
      showArabic: showArabic ?? this.showArabic,
      showReference: showReference ?? this.showReference,
      showTranslation: showTranslation ?? this.showTranslation,
      arabicFontSize: arabicFontSize ?? this.arabicFontSize,
      localFontSize: localFontSize ?? this.localFontSize,
    );
  }
}
