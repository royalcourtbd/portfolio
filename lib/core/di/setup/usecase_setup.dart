import 'dart:developer';

import 'package:portfolio/domain/usecases/dua/get_all_categories_usecase.dart';
import 'package:portfolio/domain/usecases/dua/get_all_duas_usecase.dart';
import 'package:portfolio/domain/usecases/dua/get_category_by_id_usecase.dart';
import 'package:portfolio/domain/usecases/dua/get_dua_by_id_usecase.dart';
import 'package:portfolio/domain/usecases/dua/get_duas_by_category_id_usecase.dart';
import 'package:portfolio/domain/usecases/dua/get_duas_count_by_category_usecase.dart';
import 'package:portfolio/domain/usecases/dua/search_duas_usecase.dart';
import 'package:portfolio/domain/usecases/get_setting_use_case.dart';
import 'package:portfolio/domain/usecases/listen_settings_changes.dart';
import 'package:portfolio/domain/usecases/update_setting_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/di/setup/setup_module.dart';
import 'package:portfolio/domain/usecases/check_notification_permission_usecase.dart';
import 'package:portfolio/domain/usecases/determine_first_run_use_case.dart';
import 'package:portfolio/domain/usecases/get_bank_payments_usecase.dart';
import 'package:portfolio/domain/usecases/get_device_info_usecase.dart';
import 'package:portfolio/domain/usecases/get_mobile_payments_usecase.dart';
import 'package:portfolio/domain/usecases/register_device_usecase.dart';
import 'package:portfolio/domain/usecases/request_notification_permission_usecase.dart';
import 'package:portfolio/domain/usecases/save_first_time_use_case.dart';

class UsecaseSetup implements SetupModule {
  final GetIt _serviceLocator;
  UsecaseSetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    log('init usecase setup');
    _serviceLocator
      ..registerLazySingleton(
        () => DetermineFirstRunUseCase(locate(), locate()),
      )
      ..registerLazySingleton(() => SaveFirstTimeUseCase(locate(), locate()))
      ..registerLazySingleton(() => GetDeviceInfoUsecase(locate(), locate()))
      ..registerLazySingleton(() => RegisterDeviceUsecase(locate(), locate()))
      ..registerLazySingleton(() => GetBankPaymentsUseCase(locate(), locate()))
      ..registerLazySingleton(
        () => GetMobilePaymentsUseCase(locate(), locate()),
      )
      ..registerLazySingleton(
        () => CheckNotificationPermissionUsecase(locate(), locate()),
      )
      ..registerLazySingleton(
        () => RequestNotificationPermissionUsecase(locate(), locate()),
      )
      ..registerLazySingleton(() => GetDuaByIdUseCase(locate(), locate()))
      ..registerLazySingleton(
        () => GetDuasByCategoryUseCase(locate(), locate()),
      )
      ..registerLazySingleton(
        () => GetDuaCountByCategoryUseCase(locate(), locate()),
      )
      ..registerLazySingleton(() => SearchDuasUseCase(locate(), locate()))
      ..registerLazySingleton(() => GetAllDuasUseCase(locate(), locate()))
      ..registerLazySingleton(() => GetAllCategoriesUseCase(locate(), locate()))
      ..registerLazySingleton(() => GetCategoryByIdUseCase(locate(), locate()))
      ..registerLazySingleton(() => GetSettingsStateUseCase(locate(), locate()))
      ..registerLazySingleton(() => UpdateSettingsUseCase(locate(), locate()))
      ..registerLazySingleton(() => ListenSettingsChangesUseCase(locate()));
  }
}
