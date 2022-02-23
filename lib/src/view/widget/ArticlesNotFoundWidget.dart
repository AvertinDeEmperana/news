import 'package:flutter/material.dart';

class ArticlesNotFoundWidget extends StatelessWidget {
    final String errorText;
    const ArticlesNotFoundWidget({Key? key, required this.errorText}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Image.asset('assets/images/empty-news-list.png'),
                        Center(
                            child: Text(errorText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        )
                    ],
                ),
            ),
        );
    }
}
