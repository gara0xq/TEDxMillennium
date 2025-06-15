import 'package:image_picker/image_picker.dart';

class PhoneImagePicker {
  Future<Map<String, dynamic>> call() async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.gallery);
    final imageBytes = await imageFile!.readAsBytes().then((e) => e.toList());
    final imageFilePath = imageFile.path;

    return {'imageFilePath': imageFilePath, 'imageBytes': imageBytes};
  }
}
