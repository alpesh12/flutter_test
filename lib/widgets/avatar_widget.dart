import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../constants/app_onstant.dart';
import '../screens/home_page/home_controller.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.controller,
    required this.storage,
  });

  final HomeController controller;
  final GetStorage storage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.userProfileBackColor,
        shape: BoxShape.circle,
      ),
      height: 30.w,
      width: 30.w,
      child: Obx(
        () {
          return controller.avatarPath.isNotEmpty
              ? ClipOval(
                  child: Image.file(
                    File(controller.avatarPath.value),
                    fit: BoxFit.cover,
                    height: 30.w,
                    width: 30.w,
                  ),
                )
              : storage.hasData(AppConstants.avatar)
                  ? ClipOval(
                      child: Image.file(
                        File(
                          storage.read(AppConstants.avatar),
                        ),
                        fit: BoxFit.cover,
                        height: 30.w,
                        width: 30.w,
                      ),
                    )
                  : Icon(
                      Icons.person,
                      size: 11.w,
                    );
        },
      ),
    );
  }
}
