import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../provider/home_provider.dart';
import '../custom_button.dart';
import '../section_constraints.dart';

class HeaderSection extends StatelessWidget {
  BuildContext? eventContext;
  HeaderSection({super.key, required this.eventContext});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    return SectionConstraints(
      child: GetBuilder<HomeProvider>(
        builder: (controller) {
          return Skeletonizer(
            enabled: controller.loading,
            ignoreContainers: true,
            child: Row(
              spacing: 40,
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
                      Text(
                        controller.statics.headerTitle,
                        textAlign:
                            isMobile ? TextAlign.center : TextAlign.start,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        controller.statics.headerDescription,
                        textAlign:
                            isMobile ? TextAlign.center : TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      CustomButton(
                        text: "Upcoming events",
                        margin: 0,
                        onTap: () {
                          Scrollable.ensureVisible(
                            eventContext!,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                if (!isMobile)
                  Expanded(child: Image.asset("assets/images/circle.png")),
              ],
            ),
          );
        },
      ),
    );
  }
}
