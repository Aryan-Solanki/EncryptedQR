import 'package:flutter/material.dart';

import '../../Components/no_account_text.dart';
import '../../constants.dart';
import 'SignForm.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (30)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: (27),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Register in with your details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: (15),
                ),
              ),
              SizedBox(height: 50),
              SignForm(),
              SizedBox(height: 50),
              NoAccountText(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
