import 'package:flutter/material.dart';
import '../custom_button.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < 800;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.8,
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: EdgeInsets.symmetric(horizontal: screenWidth < 1200 ? 50 : 0),
      child: Row(
        spacing: 50,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 40,
              children: [
                const Text(
                  "Ideas worth spreading.",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut\nenim ad minim veniam",
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                CustomButton(text: "Upcoming events", margin: 0),
              ],
            ),
          ),
          if (!isMobile)
            Expanded(child: Image.asset("assets/images/circle.png")),
        ],
      ),
    );
  }
}
