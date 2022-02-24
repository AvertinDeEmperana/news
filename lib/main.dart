import 'package:flutter/material.dart';
import 'package:news/src/data/local/ObjectBox.dart';
import 'src/App.dart';

late ObjectBox objectbox;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  runApp(App());
}