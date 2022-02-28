import 'package:flutter/material.dart';
import 'package:news/src/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNewsListWidget extends StatelessWidget {
  const ShimmerNewsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: AppTheme.lightShimmerGrey200Color,
            highlightColor: AppTheme.lightShimmerGrey100Color,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                      ),
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 225,
                        height: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(children: [
                              Container(
                                width: double.infinity,
                                height: 8,
                                color: Colors.white,
                              ),
                              Container(
                                width: double.infinity,
                                height: 8,
                                color: Colors.white,
                              ),
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 20,
                                  height: 8,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 20,
                                  height: 8,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
