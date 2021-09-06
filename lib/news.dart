import 'package:flutter/material.dart';

class News extends StatefulWidget {
  static String id='News';
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.black12,
          height: 500,
          width: double.infinity,
        ),
      ),
    );
  }
}
