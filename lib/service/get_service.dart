import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://ogabek007.pythonanywhere.com/';

//GET CATALOG

Future<List> getCatalog() async {
  final response = await http.get(Uri.parse('$baseUrl/dafna_app/get_katalog/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['katalogs'];
}

//GET CONTACT

Future<List> getContact() async {
  final response = await http.get(Uri.parse('$baseUrl/dafna_app/get_contact/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['contacts'];
}

// GET MAIN CONTACT

Future<List> getMainContact() async {
  final response =
      await http.get(Uri.parse('$baseUrl/dafna_app/get_main_contact/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['main_contacts'];
}

//GET NEW PRODUCTS

Future<List> getNewproduct() async {
  final response =
      await http.get(Uri.parse('$baseUrl/dafna_app/get_new_prodouct/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['prodoucts'];
}

//GET RECOMMENDATION

Future<List> getRecommendation() async {
  final response =
      await http.get(Uri.parse('$baseUrl/dafna_app/get_rescommentations/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['prodoucts'];
}

//GET CATALOG TYPE

Future<Map> getCatalogType(int id) async {
  // Get request to Api
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_prodouct_type/$id/'),
  );
  Map data = jsonDecode(response.body);
  return data;
}

//GET PRODUCTS

Future<Map> getProducts(int id) async {
  // Get request to Api
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_prodouct/$id/'),
  );
  Map data = jsonDecode(response.body);
  return data;
}

//GET VIDEO VIEWS

Future<List> getVideo() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_video/'),
  );

  Map data = jsonDecode(response.body);
  return data['videos'];
}

// GET PRODUCT DETAIL

Future<Map> getProductDetail(int id) async {
  final response =
      await http.get(Uri.parse('$baseUrl/dafna_app/get_prodouct_detail/$id/'));

  Map data = jsonDecode(response.body);

  return data['prodouct'];
}

// DELETE LIKED PRODUCT

Future<void> deleteLike(int id) async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/delete_love/$id/'),
  );
}

// GET FAVORITES

Future<List> getFavorite() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_love/'),
  );

  Map data = jsonDecode(response.body);
  return data['loves'];
}
