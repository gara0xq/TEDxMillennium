import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TapButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final bool isActive;
  const TapButton({
    super.key,
    this.onTap,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
        ),

        child: Text(
          title,
          style: Get.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: isActive ? Color(0xff171717) : Colors.white,
          ),
        ),
      ),
    );
  }
}
