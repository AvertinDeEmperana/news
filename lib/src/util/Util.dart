import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util{
    static ImageProvider articleImage(String? url) {
        if (url == null || url.isEmpty || url[4] != 's') {
            return const AssetImage('assets/images/default.jpg');
        } else {
            return CachedNetworkImageProvider(
                url,
                errorListener: ()=> const AssetImage('assets/images/default.jpg'));
        }
    }

    static String articleText(String? str) {
        if (str == null || str.isEmpty) {
          return "";
        } else {
          return str;
        }
    }

    static  void allLoadedToast() {
        Fluttertoast.showToast(
            msg: "Tous les articles ont été chargé",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0
        );
    }
}



