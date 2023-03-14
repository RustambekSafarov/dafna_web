import 'package:dafna_web/mobile/models/navigations.dart';
import 'package:dafna_web/web/models/navigations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: FlexThemeData.light(scheme: FlexScheme.blumineBlue),
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
            themeMode: ThemeMode.system,
            title: 'Mondelux',
            routerConfig: GoRouter(
              initialLocation: '/home',
              routes: MobileNavigations.route,
            ),
          )
        : MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('uz'),
              Locale('ru'),
            ],
            title: 'Mondelux',
            theme: FlexThemeData.light(scheme: FlexScheme.blumineBlue),
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
            themeMode: ThemeMode.system,
            routerConfig: GoRouter(
              initialLocation: '/',
              routes: WebNavigations.route,
            ),
          );
  }
}
