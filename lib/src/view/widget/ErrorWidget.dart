import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String errorText;
  const ErrorWidget({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/default.jpg'),
          Text(errorText, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
