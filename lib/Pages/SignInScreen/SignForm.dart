import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:scanapp/Pages/HomeScreen/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../Components/custom_surfix_icon.dart';
import '../../Components/form_error.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  String name="";
  String email="";
  String contact="";
  final RoundedLoadingButtonController _btnController =
  RoundedLoadingButtonController();

  List<String> errors = [];
  void addError(String error) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError(String error) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  addDataToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('spName', name);
    prefs.setString('spEmail', email);
    prefs.setString('spContact', contact);
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFormField("Name"),
          buildFormField("Email"),
          buildFormField("Contact"),
          Row(
            children: [
              Transform.scale(
                scale: (1.1),
                child: Checkbox(
                  value: remember,
                  activeColor: kPrimaryTextColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
              ),
              Text(
                "Remember me",
                style: TextStyle(fontSize: (13)),
              ),
            ],
          ),
          SizedBox(height: (20)),
          FormError(errors: errors),
          SizedBox(height: (50)),
          RoundedLoadingButton(
            successColor: kPrimaryColor,
            duration: Duration(milliseconds: 1300),
            width: (500),
            height: (56),
            color: kPrimaryTextColor,
            child: Text(" Continue ",
                style: TextStyle(
                    fontSize: (18),
                    color: Colors.white)),
            controller: _btnController,
            onPressed: () async {
              Timer(Duration(milliseconds: 500), () {
                _btnController.reset();
              });

              if(name!="" && email!="" && contact!=""){
                removeError("Fill in the details");
                addDataToSP();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));

              }
              else{
                addError("Fill in the details");
              }

            },
          ),
        ],
      ),
    );
  }


  Container buildFormField(title) {
    return Container(
      height: (80),
      child: TextFormField(
        onChanged: (x){
          if(title=="Name"){
            name=x;
          }
          if(title=="Email"){
            email=x;
          }
          if(title=="Contact"){
            contact=x;
          }
        },
        style: TextStyle(
          fontSize: (16),
        ),
        maxLength: title=="Contact"?10:50,
        keyboardType: title=="Contact"?TextInputType.phone:TextInputType.text,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: (15),
          ),
          hintStyle: TextStyle(
            fontSize: (16),
          ),
          labelText: title,
          hintText: "Enter your ${title}",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: title=="Contact"?CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"):title=="Name"?CustomSurffixIcon(svgIcon: "assets/icons/User.svg"):CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        ),
      ),
    );
  }




}


