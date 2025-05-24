import 'package:portfolio/core/utility/trial_utility.dart';
import 'package:portfolio/data/mappers/settings_entity_mapper.dart';
import 'package:portfolio/data/services/local_cache_service.dart';
import 'package:portfolio/domain/entities/settings_entity.dart';

class UserDataLocalDataSource {
  UserDataLocalDataSource(this._localCacheService);

  final LocalCacheService _localCacheService;

  Future<bool> determineFirstRun() async {
    final bool? firstTime = _localCacheService.getData(
      key: CacheKeys.firstTime,
    );
    return firstTime ?? true;
  }

  Future<void> doneFirstTime() async {
    await _localCacheService.saveData(key: CacheKeys.firstTime, value: false);
  }

  Future<void> saveSettingState({required SettingsEntity settingState}) async {
    await catchFutureOrVoid(() async {
      final String settingStateSerialized =
          await SettingsEntityMapper.entityToJson(settingState);

      await _localCacheService.saveData(
        key: CacheKeys.settingsStatus,
        value: settingStateSerialized,
      );
    });
  }

  Future<SettingsEntity> getSettingState() async {
    return await catchAndReturnFuture(() async {
          final String? serializedData = _localCacheService.getData(
            key: CacheKeys.settingsStatus,
          );

          if (serializedData == null || serializedData.isEmpty) {
            return SettingsEntity.empty();
          }

          return await SettingsEntityMapper.jsonToEntity(serializedData);
        }) ??
        SettingsEntity.empty();
  }
}
