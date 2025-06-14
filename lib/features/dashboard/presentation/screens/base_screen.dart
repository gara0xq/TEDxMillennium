import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/dashboard_provider.dart';
import '../widgets/committee_section.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/home_section.dart';
import '../widgets/side_button.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});
  final controller = Get.put(DashboardProvider());
  @override
  Widget build(BuildContext context) {
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
                      SideButton(
                        title: "Home Screen",
                        onTap: () => controller.changeScreen('home'),
                      ),
                      SideButton(
                        title: "GD Committee",
                        onTap: () => controller.changeScreen('gd'),
                      ),
                      SideButton(
                        title: "CW Committee",
                        onTap: () => controller.changeScreen('cw'),
                      ),
                      SideButton(
                        title: "HR Committee",
                        onTap: () => controller.changeScreen('hr'),
                      ),
                      SideButton(
                        title: "PR Committee",
                        onTap: () => controller.changeScreen('pr'),
                      ),
                      SideButton(
                        title: "OC Committee",
                        onTap: () => controller.changeScreen('oc'),
                      ),
                      SideButton(
                        title: "Research Committee",
                        onTap: () => controller.changeScreen('research'),
                      ),
                      SideButton(
                        title: "Marketing Committee",
                        onTap: () => controller.changeScreen('marketing'),
                      ),
                      SideButton(
                        title: "Media Committee",
                        onTap: () => controller.changeScreen('media'),
                      ),
                    ],
                  ),
                ),
              )
              : null,
      body: Obx(() {
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
                      SideButton(
                        title: "Home Screen",
                        onTap: () => controller.changeScreen('home'),
                      ),
                      SideButton(
                        title: "GD Committee",
                        onTap: () => controller.changeScreen('gd'),
                      ),
                      SideButton(
                        title: "CW Committee",
                        onTap: () => controller.changeScreen('cw'),
                      ),
                      SideButton(
                        title: "HR Committee",
                        onTap: () => controller.changeScreen('hr'),
                      ),
                      SideButton(
                        title: "PR Committee",
                        onTap: () => controller.changeScreen('pr'),
                      ),
                      SideButton(
                        title: "OC Committee",
                        onTap: () => controller.changeScreen('oc'),
                      ),
                      SideButton(
                        title: "Research Committee",
                        onTap: () => controller.changeScreen('research'),
                      ),
                      SideButton(
                        title: "Marketing Committee",
                        onTap: () => controller.changeScreen('marketing'),
                      ),
                      SideButton(
                        title: "Media Committee",
                        onTap: () => controller.changeScreen('media'),
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
              flex: 5,
              child:
                  controller.currentScreen == "home"
                      ? HomeSection()
                      : CommitteeSection(),
            ),
          ],
        );
      }),
    );
  }
}
