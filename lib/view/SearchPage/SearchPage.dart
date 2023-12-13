import 'package:flutter/material.dart';
import 'package:news_application_api_dec11/controller/SearchPageController.dart';
import 'package:news_application_api_dec11/model/NewsModel.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  NewsModel nSearch = NewsModel();

  void initState() {
    searchData(searchData: '');
    super.initState();
  }

  //Future<void> fetchData() async {
    Future searchData({required String searchData})async{
    Provider.of<SearchPageController>(context, listen: false).searchData(searchData: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search), border: OutlineInputBorder()),
            )
          ],
        ),
      ),
      //SizedBox(height: 20,)
    );
  }
}
