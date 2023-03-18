import 'package:flutter/foundation.dart';

class CartItem {
  String title;
  CartItem({required this.title});
}

class Cart with ChangeNotifier {}
