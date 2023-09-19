import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_profile/constants/app_onstant.dart';

import '../../constants/app_strings.dart';

class HomeController extends GetxController {
  RxString avatarPath = ''.obs;

  /// validate name
  String? validateName(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterName;
    }

    return null;
  }

  /// Get from gallery
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    cropImage(pickedFile?.path);
  }

  /// Get from camera
  getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      cropImage(pickedFile.path);
    }
  }

  /// Crop Image
  cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      avatarPath.value = croppedImage.path;
      // print(avatarPath.value);
      GetStorage storage = GetStorage();
      storage.write(AppConstants.avatar, avatarPath.value);
    }
  }
}
