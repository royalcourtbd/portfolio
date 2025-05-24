import 'dart:async';
import 'package:portfolio/core/base/base_presenter.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/utility/utility.dart';
import 'package:portfolio/domain/entities/dua_entity.dart';
import 'package:portfolio/domain/entities/language_type_enum.dart';
import 'package:portfolio/domain/entities/settings_entity.dart';
import 'package:portfolio/domain/repositories/settings_repository.dart';
import 'package:portfolio/domain/usecases/listen_settings_changes.dart';
import 'package:portfolio/domain/usecases/usecase.dart';
import 'package:portfolio/presentation/dua/presenter/dua_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class DuaPresenter extends BasePresenter<DuaUiState> {
  final ListenSettingsChangesUseCase _listenSettingsChangesUseCase;
  final GetDuasByCategoryUseCase _getDuasByCategoryUseCase;
  final GetAllDuasUseCase _getAllDuasUseCase;

  DuaPresenter(
    this._listenSettingsChangesUseCase,
    this._getDuasByCategoryUseCase,
    this._getAllDuasUseCase,
  );

  final Obs<DuaUiState> uiState = Obs<DuaUiState>(DuaUiState.empty());
  DuaUiState get currentUiState => uiState.value;

  StreamSubscription<Either<String, SettingsEntity>>? _settingsChangeSub;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchSettingState();
  }

  Future<void> fetchSettingState() async {
    final SettingsEntity settingsState =
        await locate<SettingsRepository>().getSettingsState();
    _updateSettingsState(settingsState);
    await handleStreamEvents(
      stream: _listenSettingsChangesUseCase.execute(),
      onData: _updateSettingsState,
      subscription: _settingsChangeSub,
    );
  }

  void _updateSettingsState(SettingsEntity settingState) {
    uiState.value = uiState.value.copyWith(
      arabicFontSize: settingState.arabicFontSize,
      localFontSize: settingState.translationFontSize,
      showArabic: settingState.showArabicText,
      showReference: settingState.showReference,
      showTranslation: settingState.showTranslation,
    );
  }

  Future<void> getDuaByCategory({
    required int categoryId,

    required BuildContext context,
  }) async {
    await executeTaskWithLoading(() async {
      await parseDataFromEitherWithUserMessage(
        task:
            () => _getDuasByCategoryUseCase.execute(
              categoryId: categoryId,
              language: LanguageType.english.code,
            ),
        onDataLoaded: (List<DuaEntity> data) {
          if (data.isEmpty) {
            //
          } else {
            uiState.value = currentUiState.copyWith(duaList: data);
          }
        },
      );
    });
  }

  Future<void> getAllDua() async {
    await executeTaskWithLoading(() async {
      await parseDataFromEitherWithUserMessage(
        task:
            () =>
                _getAllDuasUseCase.execute(language: LanguageType.english.code),
        onDataLoaded: (List<DuaEntity> data) {
          if (data.isEmpty) {
          } else {
            uiState.value = currentUiState.copyWith(duaList: data);
          }
        },
      );
    });
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
