import 'package:firebaseauthdemo/ImgFontColorString.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';
import 'LoginPage.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/SplashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLogin = prefs.getBool(ImgFontColorString.ISLOGIN);

      if (isLogin != null && isLogin == true) {
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Center(
      child: Text(
        'SplashScreen',
        style: TextStyle(fontSize: 20),
      ),
    ),);
  }
}

