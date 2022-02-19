import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../Routes.gr.dart';
import '../../model/Article.dart';

class SingleArticleWidget extends StatefulWidget {
  final Article article;
  const SingleArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  _SingleArticleWidgetState createState() => _SingleArticleWidgetState();
}

class _SingleArticleWidgetState extends State<SingleArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: () => openDetailPage(widget.article),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  image: articleImage(widget.article.urlToImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: 225,
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(articleText(widget.article.title), style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis, maxLines: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(articleText(widget.article.source?.name), style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis,),
                      Text(widget.article.publishedAt != null ? widget.article.publishedAt!.substring(0, 10) : 'Il y a 15 minutes', style: Theme.of(context).textTheme.caption, overflow: TextOverflow.clip,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  openDetailPage(Article article) {
    context.router.push(
        NewsDetailsScreenRoute(article: article)
    );
  }

  ImageProvider articleImage(String? url) {
      if (url == null || url.isEmpty || url[4] != 's') {
        return const AssetImage('assets/images/default.jpg');
      } else {
        return NetworkImage(url);
      }
  }

  String articleText(String? str) {
      if (str == null || str.isEmpty) {
          return "";
      } else {
          return str;
      }
  }
}
