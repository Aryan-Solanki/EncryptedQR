import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:scanapp/Pages/QrScanner/QrScanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/encrypt.dart';
import '../../constants.dart';
import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool loading=true;
  late String name;
  late String email;
  late String contact;

  String encriptedString="";

  final RoundedLoadingButtonController _btnController =
  RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
  RoundedLoadingButtonController();




  getDataFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('spName')!;
    email = prefs.getString('spEmail')!;
    contact = prefs.getString('spContact')!;

    setState(() {
      loading=false;

    });

    encriptedString=encrypt(".#.#."+name+","+contact+","+email);
    print(decrypt(encriptedString));
    // CheckValue=false;
  }

  removeDataFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("spName");
    prefs.remove("spEmail");
    prefs.remove("spContact");
    // CheckValue=false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromSP();

  }



  @override
  Widget build(BuildContext context) {

    return loading==true?Center(child: Container(height: 100,width: 100,child: CircularProgressIndicator())):SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff9cedf),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: (20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),

                Text(
                  "Your Profile",
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: (27),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 82,
                      backgroundColor: Color(0xff212f44),
                      child:CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("assets/images/profile.jpg"),
                      ),


                    ),
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Color(0xfff9cedf),
                          border: Border.all(
                            color: Color(0xff212f44),
                            width: 2
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(

                                  child: QrImage(
                                    data: encriptedString,
                                    version: QrVersions.auto,
                                    size: MediaQuery.of(context).size.width*0.8,
                                  ),
                                );
                              },
                            );
                          },
                            child: Icon(Icons.qr_code_outlined)
                        ),
                      ),
                    ),


                  ],
                ),
                
                SizedBox(height: 30),
                Text(
                  name,
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: (27),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),



                Text(
                  "Contact - +91 "+contact,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (15),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Email ID - "+email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (15),
                  ),
                ),
                SizedBox(height: 50),


                RoundedLoadingButton(
                  successColor: kPrimaryColor,
                  duration: Duration(milliseconds: 1300),
                  width: (250),
                  height: (50),
                  color: kPrimaryTextColor,
                  child: Text(" Scan QR ",
                      style: TextStyle(
                          fontSize: (18),
                          color: Colors.white)),
                  controller: _btnController,
                  onPressed: () async {
                    Timer(Duration(milliseconds: 500), () {
                      _btnController.reset();
                    });
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrScanner()));

                  },
                ),

                SizedBox(height: 20),

                RoundedLoadingButton(
                  successColor: kPrimaryColor,
                  duration: Duration(milliseconds: 1300),
                  width: (250),
                  height: (50),
                  color: kPrimaryTextColor,
                  child: Text("Log Out",
                      style: TextStyle(
                          fontSize: (18),
                          color: Colors.white)),
                  controller: _btnController2,
                  onPressed: () async {
                    Timer(Duration(milliseconds: 500), () {
                      _btnController2.reset();
                    });
                    removeDataFromSP();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));

                  },
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}




