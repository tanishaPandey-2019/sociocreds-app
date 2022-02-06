import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sociocredz/data/model/leaderboard_response.dart';

class StatsRepo {
  final baseUrl = "https://sociocredz.herokuapp.com/api/v1/";
  final _box = GetStorage();

  Future<LeaderboardResponse> getLeaderboard() async {
    final url = baseUrl + "user/leaderboard";
    try {
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer ${_box.read('userToken')}",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return LeaderboardResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
