import 'package:flutter/material.dart';

import '../section_constraints.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    return SectionConstraints(
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
