import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/home_section_provider.dart';
import 'tap_button.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GetBuilder<HomeSectionProvider>(
        init: HomeSectionProvider(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff353535),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TapButton(
                        title: "Blogs",
                        isActive: controller.tapIndex == 0 ? true : false,
                        onTap: () => controller.changeTapIndex(0),
                      ),
                    ),
                    Expanded(
                      child: TapButton(
                        title: "Event",
                        isActive: controller.tapIndex == 1 ? true : false,
                        onTap: () => controller.changeTapIndex(1),
                      ),
                    ),
                    Expanded(
                      child: TapButton(
                        title: "Team",
                        isActive: controller.tapIndex == 2 ? true : false,
                        onTap: () => controller.changeTapIndex(2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
