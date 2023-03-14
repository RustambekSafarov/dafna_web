import 'package:dafna_web/mobile/models/navigations.dart';
import 'package:dafna_web/web/models/navigations.dart';
import 'package:dafna_web/web/screens/search_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:dafna_web/web/screens/employment.dart';
import 'package:dafna_web/web/screens/catalog_detail_screen.dart';
import 'package:dafna_web/web/screens/contact_screen.dart';
import 'package:dafna_web/web/screens/favorites_screen.dart';
import 'package:dafna_web/web/screens/product_detail_screen.dart';
import 'package:dafna_web/web/screens/product_screen.dart';
import 'package:dafna_web/web/screens/video_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'web/screens/catalog_screen.dart';
import 'web/screens/home_screen.dart';
import 'web/screens/shopping_card_screen.dart';
import 'web/widget/footers/afzalliklar.dart';
import 'web/widget/footers/buyurtma.dart';
import 'web/widget/footers/savollar.dart';
import 'web/widget/footers/sotib_olish.dart';
import 'web/widget/footers/tolov.dart';

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
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
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
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
            themeMode: ThemeMode.system,
            routerConfig: GoRouter(
              initialLocation: '/',
              routes: WebNavigations.route,
            ),
          );
  }
}
