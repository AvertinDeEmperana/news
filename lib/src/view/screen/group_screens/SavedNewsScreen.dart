import 'package:flutter/material.dart';
import 'package:news/src/view/widget/SavedNewsListWidget.dart';
import 'package:provider/provider.dart';

import '../../../data/api/Status.dart';
import '../../../model/Article.dart';
import '../../../view_model/SavedNewsVM.dart';
import '../../widget/ArticlesNotFoundWidget.dart';
import '../../widget/NewsListWidget.dart';
import '../../widget/ShimmerNewsListWidget.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({Key? key}) : super(key: key);

  @override
  _SavedNewsScreenState createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  SavedNewsVM snVM = SavedNewsVM();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_articles = loadData();
    SavedNewsVM tsnvm = Provider.of<SavedNewsVM>(context, listen: false);
    snVM = tsnvm;
    snVM.loadArticles();
  }

  /*Future<List<Article>> loadData() async {
      await snVM.getTwentyArticles();
      return snVM.localDbArticles;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SavedNewsVM>(
        create: (BuildContext context) => snVM,
        child: Consumer<SavedNewsVM>(builder: (context, snVM, _) {
          switch (snVM.status) {
            case Status.LOADING:
              return const ShimmerNewsListWidget();
            case Status.NOTFOUND:
              return const ArticlesNotFoundWidget(errorText: /*viewModel.result.message ?? */ "Une erreur est survenue. Balayer l'écran pour actualiser ");
            case Status.COMPLETED:
              return SavedNewsListWidget(articles: snVM.localDbArticles);
              //return const Text("Done");
              /*return FutureBuilder(
                  future: _articles,
                  builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
                      print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                          return const ShimmerNewsListWidget();
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const ArticlesNotFoundWidget(errorText: /*viewModel.result.message ?? */ "Une erreur est survenue. Balayer l'écran pour actualiser ");
                        } else if (snapshot.hasData) {
                          return NewsListWidget(articles: snapshot!.data);
                        } else {
                          return const Text('Empty data');
                        }
                      }else {
                        return Text('State: ${snapshot.connectionState}');
                      }
                  }
              );*/
            default:
          }
          return Container();
        }),
      ),
    );
  }
}
