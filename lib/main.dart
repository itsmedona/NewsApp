import 'package:flutter/material.dart';
import 'package:news_application_api_dec11/controller/HomePageController.dart';
import 'package:news_application_api_dec11/controller/SearchPageController.dart';
import 'package:news_application_api_dec11/view/HomePage/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageController()),
        ChangeNotifierProvider(create: (context) => SearchPageController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
