import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauthdemo/screens/HomePage.dart';
import 'package:firebaseauthdemo/screens/LoginPage.dart';
import 'package:firebaseauthdemo/screens/RegistrationPage.dart';
import 'package:firebaseauthdemo/screens/SplashPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'myproviders/AuthProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Widget Test',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: SplashPage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          LoginPage.routeName: (context) => LoginPage(),
          RegistrationPage.routeName: (context) => RegistrationPage(),
          SplashPage.routeName: (context) => SplashPage(),
        },
      ),
    );
  }
}
