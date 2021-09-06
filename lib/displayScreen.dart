import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'apidistrict.dart';
import 'api.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

late var hospitalname1 = '';
late var hospitalname2 = '';
late var pincode2 = 0;
late var pincode1 = 0;
late var capacity1 = 0;
late var capacity2 = 0;
late var vaccine1 = '';
late var vaccine2 = '';
late var fee1 = '';
late var fee2 = '';
late var minAgelimit1 = 0;
late var minAgelimit2 = 0;

const printeddetail = TextStyle(
  color: Colors.red,
  fontSize: 100,
  fontWeight: FontWeight.w600,
);

const urlslotaval =
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id";
String date = "31-03-2021";

class DisplayScreen extends StatefulWidget {
  static String id = 'DisplayScreen';
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

//$urlslotaval=$districtpinkey&date=$date
class _DisplayScreenState extends State<DisplayScreen> {
  Future getSlotAval() async {
    var h = Uri.parse('$urlslotaval=$districtpinkey&date=$date');
    http.Response response = await http.get(h);
    if (response.statusCode == 200) {
      var data = response.body;
      hospitalname1 = convert.jsonDecode(data)['sessions'][0]['name'];
      pincode1 = convert.jsonDecode(data)['sessions'][0]['pincode'];
      capacity1 = convert.jsonDecode(data)['sessions'][0]['available_capacity'];
      vaccine1 = convert.jsonDecode(data)['sessions'][0]['vaccine'];
      fee1 = convert.jsonDecode(data)['sessions'][0]['fee'];
      minAgelimit1 = convert.jsonDecode(data)['sessions'][0]['min_age_limit'];

      hospitalname2 = convert.jsonDecode(data)['sessions'][1]['name'];
      pincode2 = convert.jsonDecode(data)['sessions'][1]['pincode'];
      capacity2 = convert.jsonDecode(data)['sessions'][1]['available_capacity'];
      vaccine2 = convert.jsonDecode(data)['sessions'][1]['vaccine'];
      fee2 = convert.jsonDecode(data)['sessions'][1]['fee'];
      minAgelimit2 = convert.jsonDecode(data)['sessions'][1]['min_age_limit'];

      // print('abbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb         $minAgelimit1');
    } else {
      print('errrrrrrr');
    }
  }

  @override
  void initState() {
    super.initState();
    getSlotAval();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1, //----------------------------------
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TypewriterAnimatedTextKit(
                       // 'j.',
                        text: [tempStateName],
                        textStyle: TextStyle(
                          color: Color(0xFF283593),
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TypewriterAnimatedTextKit(
                        //'hi',
                        text: [tempdistrictname],
                        textStyle: TextStyle(
                          color: Color(0xFF283593),
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  // height: 150,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF4FC3F7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(
                  color: Color(0xFF42A5F5),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){},
                        //flex: 2,
                        //--------------------------------------------2
                        child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF80D8FF),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 6,
                                blurRadius: 15,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Text>[
                                Text(
                                  'Hospital Name --> $hospitalname1',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text('PINCIDE --> $pincode1'),
                                Text('Capacity --> $capacity1'),
                                Text('Vaccine --> $vaccine1'),
                                Text('Fee --> $fee1'),
                                Text('Min Age Limit --> $minAgelimit1'),
                              ],
                            ),
                          ),
                          width: double.infinity,
                        ),
                      ),
                      GestureDetector(onTap: (){},
                        //--------------------------------------------3
                        //flex: 2,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 6,
                                blurRadius: 15,
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF80D8FF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: <Text>[
                                Text('Hospital Name --> $hospitalname2'),
                                Text('PINCIDE --> $pincode2'),
                                Text('Capacity --> $capacity2'),
                                Text('Vaccine --> $vaccine2'),
                                Text('Fee --> $fee2'),
                                Text('Min Age Limit --> $minAgelimit2'),
                              ],
                            ),
                          ),
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
