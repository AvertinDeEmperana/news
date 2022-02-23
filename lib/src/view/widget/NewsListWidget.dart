import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../data/api/Status.dart';
import '../../model/Article.dart';
import '../../view_model/NewsListVM.dart';
import 'SingleArticleWidget.dart';

class NewsListWidget extends StatefulWidget {
  final List<Article>? articles;
  const NewsListWidget({Key? key, required this.articles}) : super(key: key);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  ScrollController theScrollController = ScrollController();
  bool isLoading = false;
  bool allLoaded = false;
  late NewsListVM theNewsVM;

  loadMoreData() async{
      if(allLoaded){
          Fluttertoast.showToast(
              msg: "Tous les articles ont été chargé",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: 16.0
          );
          return;
      }
      setState(()  {
          isLoading = true;
      });
      theNewsVM.page++;
      await theNewsVM.updateListIfNewDataFetched();
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
          isLoading = false;
          allLoaded = theNewsVM.topHeadlines.length == theNewsVM.totalResults;
          allLoaded = widget.articles?.length == theNewsVM.totalResults;
      });
  }

  @override
  void initState() {
      super.initState();
      NewsListVM newsVM = Provider.of<NewsListVM>(context, listen: false);
      theNewsVM = newsVM;
      theScrollController.addListener(() async {
          if(theScrollController.position.pixels == theScrollController.position.maxScrollExtent && (theNewsVM.result.status == Status.COMPLETED)){
              loadMoreData();
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
                text: 'Actualités',
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
                      itemCount: widget.articles!.length,
                      itemBuilder: ((context, index) => SingleArticleWidget(article: widget.articles![index]))
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