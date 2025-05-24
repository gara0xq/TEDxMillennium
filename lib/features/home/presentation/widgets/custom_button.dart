import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double margin;
  CustomButton({super.key, this.onTap, this.text = "", this.margin = 10});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Get.theme.colorScheme.primary),
        ),
        child: Text(text, style: Get.textTheme.bodyLarge),
      ),
    );
  }
}
