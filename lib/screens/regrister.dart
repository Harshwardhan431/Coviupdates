import 'package:flutter/material.dart';
import 'package:coviupdate/scrolling_screen.dart';
import 'package:coviupdate/service/authentication.dart';
import 'package:coviupdate/screens/login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUp extends StatefulWidget {
  static String id ='SignUp';
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool spinnerReg=false;
  late String email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
      ),
      body: ModalProgressHUD(
    inAsyncCall: spinnerReg,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Sign up',
                  style: TextStyle(
                    color: Color(0xFF283593),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(height: 20,),
                Text('Create an Account',
                  style: TextStyle(
                    color: Color(0xFF283593),
                    fontSize: 20,
                  ),),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: ValueKey('email'),
                        validator: (value){
                          if (value!.isEmpty){
                            return 'Incorrect Email';
                          }
                          return null;
                        },
                        onChanged: (value){
                          email=value;
                        },
                        onSaved: (value){
                          email=value!;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              borderSide: new BorderSide()),
                          labelText: "Enter  Email",
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        obscureText: true,
                        key: ValueKey('password'),
                        validator: (value){
                          password=value!;
                        },
                        onChanged: (value){
                          password=value;
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              borderSide: new BorderSide()),
                          labelText: "Enter password",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF00B0FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      setState(() {
                        spinnerReg=true;
                      });
                      FocusScope.of(context).unfocus();
                      AuthenticationHelper().signUp(email:email,password:password).then((result){
                        if (result==null){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Scrolling()));
                          setState(() {
                            spinnerReg=false;
                          });
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                result,
                                style: TextStyle(fontSize: 16),
                              )
                          ));
                          setState(() {
                            spinnerReg=false;
                          });
                        }
                      });
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF283593),
                        fontWeight: FontWeight.w600,
                        fontSize: 29,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account ?',
                      style: TextStyle(
                        color: Color(0xFF283593),
                      ),),
                    SizedBox(width: 10,),
                    InkWell(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF283593),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, Login.id);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

