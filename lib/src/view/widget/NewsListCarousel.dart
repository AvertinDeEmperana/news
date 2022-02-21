import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Routes.gr.dart';
import '../../model/Article.dart';
import '../../util/Util.dart';
import '../../view_model/NewsListVM.dart';

class NewsListCarousel extends StatelessWidget {
  final NewsListVM theNewsListVM;
  const NewsListCarousel({Key? key, required this.theNewsListVM}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void showDetails(Article article) {
      context.router.replace(
          NewsDetailsScreenRoute(article: article, theNewsListVM: theNewsListVM)
      );
    }

    return CarouselSlider.builder(
      itemCount: theNewsListVM.articles.length,
      itemBuilder: (context, index, realIdx) {
        return InkWell(
          enableFeedback: true,
            onTap: () => showDetails(theNewsListVM.articles[index]),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 300,
              // height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.2),
                    offset: const Offset(0, 3),
                    blurRadius: 12,
                    spreadRadius: 5)
                ],
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: Util.articleImage(theNewsListVM.articles[index].urlToImage),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      Util.articleText(theNewsListVM.articles[index].title),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
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
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              Text(Util.articleText(theNewsListVM.articles[index].source?.name) != "" ?
                              (Util.articleText(theNewsListVM.articles[index].source!.name).length >= 15 ?
                              Util.articleText(theNewsListVM.articles[index].source!.name).substring(0, 15) :
                              Util.articleText(theNewsListVM.articles[index].source!.name)) :
                              'Source inconnue', style: Theme.of(context).textTheme.caption, overflow: TextOverflow.clip,),
                            ]
                        ),
                        Text(theNewsListVM.articles[index].publishedAt != null ? theNewsListVM.articles[index].publishedAt!.substring(0, 10) : 'Il y a 15 minutes', style: Theme.of(context).textTheme.caption, overflow: TextOverflow.clip,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        );
      },
      options: CarouselOptions(
        height: 280,
        aspectRatio: 16/9,
        autoPlay: false,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(seconds: 6),
        viewportFraction: 0.8,
      ),
    );
  }
}
