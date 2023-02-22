// ignore_for_file: unused_element

import 'package:dafna_web/screens/contact_screen.dart';
import 'package:flutter/material.dart';

import 'screens/catalog_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        // useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        CatalogScreen.routeName: (context) => const CatalogScreen(),
        Contactcreen.routeName:(context) => const Contactcreen()
      },
      initialRoute: '/home',
    );
  }
}
