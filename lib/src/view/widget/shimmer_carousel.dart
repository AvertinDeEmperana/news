import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../app_theme.dart';

class ShimmerCarousel extends StatelessWidget {
  const ShimmerCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, realIdx) {
        return Shimmer.fromColors(
          baseColor: AppTheme.lightShimmerGrey200Color,
          highlightColor: AppTheme.lightShimmerGrey100Color,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 300,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 33,
                color: const Color(0xFFD3D3D3).withOpacity(.84),
              )
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  height: 150,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        height: 8,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        height: 8,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 15,
                          height: 8,
                          color: Colors.white,
                        ),
                      ]),
                      Container(
                        width: 15,
                        height: 8,
                        color: Colors.white,
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
        height: 280,
        aspectRatio: 16 / 9,
        autoPlay: false,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1900),
        viewportFraction: 0.8,
      ),
    );
  }
}
