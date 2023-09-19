import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_strings.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();

  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  /// validate username
  String? validateUsername(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterName;
    }
    return null;
  }

  /// validate position
  String? validatePosition(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterPosition;
    }
    return null;
  }

  /// validate company name
  String? validateCompanyName(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterCompanyName;
    }
    return null;
  }
}
