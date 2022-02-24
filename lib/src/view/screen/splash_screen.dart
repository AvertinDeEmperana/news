import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

import '../../routes.gr.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 300,
              height: 100,
              child: Lottie.asset('assets/splashanime.json'),
            ),
            const Text(
              'your news app',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }

  startTime() {
    Duration dur = const Duration(milliseconds: 3500);
    return Timer(dur, showNewsListPage);
  }

  showNewsListPage() {
    context.router.replace(GroupScreenRoute(id: '1'));
  }
}
