import 'package:flutter/cupertino.dart';
import 'api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'displayScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const urlDistrict = "https://cdn-api.co-vin.in/api/v2/admin/location/districts";
List<String> districtnameList = [];
//var mapNameID = new Map();
Map<String,int> mapNameID={};
List<int> districtIDList = [];
var districtpinkey ;
late String tempdistrictname;
late String selectedDistrict = districtnameList[0];

class ApiDistrict extends StatefulWidget {
  static String id = 'Apidistrict';
  const ApiDistrict({Key? key}) : super(key: key);

  @override
  _ApiDistrictState createState() => _ApiDistrictState();
}

class _ApiDistrictState extends State<ApiDistrict> {
  var dataDistric;
  // ignore: non_constant_identifier_names
  Future MakeList() async {
    var d = Uri.parse('$urlDistrict/$statekeypin');
    http.Response response = await http.get(d);
    if (response.statusCode == 200) {
      var data = response.body;
      dataDistric = convert.jsonDecode(data)['districts'];
      print(dataDistric.length);
      districtnameList.clear();
      districtIDList.clear();
      mapNameID.clear();
      for (int i = 0; i < dataDistric.length; i++) {
        var name = dataDistric[i]['district_name'].toString();
        var idDistrict = dataDistric[i]['district_id'];
        districtnameList.add(name);
        districtIDList.add(idDistrict);
        mapNameID[districtnameList[i]]=districtIDList[i];
       // print(mapNameID[districtnameList[i]]);
      //  mapNameID[districtIDList[i]] = districtnameList[i];
      }//districts[1].district_name districts[1].district_id
      print(districtnameList);
      print(districtIDList);
      print(mapNameID);
    }
    print("Process Over");
    return 1;
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
    // MakeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      body: FutureBuilder(
        future: MakeList(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
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
                            child: Column(
                              children: [
                                Center(
                                  child: DropdownButton<String>(
                                    value: districtnameList[0],
                                    items: getDropDownListDistricts(),
                                    //-----------------------------------------
                                    onChanged: (value) {
                                      /*for (int i = 0;
                                      i < dataDistric.length;
                                      i++) {
                                        if (value == mapNameID[i]) {
                                          var k=districtnameList[i].toString();
                                          districtpinkey=mapNameID[k];
                                          break;
                                        }
                                      }*/
                                      selectedDistrict = value.toString();
                                      tempdistrictname = selectedDistrict;
                                      districtpinkey=mapNameID["$tempdistrictname"];
                                      print(districtpinkey);
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                  ),

                                ),
                              ],
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
                      width: double.infinity,
                      child: GestureDetector(
                        child: Center(
                          child: Text("SUBMIT",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        onTap: () {
                          setState(() {
                            print('district pin key $districtpinkey');
                          });
                          Navigator.pushNamed(
                              context, DisplayScreen.id);
                        },
                      ),
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