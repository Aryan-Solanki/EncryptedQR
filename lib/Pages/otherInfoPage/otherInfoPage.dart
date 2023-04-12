import 'package:flutter/material.dart';
import '../../constants.dart';

class otherInfoPage extends StatefulWidget {
  final String? data;

  const otherInfoPage ({ Key? key, required this.data }): super(key: key);

  @override
  _otherInfoPageState createState() => _otherInfoPageState();
}

class _otherInfoPageState extends State<otherInfoPage> {
    List<String> data=["0","0","0"];

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    data = widget.data!.split(",");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Color(0xfff9cedf),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: (20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  "Meet!!",
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: (27),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height:30),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/profilemale.png"),
                ),
                SizedBox(height: 30),
                Text(
                  data[0],
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: (27),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),



                Text(
                  "Contact - +91 "+data[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (15),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Email ID - "+data[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (15),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}

