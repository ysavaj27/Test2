import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseauthdemo/model/FirebaseDatabaseDemoListObj.dart';
import 'package:firebaseauthdemo/myproviders/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  List<FirebaseDatabaseDemoListObj> list = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseDatabaseDemoListObj obj1 = FirebaseDatabaseDemoListObj();
    obj1.fname = "";

    FirebaseDatabaseDemoListObj obj2 = FirebaseDatabaseDemoListObj("fname", "");


    getCurrentUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          InkWell(
            child:  Icon(Icons.logout),
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false).signOut(context);
            },
          ) ,

          InkWell(
            child:  Icon(Icons.fire_hydrant),
            onTap: () {
              //for fire store
              firestoreAdd();
            },
          )
        ],
      ),
      body: Center(
        child: Text('HomePage'),
      ),

    );
  }


  void getCurrentUserData() {
    if(FirebaseAuth.instance.currentUser != null){
      String uid = FirebaseAuth.instance.currentUser!.uid;

      final firestoreInstance = FirebaseDatabase.instance; //database reference object

      //add, edit
      // firestoreInstance.reference().child("users").child(uid)
      //     .set({ 'fname': "fname", "lname": "lname" });

      //list
      firestoreInstance.reference().child('users').once().then((DataSnapshot snapshot) {
        print('Connected to second database and read ${snapshot.value}');
        Map<String , dynamic> map = Map<String, dynamic>.from(snapshot.value) ;

        map.forEach((key, value) {
          Map<String , dynamic> mapvalue = Map<String, dynamic>.from(value) ;
          list.add(FirebaseDatabaseDemoListObj.fromJson(mapvalue));
        });

        print("list.length========== ");
        print(list.length);
      });

      //delete
      // firestoreInstance.reference().child("users").child(uid).remove();
    }
  }



  void method1(String s1){

  }

  void method1(double s1, String s2){

  }



  void firestoreAdd() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

    firestoreInstance.collection("users").doc(uid).set(
        {
          'fname': "fname", "lname": "lname"
        }).then((value){


    });
  }
}
