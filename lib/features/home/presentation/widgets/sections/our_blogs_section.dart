import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../provider/home_provider.dart';
import '../../screens/blog_screen.dart';
import '../custom_button.dart';
import '../section_constraints.dart';

class OurBlogsSection extends StatelessWidget {
  OurBlogsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    return SectionConstraints(
      extentionSpace: true,
      child: GetBuilder<HomeProvider>(
        init: HomeProvider(),
        builder: (controller) {
          return controller.blogs.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  if (!isMobile)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset("assets/images/triangle.png"),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 100,
                    children: [
                      Text("Our Blogs", style: Get.textTheme.headlineLarge),
                      if (isMobile)
                        Container(
                          width: screenWidth,
                          height: screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white, width: 5),
                            image: DecorationImage(
                              image: NetworkImage(controller.blogs[0].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Row(
                        spacing: 50,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  isMobile
                                      ? CrossAxisAlignment.center
                                      : CrossAxisAlignment.start,
                              spacing: 10,
                              children: [
                                Text(
                                  controller.blogs.isEmpty
                                      ? "N/A"
                                      : controller.blogs[0].author,
                                  style: Get.textTheme.headlineLarge,
                                ),
                                Text(
                                  controller.blogs.isEmpty
                                      ? "N/A"
                                      : controller.blogs[0].slogan,
                                  textAlign:
                                      isMobile
                                          ? TextAlign.center
                                          : TextAlign.start,
                                  style: Get.textTheme.headlineMedium,
                                ),

                                const SizedBox(height: 10),
                                CustomButton(
                                  text: "Read full blog",
                                  margin: 0,
                                  onTap:
                                      () => Get.to(
                                        () => BlogScreen(
                                          blog: controller.blogs.first,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          if (!isMobile)
                            Expanded(
                              child: Center(
                                child: Container(
                                  height: 400,
                                  constraints: const BoxConstraints(
                                    maxWidth: 400,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),

                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        controller.blogs[0].imageUrl,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      CustomButton(
                        text: "All blogs",
                        onTap: () => Get.toNamed('/blogs'),
                      ),
                    ],
                  ),
                ],
              );
        },
      ),
    );
  }
}
