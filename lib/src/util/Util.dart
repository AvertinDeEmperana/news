import 'package:flutter/material.dart';

class Util{
    static ImageProvider articleImage(String? url) {
        if (url == null || url.isEmpty || url[4] != 's') {
            return const AssetImage('assets/images/default.jpg');
        } else {
            return NetworkImage(url);
        }
    }

    static String articleText(String? str) {
        if (str == null || str.isEmpty) {
          return "";
        } else {
          return str;
        }
    }
}



