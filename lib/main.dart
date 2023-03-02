// ignore_for_file: unused_element

import 'package:dafna_web/screens/employment.dart';
import 'package:dafna_web/screens/catalog_detail_screen.dart';
import 'package:dafna_web/screens/contact_screen.dart';
import 'package:dafna_web/screens/product_detail_screen.dart';
import 'package:dafna_web/screens/product_screen.dart';
import 'package:dafna_web/screens/video_view_screen.dart';
import 'package:dafna_web/widget/recommended.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'screens/catalog_screen.dart';
import 'screens/home_screen.dart';
import 'widget/footer\'s/afzalliklar.dart';
import 'widget/footer\'s/buyurtma.dart';
import 'widget/footer\'s/savollar.dart';
import 'widget/footer\'s/sotib_olish.dart';
import 'widget/footer\'s/tolov.dart';
import 'widget/new_products.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            name: HomeScreen.routeName,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/catalog',
            name: CatalogScreen.routeName,
            builder: (context, state) => CatalogScreen(),
          ),
          GoRoute(
            path: '/contact',
            name: Contactcreen.routeName,
            builder: (context, state) => const Contactcreen(),
          ),
          GoRoute(
            path: '/catalog-detail',
            name: CatalogDetailScreen.routeName,
            builder: (context, state) => CatalogDetailScreen(
              catalogId: state.extra as int,
            ),
          ),
          GoRoute(
              path: '/product-detail',
              name: ProductDetailScreen.routeName,
              builder: (context, state) {
                return ProductDetailScreen(
                  productTypeId: (state.extra as List)[0],
                  productId: (state.extra as List)[1],
                  productTypeName: (state.extra as List)[2].toString(),
                );
              }),
          GoRoute(
            path: '/product-info',
            name: ProductInfoScreen.routeName,
            builder: (context, state) => ProductInfoScreen(
              id: state.extra as int,
            ),
          ),
          GoRoute(
            path: '/afzalliklar',
            name: Afzalliklar.routeName,
            builder: (context, state) => const Afzalliklar(),
          ),
          GoRoute(
            path: '/buyurtma',
            name: Buyurtma.routeName,
            builder: (context, state) => const Buyurtma(),
          ),
          GoRoute(
            path: '/savallar',
            name: Savollar.routeName,
            builder: (context, state) => const Savollar(),
          ),
          GoRoute(
            path: '/sotib-olish',
            name: SotibOlish.routeName,
            builder: (context, state) => const SotibOlish(),
          ),
          GoRoute(
            path: '/tolov',
            name: Tolov.routeName,
            builder: (context, state) => const Tolov(),
          ),
          GoRoute(
            path: '/employment',
            name: Employment.routeName,
            builder: (context, state) => const Employment(),
          ),
          GoRoute(
            path: '/video-view',
            name: VideoViewScreen.routeName,
            builder: (context, state) => VideoViewScreen(),
          ),
        ],
      ),
    );
  }
}
