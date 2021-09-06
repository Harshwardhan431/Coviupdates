import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'upiconstants.dart';
import 'apidistrict.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const urlState = "https://cdn-api.co-vin.in/api/v2/admin/location/states";
String selected = 'Andaman and Nicobar Islands';
int statekeypin=0;
late String tempStateName;

class Api extends StatefulWidget {
  static String id='Api';
  const Api({Key? key}) : super(key: key);

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  void getState() async {
    var u = Uri.parse(urlState);
    http.Response response = await http.get(u);
    print(response);
  }

  List<DropdownMenuItem<String>> getDropDownState(){
    List<DropdownMenuItem<String>> dropdownIteims=[];
    for(int i=0;i<stateListText.length;i++){
      String currentatate=stateListText[i];
      var newIteim=DropdownMenuItem(child: Text(currentatate),value: currentatate,);
      dropdownIteims.add(newIteim);
    }
    return dropdownIteims;
  }

  @override
  void initState() {
    SpinKitDoubleBounce(
      color: Colors.white,
      size: 100,
    );
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
                  'Slot Avaliability',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF283593),
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
                        'Select State',
                        style: TextStyle(
                          color: Color(0xFF0D47A1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // margin: EdgeInsets.all(20),
                      padding: EdgeInsets.fromLTRB(20, 30, 30, 0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: DropdownButton<String>(
                        value: selected,
                        items: getDropDownState(),
                        onChanged: (value) {
                          for(int i=1;i<38;i++){
                            if (value==mapState[i]){statekeypin=i;break;}}
                          selected = value.toString();
                          tempStateName=selected;
                        Navigator.pushNamed(context, ApiDistrict.id);
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
            height: 10,
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
          ))
        ],
      ),
    );
  }
}

