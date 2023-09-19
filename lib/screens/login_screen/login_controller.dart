import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_profile/constants/app_onstant.dart';

import '../../constants/app_strings.dart';
import '../../constants/app_utils.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isRememberMe = false.obs;
  RxBool passwordVisible = false.obs;

  /// validate username
  String? validateUsername(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterUsername;
    }
    return null;
  }

  /// validate password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterPassword;
    }
    return null;
  }

  void loginNextButton() {
    final storage = GetStorage();
    final isValid = signInFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      if (userNameController.text != AppStrings.milanEmailAddress) {
        return Utils.validationCheck(
          message: AppStrings.userNameIncorrect,
          isError: true,
        );
      } else if (passwordController.text != 'milan') {
        return Utils.validationCheck(
          message: AppStrings.passwordIncorrect,
          isError: true,
        );
      } else {
        storage.write(AppConstants.isRememberMe, isRememberMe.value);
        Get.offAllNamed(Routes.homeScreen);
      }
    }
  }
}
