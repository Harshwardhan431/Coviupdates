import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const insta="https://www.instagram.com/";
const linkedin="https://www.linkedin.com/in/harshwardhan-atkare-49a9961bb/";
const mail="https://mail.google.com/mail/u/0/?fs=1&to=atkareharsh@gmail.com&tf=cm";

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

class Developer extends StatefulWidget {
  static String id="Developer";
  const Developer({Key? key}) : super(key: key);

  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A237E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A237E),
        title: Text(
          "Developer",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/harsh.JPG.JPG'),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Harshwardhan Atkare',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xFF283593),
                        ),),
                      SizedBox(height: 10,),
                      Text('PICT , Pune',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF9E9E9E)
                        ),),
                      SizedBox(height: 10,),
                      Text('SE - 01 ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF9E9E9E)
                        ),),
                      SizedBox(height: 10,),
                      Text('App Developer ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF9E9E9E)
                        ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(onPressed: (){
                        _launchedInBrowser(insta);
                      }, icon: FaIcon(FontAwesomeIcons.instagram)),
                     RawMaterialButton(onPressed: (){
                       _launchedInBrowser(mail);
                     },
                       child: Icon(
                         Icons.email,
                       ),
                     ),
                      IconButton(onPressed: (){
                        _launchedInBrowser(linkedin);
                      }, icon: FaIcon(FontAwesomeIcons.linkedin)),
                    ],
                  )
                ],
              ),
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
