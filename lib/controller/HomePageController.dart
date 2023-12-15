import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_application_api_dec11/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class HomePageController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  NewsModel nmodel = NewsModel();
  bool isLoading = false;

  fetchData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=604580e027e14c8d9fe56f738068e266");
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
