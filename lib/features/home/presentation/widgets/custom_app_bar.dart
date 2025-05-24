import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomAppBar {
  material.AppBar AppBar(double screenWidth) {
    return material.AppBar(
      leading: material.Padding(
        padding: const EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.centerRight,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      leadingWidth: screenWidth > 1200 ? screenWidth / 3.84 : 200,
      actions: [
        CustomButton(text: "Sign up"),
        CustomButton(text: "Login"),
        SizedBox(width: screenWidth > 1200 ? screenWidth / 5.8 : 20),
      ],
      toolbarHeight: 100,
    );
  }
}
