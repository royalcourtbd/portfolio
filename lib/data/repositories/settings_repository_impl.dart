import 'dart:async';
import 'package:portfolio/data/datasources/local/user_data_local_data_source.dart';
import 'package:portfolio/domain/entities/settings_entity.dart';
import 'package:portfolio/domain/repositories/settings_repository.dart';
import 'package:synchronized/synchronized.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  SettingsRepositoryImpl(this._userDataLocalDataSource) {
    initSettings();
  }

  final UserDataLocalDataSource _userDataLocalDataSource;

  final StreamController<SettingsEntity> _streamController =
      StreamController<SettingsEntity>.broadcast();

  final Lock _initSettingsLock = Lock();

  @override
  /// Initializes the settings lock and executes the provided asynchronous function
  /// within the synchronized block.
  ///
  /// This method ensures that the provided function is executed atomically,
  /// preventing concurrent access to the settings.
  ///
  /// Usage:
  /// ```dart
  /// await _initSettingsLock.synchronized(() async {
  ///   // Code to be executed within the synchronized block
  /// });
  /// ```
  ///
  /// Note: The `_initSettingsLock` should be initialized before calling this method.
  ///
  /// Throws an exception if the provided function throws an exception.
  Future<void> initSettings() async {
    await _initSettingsLock.synchronized(() async {
      final SettingsEntity currentState =
          await _userDataLocalDataSource.getSettingState();
      _streamController.add(currentState);
    });
  }

  final Lock _updateSettingsLock = Lock();

  @override
  Future<void> updateSettingsState({
    required SettingsEntity settingsState,
  }) async {
    await _updateSettingsLock.synchronized(() async {
      _streamController.add(settingsState);
      await _userDataLocalDataSource.saveSettingState(
        settingState: settingsState,
      );
    });
  }

  @override
  Future<void> dispose() async {
    await _streamController.close();
  }

  @override
  Stream<SettingsEntity> get settingsStream => _streamController.stream;

  @override
  Future<SettingsEntity> getSettingsState() =>
      _userDataLocalDataSource.getSettingState();
}
