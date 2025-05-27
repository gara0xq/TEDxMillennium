import 'package:flutter/material.dart';

class SectionConstraints extends StatelessWidget {
  final Widget child;
  final bool fixedHeight;
  final bool extentionSpace;
  const SectionConstraints({
    super.key,
    required this.child,
    this.fixedHeight = true,
    this.extentionSpace = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < 800;
    return Container(
      width: screenWidth,
      height:
          fixedHeight
              ? isMobile
                  ? extentionSpace
                      ? screenHeight * 0.9 + 300
                      : screenHeight * 0.9
                  : screenHeight * 0.9
              : null,
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? screenWidth / 20 : 30,
      ),
      child: child,
    );
  }
}
