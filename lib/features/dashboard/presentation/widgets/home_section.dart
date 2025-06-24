import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/home_section_provider.dart';
import 'home section/blogs_tap.dart';
import 'home section/event_tap.dart';
import 'home section/team_tap.dart';
import 'tap_button.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GetBuilder<HomeSectionProvider>(
        init: HomeSectionProvider(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
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
              if (controller.tapIndex == 0) const Expanded(child: BlogsTap()),
              if (controller.tapIndex == 1) const Expanded(child: EventTap()),
              if (controller.tapIndex == 2) const Expanded(child: TeamTap()),
            ],
          );
        },
      ),
    );
  }
}
