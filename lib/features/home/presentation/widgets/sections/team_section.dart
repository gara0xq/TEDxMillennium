import 'package:flutter/material.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

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
          Text("Team", style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(
            height: 100,
            width: screenWidth,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                  margin: const EdgeInsets.all(10),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
