import 'dart:developer';
import 'package:cloudinary/cloudinary.dart';

class UploadImage {
  final Cloudinary cloudinary = Cloudinary.signedConfig(
    apiKey: "783963798515812",
    apiSecret: "eyEzoiUB0N_LocVsUzBOMTrrMBE",
    cloudName: "dww2nervs",
  );

  Future<String> uploadImage(String? filePath, List<int>? fileBytes) async {
    try {
      final response = await cloudinary.upload(
        file: filePath,
        fileBytes: fileBytes,
        resourceType: CloudinaryResourceType.image,
      );
      log("Image upload response: ${response.url.toString()}");
      log("Image uploaded successfully: ${response.isSuccessful}");
      return response.url!;
    } catch (e) {
      log("Error uploading image: $e");
      throw Exception("Error uploading image: $e");
    }
  }
}
