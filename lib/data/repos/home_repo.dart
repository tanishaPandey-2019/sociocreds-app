import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:sociocredz/data/model/campaign_response.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  final baseUrl = "https://sociocredz.herokuapp.com/api/v1/";
  final _box = GetStorage();

  Future<CampaignResponse> getCampaigns() async {
    final url = baseUrl + "user/campaigns/fetch";
    try {
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer ${_box.read('userToken')}",
        },
      );
      print(response.body);
      if (response.statusCode == 201) {
        return CampaignResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

  Future<bool> donate(int amount, String description) async {
    final url = baseUrl + "user/donate";
    try {
      var response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer ${_box.read('userToken')}",
        },
        body: jsonEncode({
          "amount": amount,
          "description": description,
        }),
      );
      print(response.body);
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
