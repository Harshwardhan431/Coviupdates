import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'news.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'constants_vaccineType.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//Future<void> _launched;
String _covishieldURL =
    "https://www.seruminstitute.com/pdf/covishield_fact_sheet.pdf";
String _covaxinURL =
    "https://www.bharatbiotech.com/images/covaxin/covaxin-factsheet2.pdf";
String _sputnikVURL =
    "https://www.precisionvaccinations.com/vaccines/sputnik-v-vaccine#:~:text=The%20Russian%20COVID%2D19%20vaccine,and%20stimulate%20an%20immune%20response.";

double angleCovixn=0;
double angleCovishield=0;
double angleSpuritik=0;
bool togglecovishield = false;
bool togglecovaxin = false;
bool togglesputnik = false;


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

class TypeVaccines extends StatefulWidget {
  static String id = 'TypeVaccines';
  const TypeVaccines({Key? key}) : super(key: key);

  @override
  _TypeVaccinesState createState() => _TypeVaccinesState();
}

class _TypeVaccinesState extends State<TypeVaccines> {

  void flipCoviaxin(){
    setState(() {
      angleCovixn=(angleCovixn + pi)%(2*pi);
    });
  }
  void flipCovishield(){
    setState(() {
      angleCovishield=(angleCovishield + pi)%(2*pi);
    });
  }
  void flipSpurtink(){
    setState(() {
      angleSpuritik=(angleSpuritik + pi)%(2*pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: TypewriterAnimatedTextKit(
                    text: ['Vaccine Types'],
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF283593),
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF4FC3F7),
              ),
              width: double.infinity,
              height: 60,
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      flipCovishield();
                    },
                    child: CovishieldToggle(angle: angleCovishield,),
                  ),
                  GestureDetector(
                      onTap: (){
                        flipCoviaxin();
                      },
                      child: CoviaxinToggle(angle: angleCovixn)),
                  GestureDetector(
                    onTap: (){
                      flipSpurtink();
                    },
                    child: SprutikToggle(angle: angleSpuritik,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SprutikToggle extends StatelessWidget {

  double angle=0;
  SprutikToggle({required this.angle});


  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(tween: Tween<double>(begin: 0,end: angle),
        duration: Duration(seconds: 1),
        builder: (BuildContext context,double val3,__){
          if (val3>=pi/2){
            togglesputnik=true;
          }
          else{
            togglesputnik=false;
          }
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(2, 2, 0.001)
              ..rotateY(val3),
            child: Container(
              decoration: BoxDecoration(
              ),
              child: togglesputnik
                  ? VaccineTypeButton(
                onPress: () {
                  _launchedInBrowser(_sputnikVURL);
                },
                theory:
                'ǝɿom wonʞ oɈ qɒT',
                nameVaccine: 'V_ꓘIИTUꟼƧ',
              )
                  : VaccineImageFront(i: 'images/sprutink2.webp'),
            ),
          );
        });
  }
}

class CovishieldToggle extends StatelessWidget {
  late final angle;
  CovishieldToggle({required this.angle});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(tween: Tween<double>(begin: 0,end: angle),
        duration: Duration(seconds: 1),
        builder: (BuildContext context,double val1,__){
          if (val1>=pi/2){
            togglecovishield=true;
          }
          else{
            togglecovishield=false;
          }
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(2, 2, 0.001)
              ..rotateY(val1),

            child: Container(
              child: togglecovishield
                  ? VaccineTypeButton(
                onPress: () {
                  _launchedInBrowser(_covishieldURL);
                },
                theory: 'ǝɿom wonʞ oɈ qɒT',
                nameVaccine: 'ꓷ⅃ƎIHƧIVOƆ',
              )
                  : VaccineImageFront(
                i: 'images/covishield2.webp',
              ),
            ),
          );
        });
  }
}

class CoviaxinToggle extends StatelessWidget {

  late final double angle;

  CoviaxinToggle({required this.angle});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(tween: Tween<double>(begin: 0,end: angle),
        duration: Duration(seconds: 1),
        builder: (BuildContext context,double val,__){
          if (val>=(pi/2)){
            togglecovaxin=true;
          }
          else{
            togglecovaxin=false;
          }
          return (
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(2, 2, 0.001)
                  ..rotateY(val),
                child: Container(
                  child: togglecovaxin
                      ? VaccineTypeButton(
                    onPress: () {
                      _launchedInBrowser(_covaxinURL);
                    },
                    theory: 'ǝɿom wonʞ oɈ qɒT',
                    nameVaccine: 'ИIXAVOƆ',
                  )
                      : VaccineImageFront(i: 'images/covaxin2.webp'),
                ),
              )
          );
        });
  }
}
