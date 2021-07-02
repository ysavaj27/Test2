
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseauthdemo/screens/HomePage.dart';
import 'package:firebaseauthdemo/screens/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ImgFontColorString.dart';

class AuthProvider extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpApi(String fname, String lname, String emaill, String passwordd, String text5, BuildContext context) async {
   try{
     UserCredential response =  await _auth.createUserWithEmailAndPassword(
       email: emaill,
       password: passwordd,
     );

     if(response != null && response.user != null){
       String uidd = response.user!.uid;

       // final databaseRef = FirebaseDatabase.instance.reference(); //database reference object
       // databaseRef.child('users').push().set({'uidd': uidd, 'fname': fname, "lname": lname ,"email": emaill});

       final firestoreInstance = FirebaseDatabase.instance; //database reference object
        firestoreInstance.reference().child("users").child(uidd)
           .set({ 'fname': fname, "lname": lname ,"email": emaill});

       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setBool(ImgFontColorString.ISLOGIN, true);

       Navigator.of(context).pushReplacementNamed(HomePage.routeName);
       print(response);
     }


   } catch(err){
     print(err);
   }


  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ImgFontColorString.ISLOGIN, false);

    Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
  }

  Future<void> LoginWithEmailAndPassword(BuildContext context, String email, String pswd) async {
    UserCredential response   = (await _auth.signInWithEmailAndPassword(
        email:  email,
        password: pswd,
      ));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ImgFontColorString.ISLOGIN, true);

    // response.user.email;
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);

  }

}