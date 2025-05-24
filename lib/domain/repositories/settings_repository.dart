import 'package:portfolio/domain/entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<void> initSettings();
  Stream<SettingsEntity> get settingsStream;
  Future<void> updateSettingsState({required SettingsEntity settingsState});
  Future<SettingsEntity> getSettingsState();
  Future<void> dispose();
}
