import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../provider/home_provider.dart';
import '../custom_button.dart';
import '../section_constraints.dart';

class UpcomingEvent extends StatelessWidget {
  const UpcomingEvent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    return SectionConstraints(
      fixedHeight: false,
      child: GetBuilder<HomeProvider>(
        builder: (controller) {
          return !controller.statics.hasEvent
              ? const SizedBox()
              : Skeletonizer(
                enabled: controller.loading,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 100,
                  children: [
                    Text("Upcoming Event", style: Get.textTheme.headlineLarge),
                    if (isMobile)
                      Center(
                        child: Image.asset(
                          "assets/images/TedX.png",
                          scale: 1.6,
                        ),
                      ),
                    Row(
                      spacing: 50,
                      children: [
                        if (!isMobile)
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                "assets/images/TedX.png",
                                scale: 1.6,
                              ),
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
                              Text(
                                controller.statics.eventTitle,
                                style: Get.textTheme.headlineLarge,
                              ),
                              Text(
                                controller.statics.eventDescription,
                                textAlign:
                                    isMobile
                                        ? TextAlign.center
                                        : TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                controller.statics.date ??
                                    DateTime.now().toString(),
                                style: Get.textTheme.bodyLarge,
                              ),
                              Text(
                                controller.statics.location,
                                style: Get.textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                onTap: () => Get.toNamed("/tickets"),
                                text: "Buy a Ticket",
                                margin: 0,
                              ),
                            ],
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
