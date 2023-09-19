import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import 'splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    // to hide only bottom bar:
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
    );
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        alignment: Alignment.center,
        // color: AppColors.NEW_PRIMARY_COLOR,
        child: Center(
          child: FlutterLogo(size: 20.h),
        ),
      ),
    );
  }
}
