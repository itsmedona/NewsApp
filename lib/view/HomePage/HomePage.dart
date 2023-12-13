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
  HomePageController mycontroller = HomePageController();
  void initState() {
    mycontroller.fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    Provider.of<HomePageController>(context,listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {

    final HomePageController=Provider.of<HomePageController>
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
            title: , //nmodel.articles?[index].title ?? "",
            description:, // .articles?[index].description ?? "",
            author:, //nmodel.articles?[index].author ?? "",
            date: , //nmodel.articles?[index].publishedAt.toString() ?? "",
            image:, // nmodel.articles?[index].urlToImage ?? ""
            ),
      ),
    );
  }
}
