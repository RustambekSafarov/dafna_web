import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://ogabek007.pythonanywhere.com/';

Future<List> getCatalog() async {
  final response = await http.get(Uri.parse('$baseUrl/dafna_app/get_katalog/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['katalogs'];
}

Future<List> getContact() async {
  final response = await http.get(Uri.parse('$baseUrl/dafna_app/get_contact/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['contacts'];
}

Future<List> getNewproduct() async {
  final response =
      await http.get(Uri.parse('$baseUrl/dafna_app/get_new_prodouct/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['prodoucts'];
}

Future<List> getRecommendation() async {
  final response =
      await http.get(Uri.parse('$baseUrl/dafna_app/get_rescommentations/'));

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(response.body);
  return data['prodoucts'];
}
