import 'package:get/get.dart';
import 'package:my_profile/screens/edit_profile/edit_profile_controller.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditProfileController());
  }
}
