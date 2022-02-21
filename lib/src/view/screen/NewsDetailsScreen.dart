import 'package:flutter/material.dart';
import 'package:news/src/view/widget/NewsListCarousel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/Article.dart';
import '../../util/Util.dart';
import '../../view_model/NewsListVM.dart';

class NewsDetailsScreen extends StatefulWidget {
  final Article article;
  final NewsListVM theNewsListVM;

  const NewsDetailsScreen(
      {Key? key, required this.article, required this.theNewsListVM})
      : super(key: key);

  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double dWidth = MediaQuery.of(context).size.width;
    double dHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: "Partager l'article",
          backgroundColor: Colors.black87,
          onPressed: () => Util.articleText(widget.article.url).isEmpty
              ? null
              : _onShare(context),
          child: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: dWidth,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Util.articleImage(widget.article.urlToImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: const Color.fromRGBO(0, 0, 0, .15),
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.white,
                            ),
                            IconButton(
                              icon: const Icon(Icons.bookmark_border_outlined),
                              onPressed: () {
                                return;
                              },
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  widget.article.author != ""
                                      ? widget.article.author!
                                      : (widget.article.source!.name != "" ? widget.article.source!.name!  : 'Auteur inconnu') ,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.3,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: dWidth,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                  Util.articleText(widget.article.title),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      letterSpacing: 0.2)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: <Widget>[
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Util.articleText(
                                          widget.article.source?.name),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ]),
                                  Text(
                                    widget.article.publishedAt != null
                                        ? widget.article.publishedAt!
                                            .substring(0, 10)
                                        : 'Il y a 15 minutes',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Align(
              //   alignment: ,
              // ),
              Positioned(
                top: 380,
                height: 500,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22)),
                  ),
                  width: dWidth,
                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(widget.article.description != "")...[
                        Text(
                          Util.articleText(widget.article.description),
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                      if (widget.article.url != "") ...[
                        GestureDetector(
                          onTap: () => _launchUrl(
                              widget.article.url ?? "https://newsapi.org"),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Consulter la page de l'article",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.blue,
                                    decoration:
                                    TextDecoration.underline,
                                  ),
                                ),
                                const Icon(Icons.launch, color: Colors.grey,)
                              ],
                            ),
                          )
                        ),
                      ],
                      /*RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: 'Autres articles',
                            style: Theme.of(context).textTheme.headline1!.copyWith(letterSpacing: 0.2),
                            children: const <TextSpan>[
                              TextSpan(text: '.', style: TextStyle(fontSize: 40)),
                            ],
                          ),
                      ),*/
                      NewsListCarousel(theNewsListVM: widget.theNewsListVM)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Impossible d'afficher la page $url";
    }
    //Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleWebView(url: url)));
  }

  void _onShare(BuildContext context) async {
    await Share.share(Util.articleText(widget.article.url),
        subject: Util.articleText(widget.article.title));
  }
}
