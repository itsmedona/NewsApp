import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_application_api_dec11/model/NewsModel.dart';
import 'package:news_application_api_dec11/view/HomePage/HomePageWidget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsModel nmodel = NewsModel();
  Map<String, dynamic> decodeData = {};

  fetchData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8ddabb1dd03849f0a6c24fe8a19c71ea");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      nmodel = NewsModel.fromJson(decodeData);
      setState(() {});
    } else {
      print("api failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => HomePageWidget(
            title: nmodel.articles?[index].title ?? "",
            description: nmodel.articles?[index].description ?? "",
            author: nmodel.articles?[index].author ?? "",
            date: nmodel.articles?[index].publishedAt.toString() ?? "",
            image: nmodel.articles?[index].urlToImage ?? ""),
      ),
    );
  }
}
