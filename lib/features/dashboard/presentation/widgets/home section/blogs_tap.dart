import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../provider/home_section_provider.dart';

class BlogsTap extends StatelessWidget {
  const BlogsTap({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeSectionProvider>(
      init: HomeSectionProvider(),
      builder: (controller) {
        return Column(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                width: width,
                constraints: const BoxConstraints(maxWidth: 600),
                child: ListView.builder(
                  itemCount: controller.blogs.length,
                  itemBuilder: (_, i) {
                    final blog = controller.blogs[i];
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
                                backgroundImage: NetworkImage(blog.imageUrl),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 5,
                                  children: [
                                    Text(blog.author, maxLines: 1),
                                    Text(
                                      blog.slogan,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => controller.removeBlog(blog),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
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
                    child: Container(
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
                        children: [
                          Text("Add Blog", style: Get.textTheme.headlineLarge),
                          const SizedBox(height: 30),
                          TextFormField(
                            // controller: ,
                            decoration: InputDecoration(
                              labelText: "Auther Name",
                              labelStyle: const TextStyle(
                                color: Colors.white70,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          TextFormField(
                            // controller: ,
                            decoration: InputDecoration(
                              labelText: "Slogan",
                              labelStyle: const TextStyle(
                                color: Colors.white70,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          TextFormField(
                            // controller: ,
                            maxLines: 6,
                            decoration: InputDecoration(
                              labelText: "Content",
                              alignLabelWithHint: true,
                              labelStyle: const TextStyle(
                                color: Colors.white70,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.uploadImage();
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: Text(
                                  "Upload Image",
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
        );
      },
    );
  }
}
