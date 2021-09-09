import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'apidistrict.dart';
import 'api.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:intl/intl.dart';


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
//mm-dd-yyyy
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
      hospital.clear();
      pincode.clear();
      capacity.clear();
      vaccine.clear();
      fee.clear();
      minage.clear();
      print("At middle");
      // print(dispkkkl[0]['state_name']);
      for (int i = 0; i < dispkkkl.length; i++) {
        print("START OF FOR");
        hospital.add(dispkkkl[i]['name'].toString());
        // print("infor");
        pincode.add(dispkkkl[i]['pincode']);
        capacity.add(dispkkkl[i]['available_capacity']);
        vaccine.add(dispkkkl[i]['vaccine'].toString());
        minage.add(dispkkkl[i]['min_age_limit']);
        fee.add(dispkkkl[i]['fee'].toString());
        print("in for loop");
      }
      print("out of for");
      // print(hospital);
    } else {
      print('errrrrrrr');
    }
    print("At end of get slots");
    return 1;
  }

  /*void date(){
     final DateTime now = DateTime.now();//mm-dd-yyyy
     final DateFormat formatter = DateFormat('MM-dd-yyyy');
    final String formatted = formatter.format(now);
    print(formatted);
  }*/
//2013-04-20
  @override
  void initState() {
    super.initState();
    //date();
    // getSlotAval();
  }

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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                              child: TypewriterAnimatedTextKit(
                                text: [tempStateName],
                                textStyle: TextStyle(
                                  color: Color(0xFF283593),
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: TypewriterAnimatedTextKit(
                              text: [tempdistrictname],
                              textStyle: TextStyle(
                                color: Color(0xFF283593),
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // height: 150,
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 6,
                            blurRadius: 15,
                            offset: Offset(0, 3),
                          )
                        ],
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
                    child: Container(
                      child: ListView.builder(
                        itemCount: dispkkkl.length,
                          itemBuilder: (BuildContext context,int index){
                        return FinalDiaplay(
                          hospitalname1: hospital[index],
                          pincode1: pincode[index],
                          capacity1: capacity[index],
                          vaccine1: vaccine[index],
                          fee1: fee[index],
                          minAgelimit1: minage[index],
                        );
                      }),
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
          children: <Widget>[
            Text(
              'Hospital Name --> $hospitalname1',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15,),
            Text('PINCIDE --> $pincode1'),
            SizedBox(height: 15,),
            Text('Capacity --> $capacity1'),
            SizedBox(height: 15,),
            Text('Vaccine --> $vaccine1'),
            SizedBox(height: 15,),
            Text('Fee --> $fee1'),
            SizedBox(height: 15,),
            Text('Min Age Limit --> $minAgelimit1'),
          ],
        ),
      ),
      height: 250,
      width: double.infinity,
    );
  }
}

