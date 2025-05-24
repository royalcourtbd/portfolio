import 'package:portfolio/core/base/base_ui_state.dart';
import 'package:portfolio/domain/entities/settings_entity.dart';

class SettingsUiState extends BaseUiState {
  const SettingsUiState({
    required super.isLoading,
    required super.userMessage,
    required this.settingsEntity,
  });

  factory SettingsUiState.empty() {
    return SettingsUiState(
      isLoading: false,
      userMessage: '',
      settingsEntity: null,
    );
  }

  final SettingsEntity? settingsEntity;

  @override
  List<Object?> get props => [isLoading, userMessage, settingsEntity];

  SettingsUiState copyWith({
    bool? isLoading,
    String? userMessage,
    SettingsEntity? settingsEntity,
  }) {
    return SettingsUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      settingsEntity: settingsEntity ?? this.settingsEntity,
    );
  }
}
