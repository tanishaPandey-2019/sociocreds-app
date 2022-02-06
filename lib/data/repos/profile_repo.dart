import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:sociocredz/data/model/recent_trans_reponse.dart';
import 'package:http/http.dart' as http;
import 'package:sociocredz/data/model/user_response.dart';
import 'package:sociocredz/data/model/user_transaction.dart';

class ProfileRepo {
  final baseUrl = "https://sociocredz.herokuapp.com/api/v1/user/";
  final _box = GetStorage();

  Future<RecentTransResponse> getRecentTrans() async {
    final url = baseUrl + "transactions/recent";
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
        return RecentTransResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

  Future<UserResponse> getUserDetails() async {
    final url = baseUrl + "details";
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
        return UserResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

  Future<TransactionsResponse> getUserTransactions() async {
    final url = baseUrl + "transactions";
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
        return TransactionsResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
