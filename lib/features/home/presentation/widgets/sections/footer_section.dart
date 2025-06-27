import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0xff101010),
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: screenWidth / 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                Image.asset("assets/images/TedX.png", scale: 2),
                Row(
                  spacing: 10,
                  children: [
                    Image.asset(
                      "assets/icons/facebook.png",
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      "assets/icons/instagram.png",
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      "assets/icons/tiktok.png",
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      "assets/icons/linkedin.png",
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Contact Us", style: Get.textTheme.bodyLarge),
                Text("+20 100 0000 000"),
                Text("example@gamil.com"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
