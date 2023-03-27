import 'package:dafna_web/mobile/models/navigations.dart';
import 'package:dafna_web/mobile/screens/home_screen.dart';
import 'package:dafna_web/theme/theme_controller.dart';
import 'package:dafna_web/theme/theme_manager.dart';
import 'package:dafna_web/web/models/navigations.dart';
import 'package:dafna_web/web/widget/appbar_view.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    MyApp(),
  );
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  bool isDarkM;
  bool isDarkW;
  MyApp({super.key, this.isDarkM = false, this.isDarkW = false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        if (constraints.maxWidth < 1000 ||
            defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => HomeScreenM(),
              ),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: FlexThemeData.light(scheme: FlexScheme.blumineBlue),
              darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
              themeMode: _themeManager.themeMode,
              title: 'Mondelux',
              routerConfig: GoRouter(
                initialLocation: '/home',
                routes: MobileNavigations.route,
              ),
            ),
          );
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => AppBarView(),
              )
            ],
            child: MaterialApp.router(
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
              themeMode: _themeManager.themeMode,
              routerConfig: GoRouter(
                initialLocation: '/',
                routes: WebNavigations.route,
              ),
            ),
          );
        }
      },
    );
  }
}
// some