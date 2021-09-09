import 'package:coviupdate/api.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'displayScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'vaccinesType.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'drawer.dart';

const colorizeColors = [
  Color(0xFF283593),
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Horizon',
);

String regristration = "https://selfregistration.cowin.gov.in/";

Future<void> _launchedInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'});
  } else {
    throw 'Could not launch $url';
  }
}

class Scrolling extends StatefulWidget {
  static String id = 'Scrolling';
  const Scrolling({Key? key}) : super(key: key);

  @override
  _ScrollingState createState() => _ScrollingState();
}

class _ScrollingState extends State<Scrolling>
    with SingleTickerProviderStateMixin {
  late final Animation animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    controller.forward();
    animation = ColorTween(begin: Color(0xFF01579B), end: Color(0xFFB3E5FC))
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Developer.id);
                },
                child: Container(
                  color: Color(0xFF1A237E),
                  child: Row(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.forward,
                          size: 40,
                        ),
                      ),
                      Text(
                        'Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  color: Color(0xFF1A237E),
                )),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF4FC3F7),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          "Covi-Update's",
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CarouselSlider(
                      items: [
                        Image.asset("images/doc1.jpg"),
                        Image.asset("images/doc2.jpg"),
                        // Image.asset("images/doc3.jpg"),
                        Image.asset("images/doc4.jpg"),
                        //Image.asset("images/doc5.jpg"),
                        Image.asset("images/doc6.jpg"),
                        Image.asset("images/doc7.jpg"),
                        Image.asset("images/doc8.jpg"),
                        Image.asset("images/doc9.jpg"),
                        Image.asset("images/doc10.jpg"),
                      ],
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                      )),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFF4FC3F7),
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
          )),
          //-----------------------------------------------------
          Expanded(
              child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Divider(
                  color: Color(0xFF42A5F5),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        // elevation: 10,
                        onTap: () {
                          Navigator.pushNamed(context, TypeVaccines.id);
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Vaccine Types',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Color(0xFF0D47A1),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 6,
                                blurRadius: 15,
                                offset: Offset(0, 3),
                              )
                            ],
                            color: Color(0xFF80D8FF),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.all(30.0),
                          height: 120.0,
                          width: double.infinity,
                        ),
                      ),
                      GestureDetector(
                        //elevation: 10,
                        onTap: () {
                          Navigator.pushNamed(context, Api.id);
                        },
                        child: Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Slot Avaliability',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF01579B),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 6,
                                blurRadius: 15,
                                offset: Offset(0, 3),
                              )
                            ],
                            color: Color(0xFF80D8FF),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.all(30.0),
                          height: 120.0,
                          width: double.infinity,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchedInBrowser(regristration);
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Regristration',
                              style: TextStyle(
                                color: Color(0xFF01579B),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 6,
                                blurRadius: 15,
                                offset: Offset(0, 3),
                              )
                            ],
                            color: Color(0xFF80D8FF),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.all(30.0),
                          height: 120.0,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
