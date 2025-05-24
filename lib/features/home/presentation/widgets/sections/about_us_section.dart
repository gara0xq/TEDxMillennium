import 'package:flutter/material.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

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
          Text("About Us", style: Theme.of(context).textTheme.headlineLarge),
          Row(
            spacing: 50,
            children: [
              Expanded(
                child: Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
enim ad minim veniam, quis nostrud exercitation ullamco laboris
nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
dolore eu fugiat nulla pariatur.
Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
ea commodo consequat''',
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              if (!isMobile)
                Expanded(
                  child: Center(
                    child: Container(
                      height: 400,
                      constraints: const BoxConstraints(maxWidth: 400),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white, width: 5),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/TEDx banner.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
