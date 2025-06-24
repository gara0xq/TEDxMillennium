import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../provider/home_section_provider.dart';

class EventTap extends StatelessWidget {
  const EventTap({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeSectionProvider>(
      builder: (c) {
        return Container(
          height: 800,
          width: width,
          constraints: const BoxConstraints(maxWidth: 700),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Switch(
                value: c.hasEvent,
                onChanged: (value) => c.updateStatics(value),
              ),
              TextFormField(
                controller: c.authorController,
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              TextFormField(
                controller: c.sloganController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Description",
                  alignLabelWithHint: true,
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              TextFormField(
                controller: c.contentController,

                decoration: InputDecoration(
                  labelText: "Date",
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              TextFormField(
                controller: c.contentController,

                decoration: InputDecoration(
                  labelText: "Location",
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              c.loadingImage
                  ? const Center(child: CircularProgressIndicator())
                  : InkWell(
                    onTap: () {
                      c.uploadImage(true);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Center(
                        child: Text(
                          "Upload Image",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              if (c.blogImageUrl.isNotEmpty)
                Image.network(c.blogImageUrl, height: 70, width: 70),
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
    );
  }
}
