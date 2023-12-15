import 'package:flutter/material.dart';
import 'package:news_application_api_dec11/controller/SearchPageController.dart';
import 'package:news_application_api_dec11/model/NewsModel.dart';

import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  NewsModel searchmodel = NewsModel();

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final scontroller = Provider.of<SearchPageController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "Search",
                    suffixIcon: IconButton(
                        onPressed: () {
                          Provider.of<SearchPageController>(context,
                                  listen: false)
                              .searchfn(searchData: search.text.toLowerCase());
                        },
                        icon: Icon(Icons.search))),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: scontroller.searchmodel.totalResults,
              itemBuilder: (context, index) => Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child:
                    Text(scontroller.searchmodel.articles?[index].title ?? ""),
              ),
            ),
          )
        ],
      ),
    );
  }
}
