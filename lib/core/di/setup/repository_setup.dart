import 'package:portfolio/data/repositories/category_repository_impl.dart';
import 'package:portfolio/data/repositories/dua_repository_impl.dart';
import 'package:portfolio/data/repositories/settings_repository_impl.dart';
import 'package:portfolio/domain/repositories/category_repository.dart';
import 'package:portfolio/domain/repositories/dua_repository.dart';
import 'package:portfolio/domain/repositories/settings_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/di/setup/setup_module.dart';
import 'package:portfolio/data/repositories/device_info_repository_impl.dart';
import 'package:portfolio/data/repositories/payment_repository_impl.dart';
import 'package:portfolio/data/repositories/user_data_repository_impl.dart';
import 'package:portfolio/domain/repositories/device_info_repository.dart';
import 'package:portfolio/domain/repositories/payment_repository.dart';
import 'package:portfolio/domain/repositories/user_data_repository.dart';

class RepositorySetup implements SetupModule {
  final GetIt _serviceLocator;
  RepositorySetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    _serviceLocator
      ..registerLazySingleton<UserDataRepository>(
        () => UserDataRepositoryImpl(locate(), locate()),
      )
      ..registerLazySingleton<PaymentRepository>(
        () => PaymentRepositoryImpl(locate(), locate()),
      )
      ..registerLazySingleton<DeviceInfoRepository>(
        () => DeviceInfoRepositoryImpl(locate(), locate(), locate()),
      )
      ..registerLazySingleton<DuaRepository>(
        () => DuaRepositoryImpl(locate(), locate()),
      )
      ..registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(locate(), locate()),
      )
      ..registerLazySingleton<SettingsRepository>(
        () => SettingsRepositoryImpl(locate()),
      );
  }
}
