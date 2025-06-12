import 'package:flutter/material.dart';

class SideButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const SideButton({super.key, this.title = "", this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: const Color(0xff191919),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(title),
      ),
    );
  }
}
