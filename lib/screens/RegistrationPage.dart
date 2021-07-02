import 'package:firebaseauthdemo/myproviders/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'HomePage.dart';

class RegistrationPage extends StatefulWidget {
  static const routeName = '/RegistrationPage';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    super.dispose();
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(HomePage.routeName);
            },
            icon: Icon(Icons.login),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          TextField(
            controller: fnameController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Enter First Name',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
            ),
          ),
          TextField(
            controller: lnameController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Enter Last Name',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
            ),
          ),
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
          TextField(
            controller: mobileController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Enter Mobile Number',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
            ),
          ),
          ElevatedButton(
            onPressed: () {
            //  _register();
              Provider.of<AuthProvider>(context, listen: false).signUpApi(
                fnameController.text,
                lnameController.text,
                emailController.text,
                passwordController.text,
                mobileController.text, context
              );
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }


}
