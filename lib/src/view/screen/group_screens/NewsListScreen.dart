//import 'dart:async';

//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:news/src/view/widget/ShimmerNewsListWidget.dart';
import 'package:news/src/view_model/NewsListVM.dart';
import 'package:provider/provider.dart';

import '../../../data/api/Status.dart';
import '../../widget/CustomErrorWidget.dart';
import '../../widget/NewsListWidget.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  //ConnectivityResult _connectionStatus = ConnectivityResult.none;
  //late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  //final Connectivity _connectivity = Connectivity();
  //NewsListVM viewModel = NewsListVM();

  @override
  void initState() {
      super.initState();
      /*NewsListVM nlVM = Provider.of<NewsListVM>(context, listen: false);
      nlVM.fetchTopHeadlinesNews();*/
      //initConnectivity();
      //_connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    //_connectivitySubscription.cancel();
    super.dispose();
  }

  /*Future<void> initConnectivity() async {
      late ConnectivityResult result;
      try{
            result = await _connectivity.checkConnectivity();
      }  on PlatformException catch (e) {
            if (kDebugMode) {
              print("Impossible de vérifier l'état de la connection $e");
            }
            return;
      }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) {
          return Future.value(null);
      }
      return _updateConnectionStatus(result);
  }*/

  /*Future<void> _updateConnectionStatus(ConnectivityResult result) async {
      setState(() {
        _connectionStatus = result;
      });
  }*/

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: 'Actualités',
                style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
                children: const <TextSpan>[
                  TextSpan(text: '.', style: TextStyle(fontSize: 44)),
                ],
              ),
            ),
          ),
          body: Consumer<NewsListVM>(builder: (context, viewModel, _) {
                switch (viewModel.result.status) {
                    case Status.LOADING:
                        return const ShimmerNewsListWidget();
                    case Status.ERROR:
                        return CustomErrorWidget(theNewsVM: viewModel, errorText: /*viewModel.result.message ?? */ "Une erreur est survenue. Balayer l'écran pour actualiser ");
                    case Status.COMPLETED:
                        return NewsListWidget(articles: viewModel.topHeadlines,);
                   default:
                        return const ShimmerNewsListWidget();
                }
          }),
      );
  }
}