import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://ogabek007.pythonanywhere.com/';

Future<void> addFavorite(int id) async {
  String userData = jsonEncode({
    'prodouct': id,
  });

  final response = await http.post(
    Uri.parse('$baseUrl/dafna_api/add_love/'),
    headers: {"Content-Type": "application/json"},
    body: userData,
  );
}
