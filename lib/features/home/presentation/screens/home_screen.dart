import 'package:flutter/material.dart';
import 'package:tedx/features/home/presentation/widgets/sections/footer_section.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/sections/about_us_section.dart';
import '../widgets/sections/header_section.dart';
import '../widgets/sections/our_blogs_section.dart';
import '../widgets/sections/team_section.dart';
import '../widgets/sections/upcoming_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar().AppBar(screenWidth),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          child: const Column(
            spacing: 50,
            children: [
              HeaderSection(),
              AboutUsSection(),
              UpcomingEvent(),
              OurBlogsSection(),
              TeamSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
