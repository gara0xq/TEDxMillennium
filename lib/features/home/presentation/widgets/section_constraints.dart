import 'package:flutter/material.dart';

class SectionConstraints extends StatelessWidget {
  final Widget child;
  const SectionConstraints({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < 800;
    return Container(
      width: screenWidth,
      height: isMobile ? screenHeight * 0.8 + 400 : screenHeight * 0.8,
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? screenWidth / 20 : 30,
      ),
      child: child,
    );
  }
}
