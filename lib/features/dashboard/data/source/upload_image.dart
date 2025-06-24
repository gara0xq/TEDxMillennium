import 'dart:developer';
import 'dart:io';
import 'package:imagekit/imagekit.dart';

class UploadImage {
  final imagekit = ImageKit.getInstance();

  final config = const Configuration(
    publicKey: 'public_weUEZzJFUQWgYQCC3SJu+MgRS7Q=',
    urlEndpoint: 'https://ik.imagekit.io/bmzp7dfho',
    authenticationEndpoint:
        'https://tedx-millennium-iecp7h6r0-ali-ahmeds-projects-9146c19c.vercel.app/#/dashboard',
  );

  UploadImage() {
    imagekit.setConfig(config);
  }

  Future<String> uploadImage(File file) async {
    try {
      log(file.path);
      final response = await imagekit.upload(file);
      log(response.url);
      return response.url;
    } catch (e) {
      throw Exception("Error uploading image: $e");
    }
  }
}
