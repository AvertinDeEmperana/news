import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../model/article.dart';
import 'dismissible_article_widget.dart';
import 'single_article_widget.dart';

class Nlvbldr extends StatelessWidget {
  const Nlvbldr({Key? key, required this.theScrollController, required this.isLoading, required this.articles, required this.isChildDismmisible, }) : super(key: key);

  final ScrollController theScrollController;
  final bool isLoading;
  final List<Article>? articles;
  final bool isChildDismmisible;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          controller: theScrollController,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: articles!.length,
          itemBuilder: ((context, index) {
            if(isChildDismmisible){
              return DismissArticleWidget(articleWidget: SingleArticleWidget(article: articles![index]),);
            }
            return SingleArticleWidget(article: articles![index]);
          })),
      if (isLoading) ...[
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Center(child: Lottie.asset('assets/splashanime.json')),
          ),
        ),
      ],
    ]);
  }
}
