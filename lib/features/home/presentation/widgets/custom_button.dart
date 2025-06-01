import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double margin;
  final Alignment? align;
  CustomButton({
    super.key,
    this.onTap,
    this.text = "",
    this.margin = 3,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          margin: EdgeInsets.symmetric(horizontal: margin),
          alignment: align,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Get.theme.colorScheme.primary),
          ),
          child: Text(text, style: Get.textTheme.bodyLarge),
        ),
      ),
    );
  }
}
