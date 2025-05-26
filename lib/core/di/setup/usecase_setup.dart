import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/di/setup/setup_module.dart';

import 'package:portfolio/domain/usecases/determine_first_run_use_case.dart';
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
      ..registerLazySingleton(() => SaveFirstTimeUseCase(locate(), locate()));
  }
}
