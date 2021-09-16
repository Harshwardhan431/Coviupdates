import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetData{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  get user=> _auth.currentUser;

  Future getUserData()async{
    final CollectionReference usercollection=
        FirebaseFirestore.instance.collection('User');
    FirebaseAuth auth= FirebaseAuth.instance;
    String uid=auth.currentUser!.uid.toString();
    return usercollection
    .doc(uid)
    .get()
    .then((value) => print('user Details Added'))
    .catchError((error)=> print('Failed to add user: $error'));
  }
}