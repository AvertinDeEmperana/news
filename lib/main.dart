import 'package:flutter/material.dart';
import 'package:news/src/data/local/object_box.dart';
import 'src/app.dart';

late ObjectBox objectbox;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  runApp(App());
}