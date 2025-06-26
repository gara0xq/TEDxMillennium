import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../provider/committee_section_provider.dart';

class CommitteeSection extends StatelessWidget {
  final String committeeName;
  CommitteeSection({super.key, required this.committeeName});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<CommitteeSectionProvider>(
      init: CommitteeSectionProvider(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: const Color(0xff131313),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${committeeName.toUpperCase()} Committee",
                      style: Get.textTheme.headlineMedium,
                    ),
                    Text(
                      controller.committeeMembers.length.toString(),
                      style: Get.textTheme.headlineMedium!.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: double.infinity,
                    height:
                        controller.loading ||
                                controller.committeeMembers.isEmpty
                            ? 50
                            : null,
                    alignment:
                        controller.loading ||
                                controller.committeeMembers.isEmpty
                            ? Alignment.center
                            : null,
                    decoration: BoxDecoration(
                      color: const Color(0xff131313),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child:
                        controller.loading
                            ? const CircularProgressIndicator()
                            : controller.committeeMembers.isEmpty
                            ? const Text(
                              "No members found",
                              textAlign: TextAlign.center,
                            )
                            : ListView.separated(
                              shrinkWrap: true,
                              itemCount: controller.committeeMembers.length,
                              separatorBuilder:
                                  (_, i) => const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Divider(color: Colors.grey),
                                  ),
                              itemBuilder: (context, index) {
                                final member =
                                    controller.committeeMembers[index];
                                return Skeletonizer(
                                  enabled: controller.loading,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            member.name,
                                            style: Get.textTheme.bodyLarge,
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              member.role == "z"
                                                  ? "Member"
                                                  : member.role,
                                              style: Get.textTheme.bodyLarge!
                                                  .copyWith(color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                    Dialog(
                      child: Container(
                        height: 400,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add Member",
                              style: Get.textTheme.headlineLarge,
                            ),

                            TextFormField(
                              controller: controller.nameController,
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
                              controller: controller.roleController,
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

                            InkWell(
                              onTap: () async {
                                log("message");
                                controller.addMember();
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
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      "Add Member",
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
