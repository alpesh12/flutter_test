import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle get headingTitleTextStyle {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.black54Color,
    );
  }

  static TextStyle get headingTitle2ndTextStyle {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.blackColor,
    );
  }

  static TextStyle get headingSubTitleTextStyle {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10.sp,
    );
  }
}
