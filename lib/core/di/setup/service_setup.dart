import 'package:portfolio/data/services/cache_data.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/di/setup/setup_module.dart';
import 'package:portfolio/data/services/error_message_handler_impl.dart';
import 'package:portfolio/data/services/local_cache_service.dart';
import 'package:portfolio/domain/service/error_message_handler.dart';
import 'package:portfolio/domain/service/time_service.dart';

class ServiceSetup implements SetupModule {
  final GetIt _serviceLocator;
  ServiceSetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    // await _setUpFirebaseServices();
    _serviceLocator
      ..registerLazySingleton<ErrorMessageHandler>(ErrorMessageHandlerImpl.new)
      ..registerLazySingleton<TimeService>(TimeService.new)
      ..registerLazySingleton<LocalCacheService>(LocalCacheService.new)
      ..registerLazySingleton<CacheData>(CacheData.new);

    // await GetServerKey().getServerKeyToken();
    await LocalCacheService.setUp();
    await _setUpAudioService();
  }

  // Future<void> _setUpFirebaseServices() async {
  //   await catchFutureOrVoid(() async {
  //     final FirebaseApp? firebaseApp = await catchAndReturnFuture(() async {
  //       return Firebase.initializeApp(
  //         // options: DefaultFirebaseOptions.currentPlatform,
  //       );
  //     });

  //     if (firebaseApp == null) return;
  //     if (kDebugMode) return;

  //     FlutterError.onError =
  //         FirebaseCrashlytics.instance.recordFlutterFatalError;
  //     PlatformDispatcher.instance.onError = (error, stack) {
  //       FirebaseCrashlytics.instance.recordError(
  //         error,
  //         stack,
  //         fatal: true,
  //         printDetails: false,
  //       );
  //       return true;
  //     };
  //   });
  // }

  Future<void> _setUpAudioService() async {
    // Implement audio service setup
  }
}
