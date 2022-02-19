import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/api/Status.dart';
import '../../model/Article.dart';
import '../../view_model/NewsListVM.dart';
import 'SingleArticleWidget.dart';

class NewsListWidget extends StatefulWidget {
  final NewsListVM theNewsVM;
  const NewsListWidget({Key? key, required this.theNewsVM}) : super(key: key);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  ScrollController theScrollController = ScrollController();
  late List<Article> articles;

  loadMoreData() async{
      setState(() async {
          widget.theNewsVM.page++;
          await widget.theNewsVM.updateListIfNewDataFetched();
          //widget.theNewsVM.fetchEverythingNews();
          articles.addAll(widget.theNewsVM.articles);
      });
  }

  @override
  void initState() {
    super.initState();
    articles = widget.theNewsVM.articles;
    theScrollController.addListener(() async {
      if(theScrollController.position.pixels >= theScrollController.position.maxScrollExtent &&
          /*widget.theNewsVM.articles.isNotEmpty && */
          (widget.theNewsVM.articles.length < widget.theNewsVM.totalResults) &&
          (widget.theNewsVM.result.status == Status.COMPLETED)
      ) {
        await loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    theScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: 'A la une',
                style: Theme.of(context).textTheme.headline1,
                children: const <TextSpan>[
                  TextSpan(text: '.', style: TextStyle(fontSize: 44)),
                ],
              ),
            ),
          ),
          Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                      controller: theScrollController,
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      //itemCount: widget.theNewsVM.articles.length,
                      itemCount: articles.length,
                      //itemBuilder: ((context, index) => SingleArticleWidget(article: widget.theNewsVM.articles[index]))
                      itemBuilder: ((context, index) => SingleArticleWidget(article: articles[index]))
                  ),
                  if(widget.theNewsVM.result.status == Status.LOADING)...[
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
                    )
                  ]
                ],
              )
          ),
        ],
      ),
    );
  }
}