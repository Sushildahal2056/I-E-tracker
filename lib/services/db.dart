import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Db{
  CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser(data, context) async {
  final userID = FirebaseFirestore.instance.currentUser!.uid;
  await users
    .doc(userID)
    .set(data)
    .then((value) => print("User Added"))
    .catchError((error) {
      showDialog(
     context: context,
     builder: (context){
           return AlertDialog(
              title: Text("Sign up Failed"),
              content: Text(error.toString()),
           );
     }
  );
    });
}
}