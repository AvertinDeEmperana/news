//import 'dart:async';

//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:news/src/app_theme.dart';
import 'package:news/src/view/widget/shimmer_news_list_widget.dart';
import 'package:news/src/view_model/news_list_vm.dart';
import 'package:provider/provider.dart';

import '../../../data/api/status.dart';
import '../../widget/custom_error_widget.dart';
import '../../widget/news_list_widget.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: 'Actualités',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontWeight: FontWeight.w600),
            children: const <TextSpan>[
              TextSpan(text: '.', style: TextStyle(fontSize: 44, color: AppTheme.rrose)),
            ],
          ),
        ),
      ),
      body: Consumer<NewsListVM>(builder: (context, viewModel, _) {
        switch (viewModel.result.status) {
          case Status.LOADING:
            return const ShimmerNewsListWidget();
          case Status.ERROR:
            return CustomErrorWidget(
                theNewsVM: viewModel,
                errorText: /*viewModel.result.message ?? */ "Une erreur est survenue. Balayer l'écran pour actualiser ");
          case Status.COMPLETED:
            return NewsListWidget<NewsListVM>(
              articles: viewModel.articles,
            );
          default:
            return const ShimmerNewsListWidget();
        }
      }),
    );
  }
}
