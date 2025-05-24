import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/settings_entity.dart';
import 'package:portfolio/domain/repositories/settings_repository.dart';

class UpdateSettingsUseCase extends BaseUseCase<void> {
  UpdateSettingsUseCase(this._settingsRepository, super._errorMessageHandler);

  final SettingsRepository _settingsRepository;

  Future<void> execute({required SettingsEntity settingsState}) async {
    return doVoid(
      () =>
          _settingsRepository.updateSettingsState(settingsState: settingsState),
    );
  }
}
