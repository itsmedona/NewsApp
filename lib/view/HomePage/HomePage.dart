import 'package:flutter/material.dart';
import 'package:news_application_api_dec11/controller/HomePageController.dart';
import 'package:news_application_api_dec11/view/HomePage/HomePageWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

@override
Widget build(BuildContext context) {
  final HomeControllerobj = Provider.of<HomePageController>(context);
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
          title: HomeControllerobj.nmodel.articles?[index].title ?? "",
          description:
              HomeControllerobj.nmodel.articles?[index].description ?? "",
          author: HomeControllerobj.nmodel.articles?[index].author ?? "",
          date: HomeControllerobj.nmodel.articles?[index].publishedAt
                  .toString() ??
              "",
          image: HomeControllerobj.nmodel.articles?[index].urlToImage ?? ""),
    ),
  );
}
