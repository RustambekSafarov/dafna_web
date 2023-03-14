import 'package:go_router/go_router.dart';

import '../screens/catalog_detail_screen.dart';
import '../screens/catalog_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/employment.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/product_screen.dart';
import '../screens/search_screen.dart';
import '../screens/shopping_card_screen.dart';
import '../screens/video_view_screen.dart';
import '../widget/footers/afzalliklar.dart';
import '../widget/footers/buyurtma.dart';
import '../widget/footers/savollar.dart';
import '../widget/footers/sotib_olish.dart';
import '../widget/footers/tolov.dart';

class WebNavigations {
  static List<RouteBase> route = [
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
      },
    ),
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
    GoRoute(
      path: '/favorites',
      name: FavoritesScreen.routeName,
      builder: (context, state) => FavoritesScreen(),
    ),
    GoRoute(
      path: '/search-result',
      name: SearchResultScreen.routeName,
      builder: (context, state) => SearchResultScreen(
        value: state.extra as String,
      ),
    ),
    GoRoute(
      path: '/shopping-cart',
      name: ShoppingCardScreen.routeName,
      builder: (context, state) => ShoppingCardScreen(
          // value: state.extra as String,
          ),
    ),
  ];
}
