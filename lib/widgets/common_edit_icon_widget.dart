import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';

// Common Edit Icon Widget
class EditIconWidget extends StatelessWidget {
  const EditIconWidget({
    super.key,
    required this.onTap,
  });

  final Callback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor,
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          padding: EdgeInsets.all(1.w),
          child: Icon(
            Icons.edit_outlined,
            color: AppColors.whiteColor,
            size: 5.w,
          ),
        ),
      ),
    );
  }
}
