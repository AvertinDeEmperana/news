import 'package:flutter/material.dart';

import '../../../view_model/NewsListVM.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int itemCount = 2;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Colors.yellow,
      color: Colors.red,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 1500));
        setState(() {
          itemCount = itemCount + 1;
        });
      },
      child: Scaffold(
        backgroundColor: const Color(0xff246df8),
        appBar: AppBar(
          title: const Text('Refresh Indicator'),
          backgroundColor: const Color(0xff246df8),
        ),
        body: _buildCardDesign(),
      ),
    );
  }

  Widget _buildCardDesign() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: itemCount,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return _buildCardView();
          }),
    );
  }

  Widget _buildCardView() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          //color: Colors.pinkAccent,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "https://s1.1zoom.me/big0/716/Brunette_girl_Hair_Glance_Model_Colored_background_593058_1365x1024.jpg",
                  height: 60.0,
                  width: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
              //SizedBox(width: 20,),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Neelu Modanwal",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: const Text(
                        "Your opinion matters!",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: const Text(
                        "Dev, do you have a moment?We'd love",
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Text(
                    "4:15 AM",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    // height: 20,
                    // width: 20,
                    margin: EdgeInsets.only(left: 10),
                    //color: Colors.pinkAccent,
                    child: const Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
