import 'package:flutter/material.dart';

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
                const Row(
                  children: [
                    Icon(Icons.facebook),
                    Icon(Icons.facebook),
                    Icon(Icons.facebook),
                    Icon(Icons.facebook),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Contact Us"),
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
