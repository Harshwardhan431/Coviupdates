//import 'package:coviupdate/drawer.dart';
import 'package:coviupdate/news.dart';
import 'package:flutter/material.dart';
import 'scrolling_screen.dart';
import 'vaccinesType.dart';
import 'api.dart';
import 'displayScreen.dart';
import 'apidistrict.dart';
import 'drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coviupdate/screens/login.dart';
import 'package:coviupdate/screens/regrister.dart';
import 'drawermain.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future isLoggedIn()async{
  FirebaseAuth.instance.currentUser!;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.id,
      routes: {
        SignUp.id: (context)=>SignUp(),
        Login.id: (context)=>Login(),
        Scrolling.id: (context)=> Scrolling(),
        TypeVaccines.id: (context)=>TypeVaccines(),
        News.id: (context)=>News(),
        Api.id:(context)=>Api(),
        Developer.id:(context)=>Developer(),
        ApiDistrict.id:(context)=>ApiDistrict(),
        DisplayScreen.id:(context)=>DisplayScreen(),
        MainDrawe.id:(context)=>MainDrawe(),
      },
    );
  }
}

