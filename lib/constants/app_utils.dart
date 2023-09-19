import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';
import 'app_strings.dart';
import 'app_validator.dart';

class Utils {
  ///showSnackBar
  static void validationCheck(
      {String? message,
      bool isError = false,
      Color? barColor,
      Color? iconColor,
      Color? textColor}) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
        margin: EdgeInsets.only(bottom: 5.h, left: 7.w, right: 7.w),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 3500),
        backgroundColor: barColor ??
            (isError ? AppColors.errorColor : AppColors.successColor),
        borderRadius: 30,
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
        messageText: Row(
          children: [
            Icon(
              isError ? Icons.error_rounded : Icons.check_circle_rounded,
              color: iconColor ?? AppColors.whiteColor,
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Text(
                message ?? 'Empty message',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: textColor ?? AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  /// validate email
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterEmailAddress;
    } else if (!AppValidators.emailValidator.hasMatch(value)) {
      return AppStrings.invalidEmailAddress;
    }
    return null;
  }
}
