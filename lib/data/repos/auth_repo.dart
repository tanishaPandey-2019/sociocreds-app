import 'dart:convert';
import 'dart:io';

import 'package:sociocredz/data/model/auth_response.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final baseUrl = "https://sociocredz.herokuapp.com/api/v1/";

  Future<AuthResponse> login(String idToken) async {
    final url = baseUrl + "user/login";
    try {
      var response = await http.post(
        url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode({
          "idToken": idToken,
        }),
      );
      print(response.body);
      return AuthResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }
}
