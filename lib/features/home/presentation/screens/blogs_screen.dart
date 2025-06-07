import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../provider/home_provider.dart';
import 'blog_screen.dart';

class BlogsScreen extends StatelessWidget {
  BlogsScreen({super.key});
  final controller = Get.find<HomeProvider>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Image.asset("assets/images/logo.png", scale: 3.5),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              const SizedBox(height: 20),
              GetBuilder<HomeProvider>(
                builder: (context) {
                  return Container(
                    width: width,
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.blogs.length,
                      itemBuilder: (_, i) {
                        final blog = controller.blogs[i];
                        return Skeletonizer(
                          enabled: controller.loading,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width < 600 ? 10 : 0,
                              vertical: 10,
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              titleAlignment: ListTileTitleAlignment.center,
                              tileColor: Colors.grey[900],
                              leading: Image.network(blog.imageUrl, scale: 0.2),
                              title: Text(
                                blog.author,
                                textAlign: TextAlign.right,
                              ),
                              subtitle: Text(
                                blog.slogan,
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () {
                                Get.to(() => BlogScreen(blog: blog));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
