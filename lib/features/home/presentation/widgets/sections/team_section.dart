import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../provider/home_provider.dart';
import '../section_constraints.dart';

class TeamSection extends StatelessWidget {
  TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionConstraints(
      fixedHeight: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          const SizedBox(height: 100),
          Text("Team", style: Theme.of(context).textTheme.headlineLarge),
          GetBuilder<HomeProvider>(
            builder: (controller) {
              return GridView.builder(
                itemCount: controller.team.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisExtent: 350,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, i) {
                  final member = controller.team[i];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(member.imageUrl),
                        ),
                        // Container(
                        //   width: 250,
                        //   height: 250,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.grey,
                        //     image: DecorationImage(
                        //       image: NetworkImage(member.imageUrl),
                        //     ),
                        //   ),
                        // ),
                        Text(member.name, style: Get.textTheme.headlineMedium),
                        Text(member.role, style: Get.textTheme.bodyLarge),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
