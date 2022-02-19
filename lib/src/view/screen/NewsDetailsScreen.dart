import 'package:flutter/material.dart';

import '../../model/Article.dart';

class NewsDetailsScreen extends StatefulWidget {
  final Article article;
  const NewsDetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Details de l'article")
      ),
    );
  }
}



























