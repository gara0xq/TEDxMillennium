import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  "Add Blog",
                                  style: Get.textTheme.headlineLarge,
                                ),
                                TextFormField(
                                  controller: c.authorController,
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
                                  controller: c.sloganController,
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
                                  controller: c.contentController,
                                  maxLines: 10,
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
                                c.loadingImage
                                    ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                    : InkWell(
                                      onTap: () {
                                        c.uploadImage(true);
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
                                if (c.blogImageUrl.isNotEmpty)
                                  Image.network(
                                    c.blogImageUrl,
                                    height: 70,
                                    width: 70,
                                  ),
                                InkWell(
                                  onTap: () {
                                    c.addBlog();
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
