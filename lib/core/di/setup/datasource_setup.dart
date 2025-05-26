import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/di/setup/setup_module.dart';
import 'package:portfolio/data/datasources/local/user_data_local_data_source.dart';

class DatasourceSetup implements SetupModule {
  final GetIt _serviceLocator;
  DatasourceSetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    _serviceLocator.registerLazySingleton(
      () => UserDataLocalDataSource(locate()),
    );
  }
}
