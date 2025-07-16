import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../home/presentation/widgets/custom_button.dart';
import '../provider/ticket_provider.dart';
import '../widgets/input_field.dart';

class TicketScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final controller = Get.put(TicketProvider());
  TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<TicketProvider>(
          builder: (c) {
            return Center(
              child: Container(
                width: width,
                constraints: BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: height * 0.05,
                ),
                child: Column(
                  spacing: 40,
                  children: [
                    Text(
                      "Book Ticket",
                      style: Get.textTheme.headlineLarge!.copyWith(
                        color: Colors.red,
                      ),
                    ),

                    SlideCountdown(
                      duration: DateTime(
                        2025,
                        7,
                        28,
                        9,
                      ).difference(DateTime.now()),
                      separatorPadding: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      separator: ":",
                    ),
                    InputField(
                      controller: controller.nameController,
                      title: "Name",
                    ),
                    InputField(
                      controller: controller.emailController,
                      title: "Email",
                    ),
                    InputField(
                      controller: controller.phoneController,
                      title: "Phone number",
                    ),
                    InputField(
                      controller: controller.studyController,
                      title: "Study / work field",
                    ),
                    InputField(
                      controller: controller.whyAttendController,
                      title: "Why are you attending our event?",
                    ),
                    CustomButton(
                      onTap: () => controller.bookTicket(),
                      text: "Book Now",
                    ),
                    // c.combinedImage == null
                    //     ? const CircularProgressIndicator()
                    //     : RawImage(image: c.combinedImage),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
