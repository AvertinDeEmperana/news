import 'package:flutter/material.dart';
import 'package:news/src/App_Theme.dart';
import 'package:news/src/view/widget/NewsListWidget.dart';

import '../../../view_model/NewsListVM.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin  {
  late TabController _tabController;

  final tabs = <Tab>[
    const Tab(text: 'Tout'),
    const Tab(text: 'Technologie'),
    const Tab(text: 'Science '),
  ];

  final tabPages = <Widget>[
    const Center(child: Text("Tout"),),
    const Center(child: Text("technologie"),),
    const Center(child: Text("science"),),
    /*
    const NewsListWidget(articles: sportArticles,),
    const NewsListWidget(articles: technoArticles,),
    const NewsListWidget(articles: healthArticles,),
    const NewsListWidget(articles: entertArticles,),
     */
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      Size dSize = MediaQuery.of(context).size;
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: 'Actualité mondiale',
                                  style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
                                  children: const <TextSpan>[
                                    TextSpan(text: '.', style: TextStyle(fontSize: 44)),
                                  ],
                              ),
                          ),
                          Text("Restez informés des dernières nouvelles", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          /*Row(children: [Container(width: 40,height: 40,margin: const EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(color: AppTheme.lightGrey,
                                          borderRadius: BorderRadius.circular(6),),
                                      child: IconButton(icon: Icon(Icons.settings, color: Theme.of(context).colorScheme.secondary,),
                                        onPressed: () {  },
                                      ),
                                  )
                              ],
                          ),*/
                          Container(
                            height: 45,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: AppTheme.lightGrey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextField(
                              onSubmitted: (keywordRecipe) {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => FoundedRecipes(recipeFinder(keywordRecipe, _recipeList))));
                              },
                              style: const TextStyle(fontSize:16),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Recherche...',
                                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize:16, fontWeight: FontWeight.w400),
                                  prefixIcon: Icon(Icons.search,size: 20,color: Theme.of(context).colorScheme.secondary,)
                              ),
                            ),
                          ),
                          TabBar(
                              indicatorWeight: 2,
                              indicatorColor: Theme.of(context).colorScheme.secondary,
                              labelColor: Theme.of(context).colorScheme.secondary,
                              unselectedLabelColor: Colors.grey,
                              isScrollable: true,
                              labelStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                  color: AppTheme.lightShimmerGrey100Color,
                                fontWeight: FontWeight.w600,
                              ),
                              unselectedLabelStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                color: AppTheme.lightShimmerGrey100Color,
                              ),
                              tabs: tabs,
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                          ),
                          Expanded(
                              child: TabBarView(
                                  children: tabPages,
                                  controller: _tabController,
                              ),
                          ),
                      ],
                  ),
              ),
          ),
      );
    }
}
