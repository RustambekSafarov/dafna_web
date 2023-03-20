import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://ogabek007.pythonanywhere.com';

Future<void> addFavorite(int id) async {
  String body = jsonEncode({
    'prodouct': id,
  });

  final response = await http.post(
    Uri.parse('https://ogabek007.pythonanywhere.com/dafna_app/add_love/'),
    headers: {"Content-Type": "application/json"},
    body: body,
  );
  print(response.statusCode);
}

Future<void> addCard(int id) async {
  String body = jsonEncode({
    'prodouct': id,
  });

  final response = await http.post(
    Uri.parse('https://ogabek007.pythonanywhere.com/dafna_app/add_cart/'),
    headers: {"Content-Type": "application/json"},
    body: body,
  );
  print(response.statusCode);
}
