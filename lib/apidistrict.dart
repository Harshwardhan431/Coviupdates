import 'api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'displayScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const urlDistrict = "https://cdn-api.co-vin.in/api/v2/admin/location/districts";
List<String> districtnameList = [];
var mapNameID = new Map();
List<int> districtIDList = [];
var districtpinkey = 0;
late String tempdistrictname;
late String selectedDistrict = districtnameList[0];

class ApiDistrict extends StatefulWidget {
  static String id = 'Apidistrict';
  const ApiDistrict({Key? key}) : super(key: key);

  @override
  _ApiDistrictState createState() => _ApiDistrictState();
}

class _ApiDistrictState extends State<ApiDistrict> {
  void MakeList() async {
    var d = Uri.parse('$urlDistrict/$statekeypin');
    http.Response response = await http.get(d);

    if (response.statusCode == 200) {
      var data = response.body;
      //length----------------------
      for (int i = 0; i <= 34; i++) {
        var name = convert.jsonDecode(data)['districts'][i]['district_name'];
        var idDistrict =
            convert.jsonDecode(data)['districts'][i]['district_id'];
        districtnameList.add(name);
        districtIDList.add(idDistrict);
        mapNameID[districtIDList[i]] = districtnameList;
      }
    } else {
      SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      );
    }
    //return districtIDList;
  }

  List<DropdownMenuItem<String>> getDropDownListDistricts() {
    List<DropdownMenuItem<String>> dropdownItiemsDistricts = [];
    for (int i = 0; i < districtnameList.length; i++) {
      String currentdistrict = districtnameList[i];
      var neItiem = DropdownMenuItem(
        child: Text(currentdistrict),
        value: currentdistrict,
      );
      dropdownItiemsDistricts.add(neItiem);
    }
    return dropdownItiemsDistricts;
  }

  @override
  void initState() {
    SpinKitDoubleBounce(
      color: Colors.white,
      size: 100,
    );
    MakeList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 60, 0, 0),
                child: Text(
                  tempStateName,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF283593),
                  ),
                ),
              ),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(40),
                color: Color(0xFF4FC3F7),
              ),
              height: 100,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(
                        'Select Distict',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // margin: EdgeInsets.all(20),
                      padding: EdgeInsets.fromLTRB(20, 30, 30, 0),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: DropdownButton<String>(
                        value: districtnameList[0],
                        items: getDropDownListDistricts(),
                        onChanged: (value) {
                          setState(() {
                            //length-------------------------------
                            for (int i = 0; i < 34; i++) {
                              if (value == mapNameID[i]) {
                                districtpinkey = mapNameID[i].keys;
                                break;
                              }
                            }
                            selectedDistrict = value.toString();
                            tempdistrictname = selectedDistrict;
                            Navigator.pushNamed(context, DisplayScreen.id);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF80D8FF),
              ),
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(25),
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF4FC3F7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 6,
                    blurRadius: 15,
                    offset: Offset(0, 3),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
