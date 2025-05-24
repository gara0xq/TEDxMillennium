import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_button.dart';

class UpcomingEvent extends StatelessWidget {
  const UpcomingEvent({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 100,
        children: [
          Text("Upcoming Event", style: Get.textTheme.headlineLarge),
          if (isMobile)
            Center(child: Image.asset("assets/images/TedX.png", scale: 1.6)),
          Row(
            spacing: 50,
            children: [
              if (!isMobile)
                Expanded(
                  child: Center(
                    child: Image.asset("assets/images/TedX.png", scale: 1.6),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text("TEDx Event", style: Get.textTheme.headlineLarge),
                    Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
enim ad minim veniam''',
                      textAlign: isMobile ? TextAlign.center : TextAlign.start,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text("30-31st Jan 2021", style: Get.textTheme.bodyLarge),
                    Text("Anna Auditorium", style: Get.textTheme.bodyLarge),
                    const SizedBox(height: 10),
                    CustomButton(text: "Buy a Ticket", margin: 0),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
