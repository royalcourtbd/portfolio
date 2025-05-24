import 'package:portfolio/data/datasources/local/category_local_data_source.dart';
import 'package:portfolio/data/datasources/local/dua_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/di/setup/setup_module.dart';
import 'package:portfolio/data/datasources/local/user_data_local_data_source.dart';
import 'package:portfolio/data/datasources/remote/device_info_remote_data_source.dart';
import 'package:portfolio/data/datasources/remote/info_remote_data_source.dart';
import 'package:portfolio/data/datasources/remote/payment_remote_data_source.dart';

class DatasourceSetup implements SetupModule {
  final GetIt _serviceLocator;
  DatasourceSetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    _serviceLocator
      ..registerLazySingleton(() => UserDataLocalDataSource(locate()))
      ..registerLazySingleton<DeviceInfoRemoteDataSource>(
        () => DeviceInfoRemoteDataSourceImpl(locate()),
      )
      ..registerLazySingleton<InfoRemoteDataSource>(
        () => InfoRemoteDataSourceImpl(locate()),
      )
      ..registerLazySingleton<PaymentRemoteDataSource>(
        () => PaymentRemoteDataSourceImpl(locate()),
      )
      ..registerLazySingleton<DuaLocalDataSource>(
        () => DuaLocalDataSourceImpl(locate()),
      )
      ..registerLazySingleton<CategoryLocalDataSource>(
        () => CategoryLocalDataSourceImpl(locate()),
      );
  }
}
