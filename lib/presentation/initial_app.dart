import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/l10n/l10n.dart';
import 'package:portfolio/presentation/main/ui/main_page.dart';
import 'package:portfolio/presentation/settings/presenter/settings_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:portfolio/core/config/app_screen.dart';
import 'package:portfolio/core/config/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InitialApp extends StatelessWidget {
  InitialApp({super.key, required this.isFirstRun});

  final bool isFirstRun;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get globalContext =>
      navigatorKey.currentContext ?? Get.context!;
  final SettingsPresenter settingsPresenter = locate<SettingsPresenter>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        String currentLanguage =
            settingsPresenter.currentUiState.settingsEntity?.currentLanguage ??
            'English';
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          builder: (context, child) {
            return Overlay(
              initialEntries: [OverlayEntry(builder: (context) => child!)],
            );
          },
          onInit: () => AppScreen.setUp(context),
          onReady: () => AppScreen.setUp(context),
          debugShowCheckedModeBanner: false,
          theme: AappTheme.lightTheme,
          supportedLocales: L10n.supportedLocales,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: settingsPresenter.getSelectedLanguageLocale(currentLanguage),
          title: 'Initial Project',
          // home: isFirstRun ? OnboardingPage() : MainPage(),
          // home: SettingsPage(),
          home: MainPage(),
        );
      },
    );
  }
}
