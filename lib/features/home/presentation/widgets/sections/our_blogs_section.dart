import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_button.dart';
import '../section_constraints.dart';

class OurBlogsSection extends StatelessWidget {
  const OurBlogsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    return SectionConstraints(
      child: Stack(
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
                  height: 500,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white, width: 5),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/malak hatem.jpg"),
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
                        Text("Malak Hatem", style: Get.textTheme.headlineLarge),
                        Text(
                          '''بين  التحديات و الفرص يوجد من بيني جسورا للأحلام''',
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.start,
                          style: Get.textTheme.headlineMedium,
                        ),

                        const SizedBox(height: 10),
                        CustomButton(text: "Read full blog", margin: 0),
                      ],
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
                                "assets/images/malak hatem.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              CustomButton(text: "All blogs"),
            ],
          ),
        ],
      ),
    );
  }
}
