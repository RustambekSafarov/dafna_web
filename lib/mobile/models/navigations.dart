import 'package:dafna_web/mobile/screens/catalog_detail.dart';
import 'package:dafna_web/mobile/screens/home_screen.dart';
import 'package:dafna_web/mobile/screens/product_detail.dart';
import 'package:dafna_web/mobile/screens/product_screen.dart';
import 'package:dafna_web/web/screens/catalog_detail_screen.dart';
import 'package:go_router/go_router.dart';

class MobileNavigations {
  static List<RouteBase> route = [
    GoRoute(
      path: '/home',
      name: HomeScreenM.routeName,
      builder: (context, state) => HomeScreenM(),
    ),
    GoRoute(
      path: '/catalog-detail',
      name: CatalogDetailScreen.routeName,
      builder: (context, state) => CatalogDetailScreenM(
        catalogId: state.extra as int,
      ),
    ),
    GoRoute(
      path: '/product',
      name: ProductScreenM.routeName,
      builder: (context, state) => ProductScreenM(
        productTypeId: (state.extra as List)[0],
        productId: (state.extra as List)[1],
        productTypeName: (state.extra as List)[2].toString(),
      ),
    ),
    GoRoute(
      path: '/product-detail',
      name: ProductDetailScreenM.routeName,
      builder: (context, state) => ProductDetailScreenM(
        id: state.extra as int,
      ),
    ),
  ];
}
