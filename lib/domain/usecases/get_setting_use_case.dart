import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/settings_entity.dart';
import 'package:portfolio/domain/repositories/settings_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class GetSettingsStateUseCase extends BaseUseCase<SettingsEntity> {
  GetSettingsStateUseCase(
    this._settingsRepository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  final SettingsRepository _settingsRepository;

  Future<SettingsEntity> execute() async {
    return getRight(() async => _settingsRepository.getSettingsState());
  }
}
