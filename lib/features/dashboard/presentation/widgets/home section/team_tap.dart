import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../provider/home_section_provider.dart';

class TeamTap extends StatelessWidget {
  const TeamTap({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeSectionProvider>(
      init: HomeSectionProvider(),
      builder: (controller) {
        return Skeletonizer(
          enabled: controller.loading,
          child: Column(
            spacing: 10,
            children: [
              Expanded(
                child: Container(
                  width: width,
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: ListView.builder(
                    itemCount: controller.teamMembers.length,
                    itemBuilder: (_, i) {
                      final member = controller.teamMembers[i];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width < 900 ? 0 : 15,
                          vertical: 10,
                        ),
                        child: Skeletonizer(
                          enabled: controller.loading,
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xff252525),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    member.imageUrl,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 5,
                                    children: [
                                      Text(member.name, maxLines: 1),
                                      Text(
                                        member.role,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                    Dialog(
                      child: GetBuilder<HomeSectionProvider>(
                        builder: (c) {
                          return Container(
                            height: 800,
                            width: width,
                            constraints: const BoxConstraints(maxWidth: 700),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xff252525),
                            ),
                            child: Column(
                              spacing: 30,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Add Member",
                                  style: Get.textTheme.headlineLarge,
                                ),
                                TextFormField(
                                  controller: c.memberNameController,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    labelStyle: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: c.roleController,
                                  decoration: InputDecoration(
                                    labelText: "Role",
                                    labelStyle: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ),

                                c.loadingImage
                                    ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                    : InkWell(
                                      onTap: () {
                                        c.uploadImage(false);
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            7,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Upload Image",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                if (c.memberImageUrl.isNotEmpty)
                                  Image.network(
                                    c.memberImageUrl,
                                    height: 70,
                                    width: 70,
                                  ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    c.addTeamMember();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Confirm",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: width,
                  constraints: const BoxConstraints(maxWidth: 600),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  alignment: Alignment.center,
                  child: const Text("Add Blog"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
