import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/di/setup/setup_module.dart';
import 'package:portfolio/data/repositories/user_data_repository_impl.dart';
import 'package:portfolio/domain/repositories/user_data_repository.dart';

class RepositorySetup implements SetupModule {
  final GetIt _serviceLocator;
  RepositorySetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    _serviceLocator.registerLazySingleton<UserDataRepository>(
      () => UserDataRepositoryImpl(locate()),
    );
  }
}
