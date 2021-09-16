import 'package:flutter/material.dart';
import 'package:coviupdate/scrolling_screen.dart';
import 'package:coviupdate/screens/regrister.dart';
import 'package:coviupdate/service/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  static String id ='Login';
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool spp=false;
  late String email,password;

  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
      ),
      body: ModalProgressHUD(
        inAsyncCall: spp,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF283593),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Welcome back ! Login with your credentials",
                    style: TextStyle(
                      color: Color(0xFF283593),
                      fontSize: 15,
                      // color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey('email'),
                      validator: (value){
                        if (value!.isEmpty ){
                          return 'Incorrect email';
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
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Incorrect password';
                        }
                        return null;
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
                    SizedBox(height: 10,),
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
                  height: 50,
                  onPressed: (){
                    setState(() {
                      spp=true;
                    });
                    AuthenticationHelper().signIn(email:email,password:password).then((result){
                      if (result==null){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scrolling()));
                        setState(() {
                          spp=false;
                        });
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                        setState(() {
                          spp=false;
                        });
                      }
                    });
                  },
                  child: Text(
                    'Login',
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
                  Text('Dont have an account?',
                    style: TextStyle(

                      color: Color(0xFF283593),
                    ),),
                  SizedBox(width: 10,),
                  InkWell(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF283593),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, SignUp.id);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

