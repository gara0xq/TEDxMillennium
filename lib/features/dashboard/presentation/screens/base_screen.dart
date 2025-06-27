import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/committee_section_provider.dart';
import '../widgets/committee_section.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/home_section.dart';
import '../widgets/side_button.dart';

class BaseScreen extends StatelessWidget {
  final String role;
  BaseScreen({super.key, this.role = "hr"});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommitteeSectionProvider(committeeName: role));
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar().appBar(width),
      drawer:
          width < 900
              ? Drawer(
                child: Container(
                  color: const Color(0xff131313),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      const SizedBox(height: 20),
                      if (role == "admin")
                        SideButton(
                          title: "Home Screen",
                          onTap: () => controller.changeScreen('home'),
                        ),
                      if (role == "admin" || role == "gd")
                        SideButton(
                          title: "GD Committee",
                          onTap: () => controller.changeScreen('gd'),
                        ),
                      if (role == "admin" || role == "cw")
                        SideButton(
                          title: "CW Committee",
                          onTap: () => controller.changeScreen('cw'),
                        ),
                      if (role == "admin" || role == "hr")
                        SideButton(
                          title: "HR Committee",
                          onTap: () => controller.changeScreen('hr'),
                        ),
                      if (role == "admin" || role == "pr")
                        SideButton(
                          title: "PR Committee",
                          onTap: () => controller.changeScreen('pr'),
                        ),
                      if (role == "admin" || role == "oc")
                        SideButton(
                          title: "OC Committee",
                          onTap: () => controller.changeScreen('oc'),
                        ),
                      if (role == "admin" || role == "reasearch")
                        SideButton(
                          title: "Research Committee",
                          onTap: () => controller.changeScreen('research'),
                        ),
                      if (role == "admin" || role == "marketing")
                        SideButton(
                          title: "Marketing Committee",
                          onTap: () => controller.changeScreen('marketing'),
                        ),
                      if (role == "admin" || role == "media")
                        SideButton(
                          title: "Media Committee",
                          onTap: () => controller.changeScreen('media'),
                        ),
                    ],
                  ),
                ),
              )
              : null,
      body: GetBuilder<CommitteeSectionProvider>(
        builder: (c) {
          return Row(
            children: [
              if (width > 900)
                Expanded(
                  child: Container(
                    color: const Color(0xff131313),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 20,
                      children: [
                        const SizedBox(height: 20),
                        if (role == "admin")
                          SideButton(
                            title: "Home Screen",
                            onTap: () => c.changeScreen('home'),
                          ),
                        if (role == "admin" || role == "gd")
                          SideButton(
                            title: "GD Committee",
                            onTap: () => c.changeScreen('gd'),
                          ),
                        if (role == "admin" || role == "cw")
                          SideButton(
                            title: "CW Committee",
                            onTap: () => c.changeScreen('cw'),
                          ),
                        if (role == "admin" || role == "hr")
                          SideButton(
                            title: "HR Committee",
                            onTap: () => c.changeScreen('hr'),
                          ),
                        if (role == "admin" || role == "pr")
                          SideButton(
                            title: "PR Committee",
                            onTap: () => c.changeScreen('pr'),
                          ),
                        if (role == "admin" || role == "oc")
                          SideButton(
                            title: "OC Committee",
                            onTap: () => c.changeScreen('oc'),
                          ),
                        if (role == "admin" || role == "research")
                          SideButton(
                            title: "Research Committee",
                            onTap: () => c.changeScreen('research'),
                          ),
                        if (role == "admin" || role == "marketing")
                          SideButton(
                            title: "Marketing Committee",
                            onTap: () => c.changeScreen('marketing'),
                          ),
                        if (role == "admin" || role == "media")
                          SideButton(
                            title: "Media Committee",
                            onTap: () => c.changeScreen('media'),
                          ),
                      ],
                    ),
                  ),
                ),
              Expanded(
                flex: 5,
                child:
                    c.committeeName == "home" && role == "admin"
                        ? HomeSection()
                        : CommitteeSection(committeeName: role),
              ),
            ],
          );
        },
      ),
    );
  }
}
