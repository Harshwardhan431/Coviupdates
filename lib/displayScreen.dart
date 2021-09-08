import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'apidistrict.dart';
import 'api.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

var dispkkkl;
var hospital = [];
var pincode = [];
var capacity = [];
var vaccine = [];
var fee = [];
var minage = [];

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

class _DisplayScreenState extends State<DisplayScreen> {
  Future getSlotAval() async {
    var h = Uri.parse('$urlslotaval=$districtpinkey&date=$date');
    http.Response response = await http.get(h);
    if (response.statusCode == 200) {
      var data = response.body;
      dispkkkl = convert.jsonDecode(data)['sessions'];
      print(dispkkkl.length);
      print(data);
      hospital.clear();
      pincode.clear();
      capacity.clear();
      vaccine.clear();
      fee.clear();
      minage.clear();
      for (int i = 0; i < dispkkkl.length; i++) {
        hospital[i] = dispkkkl[i]['state_name'].toString();
        pincode[i] = dispkkkl[i]['pincode'];
        capacity[i] = dispkkkl[i]['available_capacity'];
        vaccine[i] = dispkkkl[i]['vaccine'].toString();
        minage[i] = dispkkkl[i]['min_age_limit'];
        fee[i] = dispkkkl[i]['fee'].toString();
      }
      print(hospital);
    } else {
      print('errrrrrrr');
    }
    return 1;
  }
/*
  @override
  void initState() {
    super.initState();
    getSlotAval();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      body: FutureBuilder(
        future: getSlotAval(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 1, //----------------------------------
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          TypewriterAnimatedTextKit(
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
                        children: [
                          FinalDiaplay(
                            hospitalname1: hospital[0],
                            pincode1: pincode[0],
                            capacity1: capacity[0],
                            vaccine1: vaccine[0],
                            fee1: fee[0],
                            minAgelimit1: minage[0],
                          ),
                          FinalDiaplay(
                            hospitalname1: hospital[1],
                            pincode1: pincode[1],
                            capacity1: capacity[1],
                            vaccine1: vaccine[1],
                            fee1: fee[1],
                            minAgelimit1: minage[1],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class FinalDiaplay extends StatelessWidget {
  var hospitalname1;
  var pincode1;
  var capacity1;
  var vaccine1;
  var fee1;
  var minAgelimit1;

  FinalDiaplay(
      {required this.hospitalname1,
      required this.pincode1,
      required this.capacity1,
      required this.vaccine1,
      required this.fee1,
      required this.minAgelimit1});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
