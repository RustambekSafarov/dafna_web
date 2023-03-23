import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://ogabek007.pythonanywhere.com';

//GET CATALOG

Future<List> getCatalog() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_katalog/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['katalogs'];
}

//GET CONTACT

Future<List> getContact() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_contact/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['contacts'];
}

// GET MAIN CONTACT

Future<List> getMainContact() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_main_contact/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['main_contacts'];
}

//GET NEW PRODUCTS

Future<List> getNewproduct() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_new_prodouct/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['prodoucts'];
}

//GET RECOMMENDATION

Future<List> getRecommendation() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_rescommentations/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

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
    headers: {
      "Content-Type": "application/json",
    },
  );
  Map data = jsonDecode(response.body);
  return data;
}

//GET PRODUCTS

Future<Map> getProducts(int id) async {
  // Get request to Api
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_prodouct/$id/'),
    headers: {
      "Content-Type": "application/json",
    },
  );
  Map data = jsonDecode(response.body);
  return data;
}

//GET VIDEO VIEWS

Future<List> getVideo() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_video/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  Map data = jsonDecode(response.body);
  return data['videos'];
}

// GET PRODUCT DETAIL

Future<Map> getProductDetail(int id) async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_prodouct_detail/$id/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  Map data = jsonDecode(response.body);

  return data['prodouct'];
}

// DELETE LIKED PRODUCT

Future<void> deleteLike(int id) async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/delete_love/$id/'),
    headers: {
      "Content-Type": "application/json",
    },
  );
}

// GET FAVORITES

Future<List> getFavorite() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_love/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  Map data = jsonDecode(response.body);
  return data['loves'];
}

// GET SEARCH RESULT

Future<List> getSearch(String value) async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/sort/$value/'),
    headers: {
      "Content-Type": "application/json",
    },
  );
  Map data = jsonDecode(response.body);
  return data['sorts'];
}

// GET CART RESULT

Future<Map> getCart() async {
  final response = await http.get(
    Uri.parse('https://ogabek007.pythonanywhere.com/dafna_app/get_cart/'),
    headers: {
      "Content-Type": "application/json",
    },
  );
  Map data = jsonDecode(response.body);
  return data;
}
