//import 'package:coviupdate/drawer.dart';
import 'package:coviupdate/news.dart';
import 'package:flutter/material.dart';
import 'scrolling_screen.dart';
import 'vaccinesType.dart';
import 'api.dart';
import 'displayScreen.dart';
import 'apidistrict.dart';
import 'drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Scrolling.id,
      routes: {
        Scrolling.id: (context)=> Scrolling(),
        TypeVaccines.id: (context)=>TypeVaccines(),
        News.id: (context)=>News(),
        Api.id:(context)=>Api(),
        Developer.id:(context)=>Developer(),
        ApiDistrict.id:(context)=>ApiDistrict(),
        DisplayScreen.id:(context)=>DisplayScreen(),
      },
    );
  }
}
