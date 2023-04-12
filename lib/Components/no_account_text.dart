import 'package:flutter/material.dart';

import '../constants.dart';

class NoAccountText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: (15)),
        ),
        GestureDetector(
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: (15),
                color: kPrimaryTextColor),
          ),
        ),
      ],
    );
  }
}
