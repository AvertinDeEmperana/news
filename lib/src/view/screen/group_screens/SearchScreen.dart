import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/src/App_Theme.dart';
import 'package:news/src/Routes.gr.dart';
import 'package:news/src/view/widget/ResultSetter.dart';
import 'package:news/src/view_model/QueryNewsListVM.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin  {
  late TabController _tabController;
  late TextEditingController _controller;

  final tabs = <Tab>[
    const Tab(text: 'Sports'),
    const Tab(text: 'Technologie'),
    /*const Tab(text: 'Science'),
    const Tab(text: 'Santé '),
    const Tab(text: 'Divertissement '),*/
  ];

  final tabPages = <Widget>[
      const ResultSetter(category: "sports"),
      const ResultSetter(category: "technology"),
      /*const ResultSetter(category: "science"),
      const ResultSetter(category: "health"),
      const ResultSetter(category: "entertainment"),*/
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      Size dSize = MediaQuery.of(context).size;
      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Padding(
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
                                    controller: _controller,
                                    onSubmitted: (String value) {
                                      search(value);
                                    },
                                    cursorColor: Theme.of(context).colorScheme.secondary,
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(fontSize:16),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Recherche...',
                                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize:16, fontWeight: FontWeight.w400),
                                        prefixIcon: Icon(Icons.search,size: 20,color: Theme.of(context).colorScheme.secondary,)
                                    ),
                                  ),
                                ),
                            ]),
                        ),
                        TabBar(
                            indicatorWeight: 3,
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
                            tabs: <Widget>[
                                SizedBox(
                                  width: dSize.width / tabs.length,
                                  child: Center(
                                      child: tabs[0],
                                  ),
                                ),SizedBox(
                                  width: dSize.width / tabs.length,
                                  child: Center(
                                      child: tabs[1],
                                  ),
                                ),
                            ],
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
      );
    }

  Future<void> search(String keyword) async {
    if(keyword.isEmpty){
        return;
    }
    context.router.push(SearchResultScreenRoute(keyword: keyword));
  }
}