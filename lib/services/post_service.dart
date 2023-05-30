// ignore_for_file: unused_local_variable

import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://ogabek007.pythonanywhere.com/';

Future<void> addFavorite(int id) async {
  String prodData = jsonEncode({
    'prodouct': id,
  });

  final response = await http.post(
    Uri.parse('$baseUrl/dafna_api/add_love/'),
    headers: {"Content-Type": "application/json"},
    body: prodData,
  );
}

Future<void> addCard(int id) async {
  String prodData = jsonEncode({
    'prodouct': id,
  });

  final response = await http.post(
    Uri.parse('$baseUrl/dafna_api/add_cart/'),
    headers: {"Content-Type": "application/json"},
    body: prodData,
  );
}
