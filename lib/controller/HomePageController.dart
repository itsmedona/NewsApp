import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_application_api_dec11/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class HomePageController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  NewsModel nmodel = NewsModel();

  fetchData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8ddabb1dd03849f0a6c24fe8a19c71ea");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = {};
      decodedData = jsonDecode(response.body);
      nmodel = NewsModel.fromJson(decodedData);
      notifyListeners();
      //setState(() {});
    } else {
      print("api failed");
    }
  }
}
