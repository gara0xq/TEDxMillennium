import 'package:flutter/material.dart';

class CustomAppBar {
  AppBar appBar(double screenWidth) {
    return AppBar(
      backgroundColor: const Color(0xff131313),

      foregroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ],
      toolbarHeight: 100,
    );
  }
}
