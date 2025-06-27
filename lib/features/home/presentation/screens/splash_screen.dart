import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 40,
            children: [
              Container(
                height: 170,
                width: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xff121212),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Image.asset("assets/images/logo.png"),
              ),
              if (controller.timer.value != "")
                Text(controller.timer.value, style: Get.textTheme.bodyLarge),
            ],
          );
        }),
      ),
    );
  }
}
