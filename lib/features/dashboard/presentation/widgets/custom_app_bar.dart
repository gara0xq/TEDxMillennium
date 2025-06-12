import 'package:flutter/material.dart';

class CustomAppBar {
  AppBar appBar(double screenWidth) {
    return AppBar(
      backgroundColor: const Color(0xff131313),
      leading: Padding(
        padding: const EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      leadingWidth: screenWidth > 1200 ? screenWidth / 3.84 : 150,
      actions: [
        Row(
          children: [
            SizedBox(width: screenWidth > 1200 ? screenWidth / 5.8 : 20),
          ],
        ),
      ],
      toolbarHeight: 100,
    );
  }
}
