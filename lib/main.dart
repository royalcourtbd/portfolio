import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/domain/usecases/determine_first_run_use_case.dart';
import 'package:portfolio/presentation/initial_app.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeApp();
    runApp(InitialApp(isFirstRun: await _checkFirstRun()));
    // _registerDevice();
  }, (error, stackTrace) => (error, stackTrace, fatal: true));
}

Future<void> _initializeApp() async {
  //await loadEnv();
  await ServiceLocator.setUp();
}

Future<bool> _checkFirstRun() {
  return locate<DetermineFirstRunUseCase>().execute();
}
