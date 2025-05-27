import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../provider/home_provider.dart';
import '../section_constraints.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    return SectionConstraints(
      child: GetBuilder<HomeProvider>(
        builder: (controller) {
          return Skeletonizer(
            enabled: controller.loading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 100,
              children: [
                Text(
                  "About Us",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  spacing: 50,
                  children: [
                    Expanded(
                      child: Text(
                        controller.statics.aboutUs,
                        textAlign:
                            isMobile ? TextAlign.center : TextAlign.start,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
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
                                image: AssetImage(
                                  "assets/images/TEDx banner.png",
                                ),
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
        },
      ),
    );
  }
}
