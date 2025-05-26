import 'package:get_it/get_it.dart';
import 'package:portfolio/core/base/base_presenter.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/di/setup/setup_module.dart';
import 'package:portfolio/presentation/home/presenter/home_presenter.dart';
import 'package:portfolio/presentation/main/presenter/main_presenter.dart';

class PresenterSetup implements SetupModule {
  final GetIt _serviceLocator;
  PresenterSetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    _serviceLocator
      ..registerFactory(() => loadPresenter(MainPresenter(locate())))
      ..registerLazySingleton(() => loadPresenter(HomePresenter()));
  }
}
