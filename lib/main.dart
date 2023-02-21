// ignore_for_file: unused_element

import 'package:dafna/screens/catalog_screen.dart';
import 'package:dafna/screens/home_screen.dart';
import 'package:flutter/material.dart';

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
      },
      initialRoute: '/home',
    );
  }
}
