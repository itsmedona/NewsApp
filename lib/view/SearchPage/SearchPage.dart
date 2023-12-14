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

  TextEditingController search = TextEditingController();

  //void initState() {
  //searchData(searchData: '');
  //super.initState();
  //}

  //Future<void> fetchData() async {
  // Future searchData({required String searchData}) async {
  // Provider.of<SearchPageController>(context, listen: false)
  //   .searchData(searchData: '');
  //}

  @override
  Widget build(BuildContext context) {
    final sController=Provider.of<SearchPageController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                TextField(
                  controller: search,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      hintText: "Search",
                      suffixIcon: IconButton(
                        onPressed: () {
                          Provider.of<SearchPageController>(context,listen: false).nSearch(searchData:search.text.toLowerCase());
                        },
                        icon: Icon(Icons.search),
                      )),
                )
              ],
            ),
          ),
        
      
      Expanded(
        child: ListView.builder(itemCount: sController.nSearch.totalResults,
          itemBuilder: (context,index)=>Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text(sController.nSearch.articles?[index].title??""),
          )),
      )
        ],
        ),  //SizedBox(height: 20,)
    );
  }
}
