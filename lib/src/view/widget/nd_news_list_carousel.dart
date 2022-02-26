import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.gr.dart';
import '../../model/article.dart';
import '../../util/util.dart';
import '../../view_model/news_list_vm.dart';
import '../../view_model/saved_news_vm.dart';

class NewsDetailsNewsListCarousel extends StatelessWidget {
  const NewsDetailsNewsListCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsListVM theNewsListVM = Provider.of<NewsListVM>(context);
    void showDetails(Article article) {
      SavedNewsVM snVM = Provider.of<SavedNewsVM>(context, listen: false);
      snVM.currentArticle = article;
      snVM.reinitializeIsChecked();
      context.router.replace(NewsDetailsScreenRoute(article: article));
    }

    return CarouselSlider.builder(
      itemCount: theNewsListVM.topHeadlines.length,
      itemBuilder: (context, index, realIdx) {
        return InkWell(
          enableFeedback: true,
          onTap: () => showDetails(theNewsListVM.topHeadlines[index]),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 335,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
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
                  width: 335,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: Util.articleImage(
                            theNewsListVM.topHeadlines[index].urlToImage),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    theNewsListVM.topHeadlines[index].title,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: <Widget>[
                        Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          theNewsListVM.topHeadlines[index].source.name != ""
                              ? theNewsListVM.topHeadlines[index].source.name
                              .length >=
                              15
                              ? theNewsListVM
                              .topHeadlines[index].source.name
                              .substring(0, 15)
                              : theNewsListVM
                              .topHeadlines[index].source.name
                              : 'Source inconnue',
                          style: Theme.of(context).textTheme.caption,
                          overflow: TextOverflow.clip,
                        ),
                      ]),
                      Text(
                        theNewsListVM.topHeadlines[index].publishedAt != ""
                            ? theNewsListVM.topHeadlines[index].publishedAt
                            .substring(0, 10)
                            : 'Il y a 15 minutes',
                        style: Theme.of(context).textTheme.caption,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 270,
        aspectRatio: 16 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        //autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayInterval: const Duration(seconds: 8),
        pauseAutoPlayOnManualNavigate: true,
        viewportFraction: 0.9,
      ),
    );
  }
}
