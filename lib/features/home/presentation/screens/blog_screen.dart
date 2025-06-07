import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entity/blog_entity.dart';

class BlogScreen extends StatelessWidget {
  final BlogEntity? blog;
  BlogScreen({super.key, this.blog});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Image.asset("assets/images/logo.png", scale: 3.5),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width,

            constraints: const BoxConstraints(maxWidth: 1200),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 10 : 0,
              vertical: 20,
            ),
            alignment: Alignment.center,
            child: Row(
              spacing: 20,
              children: [
                if (!isMobile)
                  Container(
                    width: 500,
                    color: Colors.white,
                    padding: const EdgeInsets.all(7),
                    child: Image.network(blog!.imageUrl, fit: BoxFit.cover),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 10,
                    children: [
                      if (isMobile)
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(7),
                          child: Image.network(
                            blog!.imageUrl,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      Text(
                        blog!.author,
                        style: Get.textTheme.headlineLarge,
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        blog!.slogan,
                        style: Get.textTheme.headlineMedium,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        blog!.content,
                        style: Get.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[400],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
