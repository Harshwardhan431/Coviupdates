import 'package:flutter/material.dart';
import 'service/getRequest.dart';
import 'service/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'drawer.dart';
import 'screens/login.dart';

class MainDrawe extends StatefulWidget {
  static String id ='MainDrawe';
  const MainDrawe({Key? key}) : super(key: key);

  @override
  _MainDraweState createState() => _MainDraweState();
}

class _MainDraweState extends State<MainDrawe> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late String uid = auth.currentUser!.uid.toString();
  late String email = auth.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF1A237E),
          child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    "https://freesvg.org/img/abstract-user-flat-4.png",
                  ),
                ),
                Text('  '),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Login();
                  }));
                  // AuthenticationHelper().signOut(context);
                },
                child: Container(
                  child: Row(
                    children: [
                      Text('      '),
                      Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text('          '),
                      Container(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text('  '),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Developer.id);
                },
                child: Container(
                  //  color: Color(0xFF1A237E),
                  child: Row(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.forward,
                          size: 35,
                        ),
                      ),
                      Text(
                        'Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
