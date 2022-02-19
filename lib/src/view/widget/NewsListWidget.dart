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
  //List<Article> articles = [];
  bool isLoading = false;
  bool allLoaded = false;

  loadMoreData() async{
      if(allLoaded){
          return;
      }
      setState(()  {
          isLoading = true;
      });
      widget.theNewsVM.page++;
      await widget.theNewsVM.updateListIfNewDataFetched();
      await Future.delayed(const Duration(seconds: 3));
      //articles.addAll(widget.theNewsVM.articles);
      setState(() {
          isLoading = false;
          allLoaded = widget.theNewsVM.articles.length == widget.theNewsVM.totalResults;
      });
  }

  @override
  void initState() {
      super.initState();
      //articles.addAll(widget.theNewsVM.articles);
      theScrollController.addListener(() async {
          if(theScrollController.position.pixels == theScrollController.position.maxScrollExtent) {
              if (widget.theNewsVM.articles.length < widget.theNewsVM.totalResults){
                  if(widget.theNewsVM.result.status == Status.COMPLETED){
                      {
                          loadMoreData();
                      }
                  }
              }
              /*Timer(const Duration(seconds: 3), () {
                  setState(() {
                      _isContainerVisible = false;
                  });
              });*/
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
                      itemCount: widget.theNewsVM.articles.length,
                      //itemCount: articles.length + (allLoaded? 1:0),
                      //itemBuilder: ((context, index) => SingleArticleWidget(article: widget.theNewsVM.articles[index]))
                      itemBuilder: ((context, index) {
                        if(index < widget.theNewsVM.articles.length-1){
                            return SingleArticleWidget(article: widget.theNewsVM.articles[index]);
                        }
                        else{
                            return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: const Center(
                                    child: Text("Plus aucune données à afficher")
                                ),
                            );
                        }

                      })
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
              ])
          ),
        ],
      ),
    );
  }
}