import 'package:flutter/material.dart';
import 'package:news/src/view/widget/NewsListCarousel.dart';

import '../../model/Article.dart';
import '../../util/Util.dart';
import '../../view_model/NewsListVM.dart';

class NewsDetailsScreen extends StatefulWidget {
  final Article article;
  final NewsListVM theNewsListVM;
  const NewsDetailsScreen({Key? key, required this.article, required this.theNewsListVM}) : super(key: key);

  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {

    @override
    Widget build(BuildContext context) {
      double dWidth = MediaQuery.of(context).size.width;
      double dHeight = MediaQuery.of(context).size.height;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: <Widget> [
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
                      padding: const EdgeInsets.only(top: 40, bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                color: Colors.white,
                              ),
                              IconButton(
                                icon: const Icon(Icons.bookmark_border_outlined),
                                onPressed: (){
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
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Text(widget.article.author != "" ? widget.article.author! : 'Auteur', style: const TextStyle(color: Colors.white, letterSpacing: 0.3, fontWeight: FontWeight.bold, fontSize: 13),),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Container(
                                width: dWidth,
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(Util.articleText(widget.article.title),  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18, letterSpacing: 0.2)),
                              ),
                              const SizedBox(height: 20,),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                        children: <Widget>[
                                          Container(
                                            width: 15,
                                            height: 15,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(Util.articleText(widget.article.source?.name), style: const TextStyle(color: Colors.white, fontSize: 14 ), overflow: TextOverflow.clip,),
                                        ]
                                    ),
                                    Text(widget.article.publishedAt != null ? widget.article.publishedAt!.substring(0, 10) : 'Il y a 15 minutes', style: const TextStyle(color: Colors.white, fontSize: 14 ), overflow: TextOverflow.clip,),
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
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)),
                    ),
                    width: dWidth,
                    height: 500,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: Util.articleText(widget.article.description),
                              style: Theme.of(context).textTheme.headline6,
                              children: const <TextSpan>[
                                TextSpan(text: '.', style: TextStyle(fontSize: 44)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15,),
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: 'Articles suggérés',
                              style: Theme.of(context).textTheme.headline1,
                              children: const <TextSpan>[
                                TextSpan(text: '.', style: TextStyle(fontSize: 44)),
                              ],
                            ),
                          ),
                          NewsListCarousel(theNewsListVM: widget.theNewsListVM)
                        ],
                    ),
                  ),
                ),
              ],
            ),
          )
        );
    }
}



























