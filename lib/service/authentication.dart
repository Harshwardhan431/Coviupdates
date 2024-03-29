import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coviupdate/screens/login.dart';

class AuthenticationHelper{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  get user=>_auth.currentUser;


  //SIGN UP METHOD
  Future signUp({required String email,required String password})async{
    try{
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      return null;
    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email,required String password})async{
    try{
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    }on FirebaseAuthException catch (e){
      return e.message;
    }
/*
    Future signOut(context) async {
      await _auth.signOut();
      print('signout');
      Navigator.pushNamed(context, Login.id);
    }
*/

  }
}