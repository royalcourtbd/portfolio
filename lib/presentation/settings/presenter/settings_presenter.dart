import 'package:portfolio/core/base/base_presenter.dart';
import 'package:portfolio/core/static/constants.dart';
import 'package:portfolio/core/utility/utility.dart';
import 'package:portfolio/domain/entities/language_type_enum.dart';
import 'package:portfolio/domain/entities/settings_entity.dart';
import 'package:portfolio/domain/usecases/get_setting_use_case.dart';
import 'package:portfolio/domain/usecases/update_setting_use_case.dart';
import 'package:portfolio/presentation/settings/presenter/settings_uistate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synchronized/synchronized.dart';

class SettingsPresenter extends BasePresenter<SettingsUiState> {
  SettingsPresenter(this._getSettingsStateUseCase, this._updateSettingsUseCase);
  final GetSettingsStateUseCase _getSettingsStateUseCase;
  final UpdateSettingsUseCase _updateSettingsUseCase;

  final Obs<SettingsUiState> uiState = Obs<SettingsUiState>(
    SettingsUiState.empty(),
  );
  SettingsUiState get currentUiState => uiState.value;
  SettingsEntity get _settings =>
      uiState.value.settingsEntity ?? SettingsEntity.empty();

  final Lock _settingsLock = Lock();
  final Lock _arabicFontSizeLock = Lock();
  final Lock _translationFontSizeLock = Lock();

  @override
  Future<void> onReady() async {
    super.onReady();
    await _fetchCurrentSettingsState();
  }

  Future<void> _updateSettingsState(SettingsEntity updatedSettings) async {
    uiState.value = uiState.value.copyWith(settingsEntity: updatedSettings);
    await _updateSettingsUseCase.execute(settingsState: updatedSettings);
  }

  Future<void> _fetchCurrentSettingsState() async {
    final SettingsEntity settingsState =
        await _getSettingsStateUseCase.execute();
    uiState.value = uiState.value.copyWith(settingsEntity: settingsState);
  }

  Future<void> updateLanguage({required String language}) async {
    await _settingsLock.synchronized(() async {
      final Locale? newLocale = appLocaleList[language];
      if (newLocale != null) {
        Get.updateLocale(newLocale);
        final SettingsEntity updatedSettings = _settings.copyWith(
          language: language,
        );
        await _updateSettingsState(updatedSettings);
      }
    });
  }

  Locale? getSelectedLanguageLocale(String currentLanguage) {
    return appLocaleList[currentLanguage];
  }

  Future<void> updateArabicFontSize(double fontSize) async {
    return _arabicFontSizeLock.synchronized(() async {
      final SettingsEntity updatedSettings = _settings.copyWith(
        arabicFontSize: fontSize,
      );
      await _updateSettingsState(updatedSettings);
    });
  }

  Future<void> updateTranslationFontSize(double fontSize) async {
    return _translationFontSizeLock.synchronized(() async {
      final SettingsEntity updatedSettings = _settings.copyWith(
        translationFontSize: fontSize,
      );
      await _updateSettingsState(updatedSettings);
    });
  }

  LanguageType getCurrentLanguageType() {
    return LanguageType.fromDisplayName(
      currentUiState.settingsEntity?.currentLanguage ?? englishLocaleName,
    );
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
