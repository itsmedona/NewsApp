import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news_application_api_dec11/model/NewsModel.dart';



class SearchPageController with ChangeNotifier {
  NewsModel searchmodel = NewsModel();
  Map<String, dynamic> decodedData = {};
  bool isloading = false;

  Future<void> searchfn({required String searchData}) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$searchData&category=business&apiKey=604580e027e14c8d9fe56f738068e266");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      searchmodel = NewsModel.fromJson(decodedData);
      notifyListeners();
    } else {
      print("api failed");
    }
  }
}

/*class SearchPageController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  NewsModel nSearch = NewsModel();
  bool isLoading = false;

  //fetchData() async {
  Future searchData({required String searchData}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8ddabb1dd03849f0a6c24fe8a19c71ea");
    final response = await http.get(url);
    print(response);

    if (response.statusCode == 200) {
      //Map<String, dynamic> decodedData = {};
      decodedData = jsonDecode(response.body);
      print(decodedData);
      nSearch = NewsModel.fromJson(decodedData);
      notifyListeners();
      //setState(() {});
    } else {
      print("error");
    }
    isLoading = false;
    notifyListeners();
  }
}*/
