import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'custom_button.dart';
import '../provider/home_provider.dart';

class CustomAppBar {
  material.AppBar AppBar(double screenWidth, bool isAdmin) {
    return material.AppBar(
      leading: material.Padding(
        padding: const EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.centerRight,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      leadingWidth: screenWidth > 1200 ? screenWidth / 3.84 : 150,
      actions: [
        GetBuilder<HomeProvider>(
          builder: (controller) {
            return Skeletonizer(
              enabled: controller.loading,
              ignoreContainers: true,
              child: Row(
                children: [
                  if (controller.statics.hasSignup)
                    CustomButton(text: "Sign up"),
                  if (controller.statics.hasLogin || isAdmin)
                    CustomButton(
                      text: "Login",
                      onTap: () => Get.toNamed('/auth'),
                    ),
                  if (controller.statics.hasSignup ||
                      controller.statics.hasLogin)
                    SizedBox(
                      width: screenWidth > 1200 ? screenWidth / 5.8 : 20,
                    ),
                ],
              ),
            );
          },
        ),
      ],
      toolbarHeight: 100,
    );
  }
}
