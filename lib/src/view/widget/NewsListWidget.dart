import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/api/Status.dart';
import '../../model/Article.dart';
import '../../util/Util.dart';
import '../../view_model/NewsListVM.dart';
import 'Nlvbldr.dart';

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
          Util.allLoadedToast();
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
    return Nlvbldr(theScrollController: theScrollController, isLoading: isLoading, articles: widget.articles);
  }
}