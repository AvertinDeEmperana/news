
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../model/Article.dart';
import 'SingleArticleWidget.dart';

class Nlvbldr extends StatelessWidget {

  const Nlvbldr({
    Key? key,
    required this.theScrollController,
    required this.isLoading,
    required this.articles,
  }) : super(key: key);

  final ScrollController theScrollController;
  final bool isLoading;
  final List<Article>? articles;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          ListView.builder(
              controller: theScrollController,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: articles!.length,
              itemBuilder: ((context, index) => SingleArticleWidget(article: articles![index]))
          ),
          if(isLoading)...[
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                    child: Lottie.asset('assets/splashanime.json')
                ),
              ),
            ),
          ],
        ]);
  }
}