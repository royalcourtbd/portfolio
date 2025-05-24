import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/base/base_use_case.dart';
import 'package:portfolio/domain/entities/device_info_entity.dart';
import 'package:portfolio/domain/repositories/device_info_repository.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';

class GetDeviceInfoUsecase extends BaseUseCase<List<DeviceInfoEntity>> {
  final DeviceInfoRepository _deviceInfoRepository;

  GetDeviceInfoUsecase(
    this._deviceInfoRepository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Stream<Either<String, List<DeviceInfoEntity>>> execute() {
    return _deviceInfoRepository.getAllRegisteredDevices();
  }
}
