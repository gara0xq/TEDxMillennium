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
        fileName: filePath?.split('/').last ?? 'image',
        folder: 'tedx_millennium',
      );
      log(response.secureUrl!);
      return response.secureUrl!;
    } catch (e) {
      throw Exception("Error uploading image: $e");
    }
  }
}
