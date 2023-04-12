import 'package:flutter/material.dart';
import 'package:scanapp/Pages/SignInScreen/SignInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/HomeScreen/HomeScreen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  late bool CheckValue;
  bool loading=true;

  getDataFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CheckValue = prefs.containsKey('spName');
    setState(() {
      loading=false;
    });
    print(CheckValue);
    // CheckValue=false;
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromSP();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9cedf),

      body: loading==true?Center(child: Container(height: 100,width: 100,child: CircularProgressIndicator())):CheckValue==true?HomeScreen():SignInScreen()
    );
  }
}
