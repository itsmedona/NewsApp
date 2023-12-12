import 'package:flutter/material.dart';
import 'package:share/share.dart';

class HomePageWidget extends StatelessWidget {
  final String title;
  final String description;
  final String author;
  final String date;
  final String image;

  const HomePageWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.author,
      required this.date,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Image.network(image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        author,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        date,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Share.share(title);
                        },
                        icon: Icon(Icons.share))
                  ],
                ),
                SizedBox(
                  child: Text(
                    description,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              ],
            ),
            ),
            );
  }
}
