import 'package:firebaseauthdemo/myproviders/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).LoginWithEmailAndPassword(context, emailController.text, passwordController.text);
            },
            icon: Icon(Icons.login),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Enter Email Address',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
            ),
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: 'Enter Your Password',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
            ),
          ),

          TextButton(
            child: Text('Go to RegistrationPage'),
            onPressed: () =>
                Navigator.of(context).pushNamed(RegistrationPage.routeName),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
   }
}
